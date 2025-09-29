# Practical 2 — Temperature Converter with Mobile Navigation

This project demonstrates a Flutter application with multiple screens and a functional temperature converter. It focuses on understanding navigation, routing, stateful widgets, and implementing practical utility features using Dart functions and input widgets.

The app includes a login screen where users enter their name and email, a dashboard that greets the user and features a temperature converter tool, and a profile screen that displays the user's details. The temperature converter allows users to convert between Celsius and Fahrenheit with real-time calculations.

## Features

- **Multi-screen Navigation**: Seamless navigation between login, dashboard, and profile screens
- **Temperature Converter**: Interactive tool to convert temperatures between Celsius and Fahrenheit
- **Data Passing**: User information is passed between screens using route arguments
- **Input Validation**: Proper validation for temperature input with error handling
- **Responsive UI**: Clean and user-friendly interface with proper spacing and styling
- **State Management**: Uses StatefulWidget for dynamic UI updates

## Project Structure

- `lib/main.dart` — App entry point with route configuration
- `lib/login.dart` — Login screen to collect username and email
- `lib/dashboard.dart` — Dashboard with user greeting and temperature converter functionality
- `lib/profile.dart` — Profile page displaying user details and avatar

## Temperature Converter Features

- **Bidirectional Conversion**: Convert from Celsius to Fahrenheit or vice versa
- **Switch Toggle**: Easy switching between conversion modes
- **Real-time Results**: Instant conversion with formatted decimal precision
- **Input Validation**: Handles invalid input with user-friendly error messages
- **Dart Functions**: Implements conversion logic using pure Dart functions

### Conversion Formulas Used

- **Celsius to Fahrenheit**: `F = (C × 9/5) + 32`
- **Fahrenheit to Celsius**: `C = (F - 32) × 5/9`

## Key Learning Outcomes

- Understanding StatefulWidget vs StatelessWidget implementation
- Implementing temperature conversion algorithms with Dart functions
- Using TextEditingController for input handling
- Managing state with setState() method
- Creating responsive layouts with Flutter widgets
- Implementing form validation and error handling
- Navigation with named routes and parameter passing
- Using Switch widget for user interface controls

## Widget Components Used

- `TextField` with `TextEditingController` for temperature input
- `Switch` widget for conversion mode selection
- `ElevatedButton` for triggering conversions
- `SingleChildScrollView` for scrollable content
- `Column` and `Row` for layout structure
- `Padding` for proper spacing and margins

## How to Run

1. Ensure Flutter SDK is installed and configured
2. Connect an Android emulator, iOS simulator, or physical device
3. Navigate to the project directory
4. Run `flutter pub get` to install dependencies
5. Start the application with `flutter run`
6. Follow the on-screen navigation: Login → Dashboard → Profile

## Usage Instructions

1. **Login**: Enter your name and email on the login screen
2. **Dashboard**: View personalized greeting and access the temperature converter
3. **Temperature Conversion**: 
   - Enter a temperature value in the input field
   - Use the switch to select conversion direction
   - Tap "Convert" to see the result
4. **Profile**: Navigate to view your user information
5. **Navigation**: Use the provided buttons to move between different pages of apps

## Technical Implementation

The temperature converter uses:
- Input validation with `double.tryParse()`
- State management for dynamic UI updates
- Dart functions for conversion calculations
- Error handling for invalid inputs
- Formatted output with `toStringAsFixed(2)`

This project serves as a practical example of combining Flutter's navigation capabilities with functional programming concepts and user input handling.


