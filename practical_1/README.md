# Practical 1 — Mobile Navigation

This project demonstrates a basic Flutter application with multiple screens and simple data passing. It focuses on understanding navigation, routing, and how information can be shared across screens in a structured way.  

The app includes a login screen where a user enters a name, a dashboard that greets the user, and a profile screen that displays the user’s details. Both named routes and direct navigation are used to highlight Flutter’s flexible navigation system.  

## Project Structure

- `lib/main.dart` — App entry point, registers routes  
- `lib/login.dart` — Login screen to collect username  
- `lib/dashboard.dart` — Dashboard showing greeting and navigation to profile  
- `lib/profile.dart` — Profile page showing user details with arguments or constructor  

## Key Learning Outcomes

- Understanding the widget tree and screen composition  
- Implementing navigation with named routes and `MaterialPageRoute`  
- Passing data between screens via constructor parameters and route arguments  

## How to Run

1. Install Flutter and connect an emulator or device  
2. Run `flutter pub get` to install dependencies  
3. Start the app with `flutter run`  

