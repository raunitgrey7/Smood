from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from schemas.input_schema import MoodInput
import pickle

# Load model once when API starts
with open("model.pkl", "rb") as f:
    model = pickle.load(f)

app = FastAPI()

# Enable CORS for frontend (adjust origins in production)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # or ["http://localhost:3000"] etc.
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def home():
    return {"message": "Mood Detection API is live"}

@app.post("/predict")
def predict(input: MoodInput):
    print("Received input:", input)  # Debug: logs incoming request

    try:
        # Convert input to the correct order of features expected by model
        features = [
            input.age,
            input.siblings,
            input.socializing_skill,
            input.sleep_score,
            input.free_hour,
            input.patience,
            input.support,
            input.procrastination,
        ]

        prediction = model.predict([features])
        return {"prediction": int(prediction[0])}
    
    except Exception as e:
        print("Prediction error:", e)  # More detailed error log
        return {"error": str(e)}
