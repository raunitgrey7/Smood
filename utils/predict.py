import pickle
import numpy as np

with open("model/mood_model.pkl", "rb") as f:
    model = pickle.load(f)

def predict_mood(data_dict):
    # Extract and preprocess feature values
    raw_values = list(data_dict.values())
    processed_values = []

    for val in raw_values:
        try:
            # Convert to float if possible
            processed_values.append(float(val))
        except (ValueError, TypeError):
            # Encode categorical string as numeric fallback (simple hash)
            processed_values.append(hash(val) % 1000)

    input_vector = np.array([processed_values])  # shape: (1, n_features)
    prediction = model.predict(input_vector)[0]
    return prediction
