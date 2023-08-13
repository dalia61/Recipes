# Recipes iOS App

Welcome to the Recipes iOS application! This app allows users to retrieve and view recipes from a free API, enabling them to explore various dishes and save their favorites. The app is built with Swift, follows the MVVM architecture pattern, and employs the Coordinator pattern for navigation management.

## Table of Contents
- [Getting Started](#getting-started)
- [Used In The APP](#used-in-the-app)
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

## Used In The APP

- SWIFT
- MVVM Architecture Pattern
- Coordinator Pattern For Handling Navigation
- XIB Files
- Figma For Designing The UI

## Screenshots

Here are some screenshots from the app:

- **Launch Screen**
  
![Simulator Screenshot - iPhone 14 Pro - 2023-08-12 at 00 58 33](https://github.com/dalia61/Recipes/assets/70582993/6f69bc96-4923-401b-b6b6-fbeaafc45417)

- **Onboarding Screen**
  
![Simulator Screenshot - iPhone 14 Pro - 2023-08-12 at 00 55 05](https://github.com/dalia61/Recipes/assets/70582993/073f2675-ed33-4cd5-9c80-e52e4b287f3f)

- **Login Screen [Invalid Data]**
  
![Simulator Screenshot - iPhone 14 Pro Max - 2023-08-12 at 03 22 49](https://github.com/dalia61/Recipes/assets/70582993/9b7c33cd-b24d-4603-bc53-f4d87eff8368)

- **Login Screen [Valid Data]**
  
![Simulator Screenshot - iPhone 14 Pro Max - 2023-08-12 at 04 44 14](https://github.com/dalia61/Recipes/assets/70582993/a9923da8-b38d-4ddf-897e-25ea90331dcd)

- **Recipes Screen [Table View]**
  
![260270337-bcd348db-71c6-4f30-9aab-897e80e8c4d6](https://github.com/dalia61/Recipes/assets/70582993/a62c0700-5e7f-425d-beb6-2fb495e796fe)

- **Recipe Details Screen [Table View Cell]**
  
![260270385-20e25b44-d3a5-44af-a81b-fa0c0c2daeee](https://github.com/dalia61/Recipes/assets/70582993/77697ddd-3a51-4bfa-8207-ca87008f00da)

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
   * RecipeDetails
      * Model
      * View
      * ViewModel
      * Coordinator
      
## Authors

Created by:
- Dalia Hamada
  * [LinkedIn](https://www.linkedin.com/in/daliahamada/)
  * [CV](https://drive.google.com/file/d/1e0ufbAElf9E01CXVUzuTyg_RdJBFJnF9/view?usp=drive_link)

Don't hesitate to reach out if you have any questions or need further clarification about the project.
