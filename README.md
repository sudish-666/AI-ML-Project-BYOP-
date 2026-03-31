# AI-Powered Travel Route Finder (Prolog + Machine Learning)

## Project Overview

This project solves a real-world problem of route selection by combining logic programming with machine learning.

Traditional route systems focus only on distance. In real travel, time matters more due to traffic and road conditions. This project finds the shortest route between cities and also predicts travel time using a simple ML model.

It demonstrates how AI techniques work alongside classical algorithms to improve decision-making.

---

## Problem Statement

People often choose routes based only on distance, which does not always lead to the fastest journey. There is a need for a system that not only finds optimal paths but also estimates travel time.

---

## Objectives

- Find all possible routes between two cities
- Calculate total distance for each route
- Identify the shortest path using Prolog
- Predict travel time using a Machine Learning model
- Provide a simple and interactive user interface

---

## Technologies Used

| Technology | Purpose |
|------------|---------|
| Prolog (SWI-Prolog) | Route logic and pathfinding |
| Python 3 | Machine Learning model |
| Scikit-learn | Linear Regression |

---

## System Approach

### 1. Graph Representation
Cities and roads are represented as a weighted graph using facts in Prolog.

### 2. Pathfinding Logic
- Uses recursion and backtracking
- Explores all possible routes
- Avoids cycles
- Calculates total distance

### 3. Shortest Path Selection
- Uses `setof/3` to collect all routes
- Automatically selects the minimum distance path

### 4. Machine Learning Integration
- Linear Regression model predicts travel time
- Input: Distance (km)
- Output: Estimated time (hours)

---

## Features

- Bidirectional road connections
- Finds all possible routes
- Computes total distance
- Detects shortest path automatically
- Predicts travel time using ML
- Simple command-line interface

---

## Example Output

```
Route: Delhi → Jaipur → Ahmedabad → Mumbai
Distance: 1485 km
Estimated Time: 24.5 hours
```

---

## How to Run

### Step 1: Install Requirements

- Install [SWI-Prolog](https://www.swi-prolog.org/Download.html)
- Install Python 3
- Install required library:

```bash
pip install -r requirements.txt
```

### Step 2: Run Prolog Program

```bash
swipl prolop.pl
```

Then start:

```prolog
?- start.
```

### Step 3: Run ML Model

```bash
python model.py
```

---

## Project Structure

```
AI-ML-Project-BYOP/
├── prolop.pl          → Main Prolog program
├── model.py           → Machine Learning model
├── requirements.txt   → Python dependencies
├── Project_Report.md  → Project report
└── README.md          → Project documentation
```

---

## Learning Outcomes

- Understand graph representation in Prolog
- Apply recursion and backtracking
- Learn shortest path logic without built-in algorithms
- Use Linear Regression for prediction
- Combine AI with logic programming

---

## Challenges Faced

- Managing recursion without infinite loops
- Integrating Prolog with Machine Learning
- Creating meaningful dataset for prediction

---

## Future Improvements

- Use real-time traffic data
- Add graphical user interface
- Improve prediction accuracy with advanced models
- Expand map with more cities

---

## Conclusion

This project shows how combining logic programming with machine learning improves real-world problem solving. It moves beyond simple pathfinding by adding predictive intelligence, making route decisions more practical and useful.

---

## License

Free for academic and educational use.
