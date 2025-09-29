# Flutter Authentication App - Practical 9

A complete mobile authentication application built with Flutter and Node.js, featuring user registration, login, and profile management with API-based credential verification and session handling.

## Features

The application provides a full authentication system with multiple screens for user interaction. Users can register with their name, email, and password, then securely log in to access a personalized dashboard. The app maintains user sessions across app restarts and includes a dedicated profile screen displaying user information.

## Technology Stack

**Frontend:** Flutter with Dart
**Backend:** Node.js with Express.js
**Database:** MongoDB with Mongoose
**Authentication:** JWT (JSON Web Tokens)
**Password Security:** bcrypt hashing
**State Management:** SharedPreferences for local storage

## Setup Instructions

### Prerequisites
- Flutter SDK installed
- Node.js installed
- MongoDB installed and running
- Android Studio or VS Code with Flutter extensions

### Backend Setup
1. Navigate to the backend directory
2. Install dependencies: `npm install`
3. Create a `.env` file with MongoDB URI and JWT secret
4. Start the server: `npm run dev`

### Frontend Setup
1. Navigate to the root directory
2. Install Flutter dependencies: `flutter pub get`
3. Run the application: `flutter run`

## API Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User authentication
- `GET /api/auth/user` - Get current user data (protected)

## Project Structure

```
practical__9/
├── lib/
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── home_screen.dart
│   │   └── profile_screen.dart
│   └── services/
│       └── auth_service.dart
├── backend/
│   ├── models/
│   │   └── User.js
│   ├── routes/
│   │   └── auth.js
│   └── server.js
└── android/
    └── app/
        └── build.gradle.kts
```

## Demo Video

A demonstration video showing the complete authentication flow is available at: `media/PR_9.mp4`

## Learning Outcomes

This project demonstrates implementation of:
- API-based authentication systems
- JWT token management
- Secure password handling
- Multi-screen navigation in Flutter
- RESTful API development
- MongoDB integration with Mongoose
- Session persistence in mobile applications
