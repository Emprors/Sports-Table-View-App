# Sports-Table-View-App

This repository has the source code of my first Assignment for the SCS_2680_010 iOS Mobile Application Development 
inside Ontario Institute for Studies in Education - University of Toronto.


Instructions
Create an application that will allow the user to view a list of sports games read from a JSON file.
The application will use a Navigation Controller to display three table views.
- The first view will let the user choose a week
- The second view will let the user choose a sport
- The third view will display a list of games for that sport
Details
The initial view should be a Table View that displays two weeks to select from.
Selecting Week 1 will load the data from sports_week_1.json.
Selecting Week 2 will load the data from sports_week_2.json.
After selecting a specific week, the app should then display a Table View that presents the user
with one row for each sport defined in the loaded json file under the ‘leagues’ key
Selecting a sport will load a new Table View that displays one row for each game in that specific
league.
Each game Table View Cell should display the following information for both the home team and
the visiting team:
- Team City
- Team Name
- Team Logo Image
- Team Score (if the game state is “Final”)
The game state for each game can be found using the ‘game_state’ key. There are two possible
game states, ‘Final’ and ‘Pregame’. If the game state is ‘Final’, display the team scores. If the game
state is ‘Pregame’, display the game time instead.
