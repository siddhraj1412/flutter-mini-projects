# Practical 6 — Notes App with Persistent Storage

**CO/PO:** CO4

**Problem Definition:** Create a Notes App with persistent storage using SharedPreferences, featuring multi-screen navigation (login, dashboard) and data persistence across app sessions.

## Learning Objectives

This Flutter mobile application demonstrates:

- When to use SharedPreferences: Storing small data like user settings, session data, and lightweight JSON objects
- Data types supported: Booleans, strings, integers, doubles, and string lists
- Persistent storage: Save app settings and user data that survive app restarts
- Session management: Remember user login state and preferences

## Features

### Authentication & Session Management
- Login screen with username/password validation
- "Remember Me" functionality saves credentials using SharedPreferences
- Session persistence maintains login state across app restarts
- Secure logout with confirmation dialog

### Theme & UI
- Dark mode toggle with persistent preference storage
- Material Design UI with consistent theming across light/dark modes
- Responsive design adapting to different screen sizes
- Intuitive navigation between screens

### Notes Management
- Create notes with title and content validation
- Edit existing notes with real-time updates
- Delete notes with confirmation dialogs
- View notes list with timestamps and previews
- Persistent storage using SharedPreferences with JSON encoding

## Project Structure

```
lib/
├── main.dart                     # App entry point with theme management
├── models/
│   └── note.dart                # Note data model with JSON serialization
├── screens/
│   ├── login_screen.dart        # Login with remember me functionality
│   ├── dashboard_screen.dart    # Notes list with dark mode toggle
│   └── add_edit_note_screen.dart # Create/edit notes interface
└── services/
    └── preferences_service.dart  # SharedPreferences service layer
```

## Key SharedPreferences Usage

### Data Types Stored
- Booleans: `dark_mode`, `logged_in`, `remember_me`
- Strings: `username`, `password`, notes (JSON encoded)
- String Lists: Notes array as JSON strings

### Storage Examples
```dart
// Theme preference
await prefs.setBool('dark_mode', true);

// User session
await prefs.setString('username', username);
await prefs.setBool('logged_in', true);

// Notes as JSON
await prefs.setStringList('notes', notesJsonList);
```

## How to Run

1. Prerequisites: Ensure Flutter SDK is installed and configured
2. Navigate to project: `cd "practical_6"`
3. Install dependencies: `flutter pub get`
4. Run the app: `flutter run`

## Testing the App

### Login Screen
- Enter any username and password (min 3 characters)
- Test "Remember Me" functionality
- Toggle password visibility

### Dashboard
- Toggle dark/light mode (preference persists)
- Create new notes with the + button
- Edit existing notes by tapping them
- Delete notes using the menu

### Persistence Testing
- Close and reopen the app
- Verify login state is maintained
- Check theme preference is saved
- Confirm notes are preserved

## When to Use SharedPreferences

### Appropriate Use Cases
- User preferences and settings (theme, language)
- Simple app configuration flags
- Session tokens and user credentials
- Small amounts of structured data (< 1MB)
- Lightweight caching for quick app startup

### When NOT to Use
- Large datasets or complex relational data
- High-frequency read/write operations
- Data requiring complex queries
- Media files or binary data

## Learning Outcomes Achieved

- CO4: Successfully implemented persistent storage techniques in mobile app
- Local Storage: Demonstrated effective use of SharedPreferences for various data types
- Preference Handling: Implemented theme management and session persistence
- Data Management: Created robust data layer with JSON serialization
- User Experience: Built intuitive UI with persistent user preferences

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.4.12  # Persistent storage
  uuid: ^4.1.0                 # Unique note IDs
  cupertino_icons: ^1.0.8      # iOS-style icons
```

---

This is an educational implementation focused on SharedPreferences usage. For production apps with large datasets, consider using SQLite, Hive, or other database solutions.

