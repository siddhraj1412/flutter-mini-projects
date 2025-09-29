# Mobile Application Development (AIML308) Practical Report - Practical 8

## Technical Approach

This Flutter application implements a multi-screen news app with REST API integration, focusing on asynchronous data handling and JSON parsing. The core implementation uses the `http` package for API calls, `flutter_dotenv` for secure environment variable management, and `FutureBuilder` for reactive UI updates based on async operations. Key widgets include `StatefulWidget` for state management, `FutureBuilder` for handling loading/error/success states, `ListView.builder` for dynamic article rendering, and `Scaffold` for consistent app structure across screens.

## File Structure

```
lib/
├── main.dart  # Main entry point of the Flutter application
├── login.dart  # Handles user authentication and login screen
├── dashboard.dart  # Displays the main dashboard after login
├── profile.dart  # Manages user profile information
├── news.dart  # Fetches and displays news articles
└── models/
    └── article.dart  # Defines the Article model class
```

## Key Code Snippets

### 1. JSON Parsing - Article.fromJson (lib/models/article.dart)
```dart
factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    source: json['source'] != null ? Source.fromJson(json['source']) : null,
    author: json['author'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
    urlToImage: json['urlToImage'],
    publishedAt: json['publishedAt'],
    content: json['content'],
  );
}
```
*This factory constructor parses JSON data from the News API into Article objects, mapping each field to the corresponding Dart properties.*

### 2. Async API Handling - fetchNews (lib/news.dart)
```dart
Future<NewsResponse> fetchNews() async {
  final apiUrl = dotenv.env['NEWS_API_1'] ?? '';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    return NewsResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load news');
  }
}
```
*This async function performs HTTP GET request to News API, awaits the response, and parses JSON data or throws exception on failure.*

### 3. Loading/Error States - FutureBuilder (lib/news.dart)
```dart
FutureBuilder<NewsResponse>(
  future: fetchNews(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (snapshot.hasData) {
      final newsResponse = snapshot.data!;
      return ListView.builder(
        itemCount: newsResponse.articles?.length ?? 0,
        itemBuilder: (context, index) {
          final article = newsResponse.articles![index];
          return ListTile(
            leading: article.urlToImage != null
                ? Image.network(article.urlToImage!, width: 100, fit: BoxFit.cover)
                : null,
            title: Text(article.title ?? 'No Title'),
            subtitle: Text(article.description ?? 'No Description'),
          );
        },
      );
    } else {
      return Center(child: Text('No data'));
    }
  },
)
```
*FutureBuilder handles three states: waiting (loading spinner), error (error message), and data (article list), providing reactive UI updates.*

### 4. Navigation with Arguments - Login Button (lib/login.dart)
```dart
ElevatedButton(
  onPressed: () {
    Navigator.pushReplacementNamed(
      context,
      '/dashboard',
      arguments: {
        'name': _nameController.text,
        'email': _emailController.text,
      },
    );
  },
  child: Text('Login'),
)
```
*This button navigates to dashboard screen while passing user input data as route arguments for state management across screens.*

### 5. Environment Variable Loading - main.dart
```dart
Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}
```
*Loads environment variables from .env file at app startup to securely access API keys without hardcoding.*

## Key Questions

- **What is JSON parsing?** JSON parsing converts the JSON response string from the News API into structured Dart objects using factory constructors like `Article.fromJson()`, which maps JSON fields to object properties for easy data manipulation in the app.

- **How to handle async APIs?** Async APIs are handled using `async/await` syntax in functions like `fetchNews()`, combined with `FutureBuilder` widget that reacts to different connection states, ensuring UI updates when data arrives without blocking the main thread.

- **How to deal with loading/error states?** Loading states are managed with `FutureBuilder`'s `ConnectionState.waiting` showing a `CircularProgressIndicator`, error states use `snapshot.hasError` to display error messages, and success states render data using `snapshot.hasData` with `ListView.builder` for article display.</content>
<parameter name="filePath">d:\SEM 5\AIML308_Mobile Application Development\PR_LIST\practical_8\docs\project.txt