# Practical 3 — Dynamic TODO App with State Management

This project demonstrates a Flutter application with multiple screens and a dynamic TODO list. It focuses on understanding navigation, routing, stateful widgets, and implementing dynamic lists using setState and ListView.builder.

The app includes a login screen for user details, a dashboard with navigation, a profile screen, and a TODO list screen for managing tasks with categories and completion filtering.

## Features

- **Multi-screen Navigation**: Navigation between login, dashboard, profile, and TODO list screens
- **Dynamic TODO List**: Add, delete, and manage tasks with categories
- **Task Filtering**: Filter completed tasks
- **Data Passing**: User information passed between screens using route arguments
- **State Management**: Uses setState for dynamic UI updates

## Project Structure

- `lib/main.dart` — App entry point with route configuration
- `lib/login.dart` — Login screen to collect name and email
- `lib/dashboard.dart` — Dashboard with user greeting and TODO list button
- `lib/profile.dart` — Profile page displaying user details
- `lib/todolist.dart` — TODO list screen with dynamic task management

## TODO List Features

- **Add/Delete Tasks**: Simple text input to add tasks, delete with button
- **Categories**: Assign categories like Personal, Work, Shopping
- **Completion Toggle**: Mark tasks as completed
- **Filtering**: Switch to show all or only completed tasks
- **Dynamic UI**: Uses ListView.builder for efficient rendering

## Key Learning Outcomes

- Understanding StatefulWidget and setState for state management
- Implementing dynamic lists with ListView.builder
- Managing complex state with lists and objects
- Navigation with named routes and parameter passing
- Using DropdownButton and Checkbox for user input

## Widget Components Used

- `TextField` with `TextEditingController` for task input
- `ListView.builder` for dynamic task lists
- `DropdownButton` for category selection
- `Checkbox` for task completion
- `Switch` for filtering options
- `ElevatedButton` for actions

## How to Run

1. Ensure Flutter SDK is installed and configured
2. Connect an Android emulator, iOS simulator, or physical device
3. Navigate to the project directory
4. Run `flutter pub get` to install dependencies
5. Start the application with `flutter run`
6. Follow the navigation: Login → Dashboard → TODO List / Profile

## Usage Instructions

1. **Login**: Enter name and email
2. **Dashboard**: View greeting and access TODO list or profile
3. **TODO List**:
   - Enter task text and select category
   - Tap "Add" to add task
   - Use checkbox to mark completed
   - Tap delete icon to remove task
   - Toggle switch to filter completed tasks
4. **Profile**: View user details

## Technical Implementation

The TODO app uses:
- setState() for updating task lists
- ListView.builder for efficient list rendering
- Custom Task class for data structure
- Route arguments for data passing
- StatefulWidget for managing app state
