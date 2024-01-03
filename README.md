# Recipes iOS App

Welcome to the Recipes iOS application! This app allows users to retrieve and view recipes from a free API, enabling them to explore various dishes and save their favorites. The app is built with Swift, follows the MVVM architecture pattern, and employs the Coordinator pattern for navigation management.

## Table of Contents
- [Getting Started](#getting-started)
- [Key Features](#key-features)
- [Technologies Used](#technologies-used)
- [Screenshots](#screenshots)
- [App Structure](#app-structure)
- [Authors](#authors)

## Getting Started

To set up and run the Recipes app, follow these steps:

1. Clone the repository:
   ```swift
   git clone https://github.com/dalia61/Recipes.git
   cd Recipes
   ```
   
2. Install CocoaPods dependencies:
   ```swift
   pod install
   ```
   
3. Open the Xcode workspace and build the app.

4. Use this data to try Login feature
   - Email: `dalia@gmail.com`.
   - Password `123456`.


## Key Features

* Login to access Recipes.
* Explore a curated list of Recipes.

## Technologies Used

- SWIFT
- UIKit
- MVVM Architecture Pattern
- Observer pattern
- Coordinator Pattern For Handling Navigation
- XIB Files
- Figma For Designing The UI

## Screenshots

Here are some screenshots from the app:

- **Launch Screen**
  
![Simulator Screenshot - iPhone 14 Pro - 2023-08-12 at 00 58 33](https://github.com/dalia61/Recipes/blob/main/Recipes/Recipes/RecipesFoundation/Resources/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-03%20at%2011.46.16.png)

- **Onboarding Screen**
  
![Simulator Screenshot - iPhone 14 Pro - 2023-08-12 at 00 55 05](https://github.com/dalia61/Recipes/blob/main/Recipes/Recipes/RecipesFoundation/Resources/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-03%20at%2011.42.48.png)

- **Login Screen [Invalid Data]**
  
![Simulator Screenshot - iPhone 14 Pro Max - 2023-08-12 at 03 22 49](https://github.com/dalia61/Recipes/blob/main/Recipes/Recipes/RecipesFoundation/Resources/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-03%20at%2012.10.15.png)

- **Login Screen [Valid Data]**
  
![Simulator Screenshot - iPhone 14 Pro Max - 2023-08-12 at 04 44 14](https://github.com/dalia61/Recipes/blob/main/Recipes/Recipes/RecipesFoundation/Resources/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-03%20at%2011.45.44.png)

- **Recipe Details Screen**
  
![260270385-20e25b44-d3a5-44af-a81b-fa0c0c2daeee](https://github.com/dalia61/Recipes/blob/main/Recipes/Recipes/RecipesFoundation/Resources/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%2014%20-%202024-01-03%20at%2011.44.45.png)

## App Structure

The app follows a modular structure, divided into different components:

- **Recipes**
  
* Recipes
   * RecipesFoundation
      * Configuration
      * Core
      * Extensions
        * UI
      * Externals
        * Coordinator
        * DataNetwork
      * Resources
* Modules
   * Onboarding
      * Model
      * View
      * ViewModel
      * Coordinator
   * Login
      * Model
      * View
      * ViewModel
      * Coordinator
   * RecipesList
      * Model
      * View
      * ViewModel
      * Coordinator
      
## Authors

Created by:
- Dalia Hamada
  * [LinkedIn](https://www.linkedin.com/in/daliahamada/)

Feel free to reach out for any questions or further clarification about the project.
