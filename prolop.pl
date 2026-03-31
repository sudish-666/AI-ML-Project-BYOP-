/* =======================================================
   Travel Route Finder in Prolog
   -------------------------------------------------------
   This program:

   1. Stores a small map of cities and road distances.
   2. Finds routes between two cities.
   3. Calculates total distance of each route.
   4. Finds the shortest route using backtracking.

   To run:
   ?- start.

   Or directly:
   ?- shortest_path(delhi, mumbai, Path, Distance).
   ======================================================= */

% -------------------------------------------------------
% 1. MAP: CITIES AND ROADS (GRAPH FACTS)
% -------------------------------------------------------
% road(CityA, CityB, DistanceInKm).
% Roads are assumed to be two-way (we'll handle that later).

road(delhi,      jaipur,     280).
road(delhi,      agra,       230).
road(jaipur,     udaipur,    390).
road(agra,       gwalior,    120).
road(gwalior,    bhopal,     480).
road(agra,       lucknow,    330).
road(lucknow,    varanasi,   320).
road(jaipur,     ahmedabad,  675).
road(ahmedabad,  mumbai,     530).
road(mumbai,     pune,       150).
road(bhopal,     nagpur,     350).
road(nagpur,     hyderabad,  500).
road(hyderabad,  bengaluru,  570).

/* connection/3
   ------------
   Treat all roads as **bidirectional**.
   If there is a road from A to B, then there is also a connection B to A.
*/
connection(CityA, CityB, Distance) :-
    road(CityA, CityB, Distance).

connection(CityA, CityB, Distance) :-
    road(CityB, CityA, Distance).

% -------------------------------------------------------
% 2. FINDING A PATH AND ITS DISTANCE
% -------------------------------------------------------
/* path/4
   -------
   path(StartCity, EndCity, Path, Distance)

   - Path is a list of cities from StartCity to EndCity.
   - Distance is the total distance of that route.
*/
path(StartCity, EndCity, Path, Distance) :-
    % We start travelling from StartCity
    travel(StartCity, EndCity,
           [StartCity],     % Visited cities so far (initially only StartCity)
           RevPath,         % Path will be built in reverse
           0,               % Current distance so far
           Distance),       % Final distance
    reverse(RevPath, Path). % Reverse to get correct order

/* travel/6
   --------
   travel(CurrentCity, DestinationCity,
          VisitedSoFar, FinalPathReversed,
          DistanceSoFar, TotalDistance).

   This predicate:
   - Moves from CurrentCity to neighboring cities.
   - Avoids cycles using VisitedSoFar.
   - Accumulates distance.
*/

/* Base case:
   If the CurrentCity = DestinationCity,
   we have reached our goal. */
travel(DestinationCity, DestinationCity,
       Visited, Visited,
       Distance, Distance).

/* Recursive case:
   From CurrentCity, move to a neighboring city NextCity,
   if we haven't visited it already, and continue the search. */
travel(CurrentCity, DestinationCity,
       VisitedSoFar, FinalPath,
       DistanceSoFar, TotalDistance) :-

    % Find a neighboring city and distance
    connection(CurrentCity, NextCity, StepDistance),

    % Avoid going in circles
    \+ member(NextCity, VisitedSoFar),

    % Update the distance
    NewDistance is DistanceSoFar + StepDistance,

    % Continue travelling from NextCity
    travel(NextCity, DestinationCity,
           [NextCity | VisitedSoFar],  % add NextCity to visited list
           FinalPath,
           NewDistance,
           TotalDistance).

% -------------------------------------------------------
% 3. FINDING THE SHORTEST PATH
% -------------------------------------------------------
/* shortest_path/4
   ----------------
   shortest_path(StartCity, EndCity, BestPath, BestDistance)

   - Finds ALL possible paths using path/4
   - setof/3 collects them as Distance-Path pairs.
   - The list from setof is automatically sorted by Distance,
     so the first one is the shortest.
*/
shortest_path(StartCity, EndCity, BestPath, BestDistance) :-
    setof(Distance-Path,
          path(StartCity, EndCity, Path, Distance),
          [BestDistance-BestPath | _]).  % take the first (smallest distance)

% -------------------------------------------------------
% 4. DISPLAY UTILITIES
% -------------------------------------------------------
/* print_path/1
   ------------
   Nicely prints a list of cities as:
   city1 -> city2 -> city3 ...
*/

% Only one city left: just print nothing here (last city handled earlier)
print_path([_]).
print_path([City1, City2 | Rest]) :-
    write(City1),
    write(' -> '),
    print_path([City2 | Rest]).

/* show_route/2
   ------------
   show_route(StartCity, EndCity)
   - Finds the shortest path.
   - Prints it in a readable format.
*/
show_route(StartCity, EndCity) :-
    (   shortest_path(StartCity, EndCity, Path, Distance) ->
        write('Shortest route from '), write(StartCity),
        write(' to '), write(EndCity), write(' is:'), nl,
        print_path(Path), nl,
        write('Total distance: '), write(Distance), write(' km'), nl
    ;   % If no route found
        write('No route found between '),
        write(StartCity), write(' and '), write(EndCity), nl
    ).

% -------------------------------------------------------
% 5. SIMPLE INTERACTIVE INTERFACE
% -------------------------------------------------------
/* start/0
   -------
   Entry point for the user.

   Shows available cities, asks for start and destination,
   then displays the shortest route.
*/
start :-
    nl,
    write('================= ROUTE FINDER ================='), nl,
    write('Sample cities in this map:'), nl,
    write('  delhi, jaipur, agra, gwalior, bhopal,'), nl,
    write('  lucknow, varanasi, ahmedabad, mumbai,'), nl,
    write('  pune, nagpur, hyderabad, bengaluru'), nl, nl,

    write('Enter start city (end with a dot .):'), nl,
    write('> '),
    read(StartCity),

    write('Enter destination city (end with a dot .):'), nl,
    write('> '),
    read(EndCity),
    nl,

    show_route(StartCity, EndCity),
    nl.
