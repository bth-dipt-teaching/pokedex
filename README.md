# pokedex

Pokédex app developed with Flutter.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 📱 Features:
- [x] View Pokémon List
- [x] View Pokémon Details
- [x] Light/Dark Theme


## 📸 Screenshots:

### GIF

| 1                                                                                       |
|-----------------------------------------------------------------------------------------|
| ![](https://github.com/bth-dipt-teaching/pokedex/assets/gif/screen_record.gif?raw=true) |

### Dark

| 1                                                     | 2                                                     |
|-------------------------------------------------------|-------------------------------------------------------|
| <img src="assets/screenshots/dark/1.png" width="400"> | <img src="assets/screenshots/dark/2.png" width="400"> |

### Light

| 1                                                      | 2                                                      |
|--------------------------------------------------------|--------------------------------------------------------|
| <img src="assets/screenshots/light/1.png" width="400"> | <img src="assets/screenshots/light/2.png" width="400"> |

### Folder Structure
Here is the folder structure for the project.

```
valor-frontend/
|- android
|- ios
|- lib
|- test
```
Here is the folder structure that was used for this project

```
lib/
|- app/
   |- config/
      |- api_config/
      |- app_config/
   |- dependency_injection/
   |- helpers/
   |- service_result/
   |- services/
   
|- features/
   |- home/
      |- data/
            |- data_source/
            |- models/
            |- repo_impl/
      |- domain/
         |- params/
         |- repo/
      |- presentation/
         |- ui/
            |- screens/
            |- widget/
   
   |- splash/
      |- presentation/
         |- ui/
            |- screens/
   
|- src/
   |- constants/
   |- extensions/
   |- res/
      |- color_scheme/
      |- theme/
   
|- app.dart
|- main.dart
```

Quick dive into the lib folder which has the main code for the application.
```
1- main - This is the starting point of the application.
2- app - All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
3- features - Contains all the features of the application.
4- data - Contains the data layer of the feature, includes directories for data source (either local or remote). This only communicates with the domain layer.
5- domain - Contains the domain layer of the feature, includes directories for repository and params. This communicates with the data layer and the presentation layer.
6- presentation - Contains the presentation layer of the feature, includes directories widgets and screens. This only communicates with domain layer.
7- src - Contains all the application level constants, extensions and themes. This directory contains the theme for the application.
8- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for the baseUrls.
9- res - All themes, colors, primary swatch and styles used in the app.
```

## How to use

**Step 1**

Download or clone this repo by using the link below
```
https://github.com/bth-dipt-teaching/pokedex.git
```

**Step 2**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

## Hide Generated Files

In order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

### Packages & Tools Used

* [Cached Network Image](https://github.com/Baseflow/flutter_cached_network_image) (Image Caching)
* [Dio](https://github.com/cfug/dio/tree/main/dio) (HTTP calls)
* [Palette Generator](https://github.com/flutter/packages/tree/main/packages/palette_generator) (Generate color palette from image)
* [Percent Indicator](https://github.com/diegoveloper/flutter_percent_indicator/) (Percent Indicator)
## License

Copyright © 2023 Enoch Aikpokpodion

This work (source code) is licensed under  [MIT](./LICENSE).

