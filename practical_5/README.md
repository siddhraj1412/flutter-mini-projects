# Practical 5 — Student Records App (SQLite CRUD)

This Flutter project implements a minimal Student Records application that demonstrates local data storage using SQLite, basic authentication (signup/login), and multi-screen navigation. It is a focused, minimal implementation intended for a practical assignment: creating and managing student records locally on the device.

Key goals addressed:
- Store, update, and retrieve data locally using SQLite (via `sqflite`).
- Use `FutureBuilder` to display asynchronous database queries in the UI.
- Implement basic signup/login flow and a profile screen that displays user-entered data.

This README is adapted from the Practical 4 reference (form validation example) and focuses on the SQLite CRUD implementation.

## Features

- Student CRUD: Add, view, edit, delete student records stored in a local SQLite database.
- Local authentication flow: Sign up (enter name, email, password, branch, phone, city) and then login with email/password.
- Profile screen: Shows signup user details saved in memory for the session.
- Simple, minimal UI suitable for practical/demonstration purposes.
- Search students by name.

## Project Structure (important files)

- `lib/main.dart` — App entry point and route configuration (starts at signup screen).
- `lib/models/student.dart` — `Student` model used for database operations.
- `lib/models/user_data.dart` — Simple in-memory `UserData` used for signup/login/profile.
- `lib/database/database_helper.dart` — SQLite helper (singleton) implementing CRUD operations.
- `lib/screens/signup_screen.dart` — Signup screen collecting user details.
- `lib/screens/login_screen.dart` — Login screen authenticating by email/password.
- `lib/screens/student_list_screen.dart` — Main screen listing students (uses `FutureBuilder`).
- `lib/screens/add_edit_student_screen.dart` — Form for adding or editing students.
- `lib/screens/profile_screen.dart` — Displays user details entered on signup.

## Key Implementation Notes

- Database: Implemented with `sqflite` and `path`. The database file is created in the device's standard database directory and contains a `students` table.
- Models: `Student` has fields `id`, `name`, `age`, `course`, `email`, `phoneNumber` and helper methods for map conversion.
- Async UI: The students list screen uses `FutureBuilder<List<Student>>` to fetch and render data asynchronously.
- Signup/Login: Signup sets data to `UserData` (simple in-memory store) and redirects to login. Login checks email/password against `UserData` and navigates to the student list on success.

## Dependencies

Open `pubspec.yaml` and ensure these packages are present (they were added during the project):

- `sqflite` — SQLite plugin for Flutter
- `path` — Path utilities used to build the database path

Run:

```powershell
flutter pub get
```

## How to Run

1. Install Flutter SDK and set up your development environment.
2. Open an emulator or connect a device.
3. From the project root run:

```powershell
flutter pub get
flutter run
```

The app flow: Sign Up → Login → Student Records (Add/Edit/Delete) → Profile

## Usage

- Sign Up: On first launch fill name, email, password, branch, phone, city. After signup you'll be directed to login.
- Login: Use the email and password you entered during signup.
- Student Records: Add students using the + FAB. Tap edit to modify a student, or delete to remove.
- Search: Use the search box on the students list to find students by name.
- Profile: Access profile from the app bar or drawer to see signup information and logout.

## Notes & Limitations

- User data is stored in `UserData` in-memory for simplicity — it is not persisted across app restarts. For persistent account storage, integrate a secure local store or use the database.
- The UI is intentionally minimal by request. You can expand styling and UX later.
- This example focuses on local DB operations and basic navigation for learning CRUD with SQLite.

## Learning Outcomes

- Implement local data persistence with SQLite in Flutter.
- Build simple authentication flows tied to locally entered user data.
- Use `FutureBuilder` to handle asynchronous DB queries in the UI.
- Implement standard CRUD operations and basic search functionality.

## Reference

This README draws structure and ideas from a form-validation sample (Practical 4) while focusing on SQLite CRUD and the current Practical 5 requirements.

---

