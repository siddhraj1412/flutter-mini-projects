# Practical 4 — Form-based Registration App with Validation

This project demonstrates a Flutter application with form-based registration, input validation, and navigation through multiple screens. It focuses on understanding form handling, validation techniques, and implementing secure input validation using Dart and Flutter widgets.

The app includes a registration screen with validated form fields, a dashboard that greets the user, a profile screen displaying user details, and a feedback form with rating functionality.

## Features

- **Form Validation**: Comprehensive validation for user registration including name, email, password, and confirmation
- **TextFormField Usage**: Proper implementation of TextFormField with controllers and validation
- **GlobalKey<FormState>**: Using form keys for state management and validation triggering
- **Common Validation Types**: Email format validation, password strength, field matching
- **Multi-screen Navigation**: Seamless navigation between registration, dashboard, profile, and feedback screens
- **Feedback Form**: Supplementary form with rating slider and text input validation
- **Data Passing**: User information passed between screens using route arguments
- **Responsive UI**: Clean and user-friendly interface with proper form styling

## Project Structure

- `lib/main.dart` — App entry point with route configuration
- `lib/login.dart` — Registration screen with validated form fields
- `lib/dashboard.dart` — Dashboard with user greeting and navigation options
- `lib/profile.dart` — Profile page displaying user details
- `lib/feedback.dart` — Feedback form with rating and text input

## Form Validation Features

- **TextFormField with Validators**: Custom validation functions for each field
- **Email Validation**: Regex-based email format checking
- **Password Validation**: Minimum length and confirmation matching
- **Real-time Validation**: Immediate feedback on form submission
- **Error Messages**: User-friendly validation error displays

### Validation Types Implemented

- **Required Field**: Ensures fields are not empty
- **Email Format**: Validates proper email structure using regex
- **Password Strength**: Minimum character requirements
- **Field Matching**: Confirm password matches original password
- **Numeric Validation**: For rating inputs

## Key Learning Outcomes

- Understanding Form widget and GlobalKey<FormState> usage
- Implementing TextFormField with custom validators
- Using TextEditingController for input management
- Creating secure form validation patterns
- Handling form submission and navigation
- Implementing rating systems with Slider widget
- Managing form state and error handling

## Widget Components Used

- `TextFormField` with `validator` for input validation
- `Form` widget with `GlobalKey<FormState>` for form management
- `Slider` widget for rating input
- `ElevatedButton` for form submission
- `ScaffoldMessenger` for snackbar notifications
- `Column` and `Padding` for layout structure

## How to Run

1. Ensure Flutter SDK is installed and configured
2. Connect an Android emulator, iOS simulator, or physical device
3. Navigate to the project directory
4. Run `flutter pub get` to install dependencies
5. Start the application with `flutter run`
6. Follow the on-screen navigation: Registration → Dashboard → Profile/Feedback

## Usage Instructions

1. **Registration**: Fill out the registration form with valid name, email, password, and confirmation
2. **Validation**: Submit to see validation in action - invalid inputs will show error messages
3. **Dashboard**: View personalized greeting and access additional features
4. **Profile**: Navigate to view your user information
5. **Feedback**: Access the feedback form to provide rating and comments
6. **Navigation**: Use the provided buttons to move between screens

## Technical Implementation

The form validation uses:
- `Form.validate()` method for triggering validation
- Custom validator functions returning error strings
- `TextEditingController` for accessing input values
- Regex patterns for email validation
- State management for dynamic error display
- Route arguments for data passing between screens

This project serves as a practical example of implementing secure form validation in Flutter applications with proper user input handling and navigation.
