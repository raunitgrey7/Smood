import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
import pickle

# Load data
df = pd.read_csv("labeled_mood_data.csv")
df.columns = df.columns.str.strip()

# Encode categorical variables
df = pd.get_dummies(df)

# Split features and labels
mood_cols = ['Mood_Anxious', 'Mood_Depressed', 'Mood_Happy']

# Create a single 'Mood' column from the one-hot encoded values
df['Mood'] = df[mood_cols].idxmax(axis=1).str.replace('Mood_', '')

# Drop the one-hot mood columns
X = df.drop(mood_cols + ['Mood'], axis=1)
y = df['Mood']

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)

# Evaluate
print(f"Accuracy: {model.score(X_test, y_test):.2f}")

# Save model
with open("mood_model.pkl", "wb") as f:
    pickle.dump(model, f)

print("Model saved to mood_model.pkl")
