# Metaweather Client
This a simple mobile application written with Flutter that uses metaweather APIs to display a list of of forecasts to a given city base on its woeid (where on earth ID) currently the app is using (44418) which is London location.
 
 

   <img src="screenshots/screen2.png" width="200">   

<img src="screenshots/screen1.png" width="400">

### App Features 
 
1.   User can show weather forecast for 5 days in list.
2.   User can pick one of the forecast list to display more details.
3.   User can pull and refresh the page.
4.   The app supports landscape view.
5.   Support for error handling and retry functionality.

## App architecture
The app is based on clean architecture, BloC and dependancy injection to provide good separation between the application layers and support testing each module individually.

### The app includes the following main components:

* A web API service for fetching the weather forecast from the server.
* Datasources to load and parse the data from the APIs . 
* Repositories to provide the data to the use-cases. 
* BloCs for managing the app state.
* A pull to refresh screen.
* A DI framework to handle dependancies in Prod and Test modes.
* Unit Test cases, Widget test cases and Integration tests.

### App Packages:
* **core** - contains the common classes used between all features: 
  * usecases - contains dart callable calls that represents the super class for all use-cases.
  * network - contains the classes need to interact with the network and checking the connection status.
  * utils - contains utils for app core.
  * error - contains app exceptions and failure classes.
* **di** - contains dependency injection modules for Injectable & GetIt.
* **features** - contains app the features along with their domains, data and repositories contracts. 


### Features structure:
Every feature should have the following packages:
* **domain** - contains pure business logic, app usecases and repositories contracts.
  * entities - conatins app core entities.
  * usecases - contracts and implementations of the feature's use-cases.
  * repos - contains the contracts of the domain repositories. 
* **data** - classes responsible for handling the data: 
  * datasources - contains the contracts and implementations of the feature datasourses.
  * models - contains the classes need to parse json data and convert it into entities.
  * repos - the concrete implementations of the domain repositories which will act as a single source of truth for the feature. 
* **representation** - contains the classes needed for UI and statemanagment.
  * bloc - feature state managment BloCs.
  * ui - Flutter widgets and UI elements.


### Test structure:
* **Unit and UI test** - located under `test` folder and follows the same lib folder structure.
* **Integration tests** - located under `test_driver`..
### App Envs:
* **Prod** - main.dart : the dependancy injection will be set to Prod mode and it will use real datasourse.
* **Test** - main_mock.dart : the dependancy injection will be set to Test mode and it will use mocked datasources.


### App Specs
* Developed with Flutter 2.0.6 SDK
* Dart. 
* Bloc Architecture.
* Injectable and GetIT for dependency injection.
* Prod and Test Envs.
* Retrofit for API integration.
* Clean aruchitecture. 
* Unit Test, Widget Tests and Test Driver.
------ 

### Run the app

#####  Mocked Mode (No Actual API requests)
flutter run lib/main_mock.dart 
#####  Debug Mode
flutter run 
#####  Profile Mode:
flutter run --profile

------ 

### Run App Tests
#####  Run Widget and Unit Tests
flutter test
#####  Run Test Driver (Mocked Env) 
flutter drive --target=test_driver/main.dart
