# weather_app

Juhi-Sharma--Flutter-Task
Project Name: Weather App

Description: Create a simple weather app using Flutter that displays current weather information for a given city. The app will feature two screens: a home screen with a search bar to enter a city name and a button to trigger the weather search, and a weather details screen to display weather information such as city name, current temperature in Celsius, weather condition, an icon representing the weather condition, humidity percentage, and wind speed. It will fetch weather data from the OpenWeatherMap API. The app should include a loading indicator while fetching data, proper error handling, and user-friendly error messages. State management will be handled using setState or Provider, and the design will be responsive for both mobile and tablet devices. The weather details screen will also have a "Refresh" button to fetch updated weather data, and the app will implement data persistence to save the last searched city. Solution: This code provides a basic implementation of a weather app using Flutter and the Provider package for state management. Here's a breakdown of the solution:

ApiService Class Purpose: Handles API calls to fetch weather data from OpenWeatherMap. Methods: fetchWeather(String city): Makes an HTTP GET request to OpenWeatherMap's API using http package, parses the JSON response, and returns it as a Map<String, dynamic>.

WeatherProvider Class Purpose: Manages app state related to weather data and loading status. Properties: isLoading: Indicates whether data is being loaded. weather: Holds the retrieved weather data. error: Stores any error messages encountered during data fetching. Methods: fetchWeather(String city): Initiates the weather data fetching process. It updates loading state, makes an API call through ApiService, updates weather on success, saves the last searched city in SharedPreferences, and handles errors.

HomeScreen Class Purpose: Represents the main screen of the app where users can input a city name to search for weather. Features: Uses TextField for city input. InkWell widget with "Search" button functionality triggers weather data fetching and navigates to WeatherScreen upon successful search.

WeatherScreen Class Purpose: Displays detailed weather information for a specific city. Features: Receives the city name as a parameter and displays it in the app bar. Shows weather details such as temperature, weather condition, humidity, wind speed, and an icon representing the current weather condition. Includes a refresh button to fetch updated weather data.

main() Function Purpose: Entry point of the app where ChangeNotifierProvider wraps the MyApp widget, initializing WeatherProvider for state management. Features: Sets up the theme and initializes the HomeScreen as the initial UI component.

Resume: My resume is included in this repository as JuhiSharma.pdf.