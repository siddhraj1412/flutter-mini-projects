# Practical 7 - Product Catalog App

This Flutter application demonstrates the implementation of a product catalog using GridView and custom reusable cards with local asset images. The app serves as a comprehensive example of mobile application development principles, focusing on UI design, reusability, and responsive grid layouts.

## Key Features

The application includes multiple screens for navigation including login, dashboard, product catalog, orders/cart, and profile management. The product catalog screen showcases a responsive GridView layout with custom ProductCard widgets that display product images, titles, descriptions, and pricing information loaded from local assets.

## Learning Objectives

This practical addresses several key skills in mobile application development:
- Creating reusable custom widgets for consistent UI components
- Implementing GridView for responsive product catalog layouts
- Loading and displaying local asset images in Flutter applications
- Building responsive and maintainable UI designs

## Technical Implementation

The app demonstrates proper Flutter architecture with:
- Stateful and stateless widgets for different UI requirements
- Navigation between multiple screens using named routes
- Custom card widgets with hero animations for smooth transitions
- Local asset management through pubspec.yaml configuration
- GridView with responsive cross-axis count and spacing

## Getting Started

To run this application:

1. Ensure Flutter SDK is installed and configured
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Execute `flutter run` to launch the application

## Video Demonstration

A comprehensive video walkthrough of this practical implementation is available at `media/PR_7.mp4`. The video demonstrates the complete application functionality, including navigation between screens, product catalog browsing, cart operations, and responsive UI design.

## Project Structure

The application is organized with separate Dart files for each screen:
- `main.dart` - Application entry point and routing
- `login.dart` - User authentication screen
- `dashboard.dart` - Main navigation dashboard
- `product_catalog.dart` - Product catalog with GridView
- `product_detail.dart` - Individual product details with cart functionality
- `orders.dart` - Order history and cart management
- `profile.dart` - User profile management
- `widgets/product_card.dart` - Reusable product card component

## Assets

All product images are stored in the `assets/` directory and properly configured in `pubspec.yaml` for automatic loading. The images include various AI/ML related diagrams and visualizations that serve as product representations in the catalog.

## Course Information

**Course:** AIML308 - Mobile Application Development
**Practical Number:** 7
**CO/PO:** CO2, CO3
**Problem Definition:** Design a Product Catalog App using GridView and custom cards with images
**Key Skills:** UI design, Reusability, Grid layout
**Learning Outcome:** Design reusable and responsive UI
**Total Time:** 2 hours
