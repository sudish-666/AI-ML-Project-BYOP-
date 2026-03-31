# =============================================================
# Travel Time Predictor - Machine Learning Model
# AI-Powered Travel Route Finder | BYOP Project
# Author: Sudish Agarwal | VIT Bhopal | 25BCE11358
# =============================================================
#
# This script trains a Linear Regression model to predict
# travel time (in hours) based on distance (in km).
#
# It also integrates with the Prolog route finder by accepting
# a distance value and returning the predicted travel time.
# =============================================================

import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score
import warnings
warnings.filterwarnings('ignore')

# -------------------------------------------------------
# 1. DATASET
# -------------------------------------------------------
# Real-world inspired distance vs travel time data
# based on Indian highway travel conditions.
# Factors like road quality, traffic, stops are reflected
# in the travel time (not just speed = distance/time).

data = [
    # (distance_km, travel_time_hours)
    (150,  2.5),   # Mumbai - Pune
    (230,  4.0),   # Delhi - Agra
    (280,  5.0),   # Delhi - Jaipur
    (320,  5.5),   # Lucknow - Varanasi
    (330,  6.0),   # Agra - Lucknow
    (350,  6.5),   # Bhopal - Nagpur
    (390,  7.0),   # Jaipur - Udaipur
    (480,  8.5),   # Gwalior - Bhopal
    (500,  9.0),   # Nagpur - Hyderabad
    (530,  9.5),   # Ahmedabad - Mumbai
    (570, 10.5),   # Hyderabad - Bengaluru
    (675, 12.0),   # Jaipur - Ahmedabad
    (120,  2.0),   # Agra - Gwalior
    (800, 14.0),   # Long highway route
    (950, 16.5),   # Very long route
    (1100, 19.0),  # Cross-country
    (1300, 22.5),  # Long distance
    (1485, 24.5),  # Delhi -> Jaipur -> Ahmedabad -> Mumbai
    (200,  3.5),   # Medium route with traffic
    (450,  8.0),   # Medium-long route
]

# Convert to numpy arrays
distances = np.array([d[0] for d in data]).reshape(-1, 1)
times     = np.array([d[1] for d in data])

# -------------------------------------------------------
# 2. TRAIN / TEST SPLIT
# -------------------------------------------------------
X_train, X_test, y_train, y_test = train_test_split(
    distances, times, test_size=0.2, random_state=42
)

# -------------------------------------------------------
# 3. TRAIN LINEAR REGRESSION MODEL
# -------------------------------------------------------
model = LinearRegression()
model.fit(X_train, y_train)

# -------------------------------------------------------
# 4. EVALUATE MODEL
# -------------------------------------------------------
y_pred = model.predict(X_test)
mse    = mean_squared_error(y_test, y_pred)
r2     = r2_score(y_test, y_pred)

print("=" * 50)
print("   TRAVEL TIME PREDICTION MODEL")
print("   Linear Regression | Scikit-learn")
print("=" * 50)
print(f"\nModel Training Complete.")
print(f"  Coefficient (slope) : {model.coef_[0]:.4f} hrs/km")
print(f"  Intercept           : {model.intercept_:.4f} hrs")
print(f"\nModel Evaluation (Test Set):")
print(f"  Mean Squared Error  : {mse:.4f}")
print(f"  R² Score            : {r2:.4f}")
print()

# -------------------------------------------------------
# 5. PREDICTION FUNCTION
# -------------------------------------------------------
def predict_travel_time(distance_km):
    """
    Predicts travel time in hours for a given distance in km.

    Parameters:
        distance_km (float): Distance of the route in kilometers.

    Returns:
        float: Predicted travel time in hours (rounded to 1 decimal).
    """
    prediction = model.predict(np.array([[distance_km]]))[0]
    return round(max(prediction, 0), 1)  # Ensure non-negative

# -------------------------------------------------------
# 6. INTERACTIVE DEMO
# -------------------------------------------------------
def run_demo():
    print("=" * 50)
    print("   ROUTE TRAVEL TIME PREDICTOR")
    print("=" * 50)
    print("\nExample route predictions from the Prolog map:\n")

    example_routes = [
        ("Delhi",     "Jaipur",    280),
        ("Delhi",     "Agra",      230),
        ("Mumbai",    "Pune",      150),
        ("Nagpur",    "Hyderabad", 500),
        ("Jaipur",    "Ahmedabad", 675),
        ("Delhi",     "Mumbai",   1485),  # Full shortest path distance
    ]

    for src, dst, dist in example_routes:
        predicted = predict_travel_time(dist)
        print(f"  {src:<12} -> {dst:<12} | {dist:>5} km | ~{predicted} hrs")

    print()
    print("-" * 50)
    print("Enter a custom distance to predict travel time.")
    print("Type 'quit' to exit.\n")

    while True:
        user_input = input("Enter distance in km (or 'quit'): ").strip()
        if user_input.lower() == 'quit':
            print("Exiting predictor. Goodbye!")
            break
        try:
            distance = float(user_input)
            if distance <= 0:
                print("  Please enter a positive distance.")
                continue
            predicted = predict_travel_time(distance)
            print(f"  Predicted travel time for {distance:.0f} km: ~{predicted} hours\n")
        except ValueError:
            print("  Invalid input. Please enter a number.\n")

# -------------------------------------------------------
# 7. ENTRY POINT
# -------------------------------------------------------
if __name__ == "__main__":
    run_demo()
