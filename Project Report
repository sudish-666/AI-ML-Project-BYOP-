# AI-Powered Travel Route Finder

Project Report

1. Introduction

Route planning plays a key role in daily travel. Most basic systems focus only on finding the shortest distance between two locations. This approach ignores factors like travel time, which affects real decisions.

This project presents a hybrid system that combines logic programming with machine learning. It uses Prolog to find optimal routes and a simple ML model to estimate travel time. The goal is to improve decision-making by adding prediction to traditional pathfinding.

2. Problem Statement

People often select routes based only on distance. This does not always lead to efficient travel because time depends on multiple factors like road conditions and traffic.

There is a need for a system that:

* Finds the shortest route
* Estimates travel time
* Helps users choose better routes

3. Objectives

* Represent cities and roads as a graph
* Find all possible routes between two cities
* Calculate total distance of each route
* Identify the shortest path
* Predict travel time using machine learning
* Build a simple interactive system

4. Methodology

4.1 Graph Representation

The map is modeled as a weighted graph using Prolog facts.
Each road is defined with a distance between two cities.

Example:
road(delhi, jaipur, 280).

Bidirectional travel is handled using a connection rule.

4.2 Pathfinding Using Prolog

The system uses recursion and backtracking to explore routes.

* travel/6 explores all possible paths
* Avoids revisiting cities to prevent loops
* Accumulates distance step by step

The path/4 predicate builds complete routes and calculates total distance.

4.3 Shortest Path Selection

The system uses setof/3 to collect all possible routes in the format:

Distance - Path

Since the result is sorted automatically, the first element represents the shortest path.

4.4 Machine Learning Model

A Linear Regression model is used to estimate travel time.

* Input: Distance (km)
* Output: Time (hours)

The model is trained using a simple dataset where time increases proportionally with distance.

Example dataset:

| Distance | Time |
| -------- | ---- |
| 100      | 2    |
| 200      | 4    |
| 300      | 6    |

This allows the system to predict travel duration for any computed route.

4.5 System Workflow

1. User enters start and destination city
2. Prolog finds all possible routes
3. Shortest route is selected
4. Distance is calculated
5. ML model predicts travel time
6. Result is displayed to the user

5. Implementation

5.1 Tools and Technologies

* Prolog (SWI-Prolog) for logic programming
* Python for ML model
* Scikit-learn for Linear Regression

5.2 Key Components

* road/3: Stores city connections
* connection/3: Handles bidirectional travel
* travel/6: Core recursive logic
* path/4: Builds routes and computes distance
* shortest_path/4: Selects optimal route

5.3 Output Example

Route: Delhi → Agra → Gwalior → Bhopal
Distance: 830 km
Estimated Time: 13.5 hours

6. Results

The system successfully:

* Found valid routes between cities
* Calculated accurate distances
* Identified shortest paths
* Predicted travel time using ML

The integration of ML added practical value by converting distance into meaningful time estimates.

7. Challenges Faced

* Designing recursion without infinite loops
* Managing backtracking efficiently
* Creating a usable dataset for ML
* Integrating logic programming with ML concepts

8. Limitations

* Uses a small predefined dataset
* Travel time prediction is simplified
* No real-time traffic or dynamic data
* Limited number of cities

9. Future Scope

* Integrate real-time traffic APIs
* Use advanced ML models for better prediction
* Expand dataset with more cities
* Build a graphical interface
* Add multiple route comparison based on time

10. Conclusion

This project demonstrates how combining logic programming with machine learning improves route planning. The system moves beyond simple shortest-path solutions by introducing prediction.

It highlights practical use of AI concepts in solving real-world problems and shows how different technologies work together to produce better results.

11. Learning Outcomes

* Applied graph concepts using Prolog
* Used recursion and backtracking for problem solving
* Implemented shortest path logic
* Learned basics of regression in ML
* Understood integration of AI with traditional systems

12. References

* SWI-Prolog Documentation
* Scikit-learn Documentation
* Basic concepts of Graph Theory
* Fundamentals of Machine Learning

