# 😄 Mood Detection API (Smood)

A FastAPI-based backend for predicting mood using a machine learning model trained on survey data.

---

## 📦 Project Structure

```
SMOOD/
├── main.py                  # FastAPI app
├── schemas/
│   └── input_schema.py      # Input data model using Pydantic
├── utils/
│   └── predict.py           # Prediction logic (if any extra)
├── model.pkl                # Trained ML model with preprocessing (Pipeline)
├── requirements.txt         # Python dependencies
└── README.md
```

---

## 🚀 What We Have Done So Far

✅ Built a FastAPI backend with a `/predict` endpoint  
✅ Defined input schema using Pydantic (`input_schema.py`)  
✅ Trained a machine learning model with preprocessing (160 features)  
✅ Saved the model as `model.pkl`  
✅ Connected the API to the model  
✅ Tested the API with Swagger UI and fixed JSON input issues  
✅ Identified mismatch issue: input data must match the preprocessed feature count  
✅ (Pending) Reconnect full preprocessing pipeline into model.pkl or replicate it manually

---

## 🛠 Installation Instructions

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/smood.git
cd smood
```

2. **Create and activate virtual environment**

```bash
python -m venv .venv
source .venv/bin/activate   # On Windows: .venv\Scripts\activate
```

3. **Install required packages**

```bash
pip install -r requirements.txt
```

4. **Run the FastAPI server**

```bash
uvicorn main:app --reload
```

Visit [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs) to access Swagger UI.

---

## 📄 Example Request

```json
POST /predict

{
  "gender": "male",
  "religion": "hinduism",
  "age": 20,
  ...
  "one_problem": "procrastination"
}
```

---

## 📤 Share Your API with Friends

1. Push your project to GitHub:

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/smood.git
git push -u origin main
```

2. Share the GitHub link with friends. They can run it locally using the steps above.

---

## 📅 Last Updated

June 19, 2025