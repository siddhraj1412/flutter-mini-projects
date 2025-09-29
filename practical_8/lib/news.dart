import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'models/article.dart';

class NewsScreen extends StatelessWidget {
  Future<NewsResponse> fetchNews() async {
    final apiUrl = dotenv.env['NEWS_API_1'] ?? '';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: FutureBuilder<NewsResponse>(
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
                      ? Image.network(
                          article.urlToImage!,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : null,
                  title: Text(article.title ?? 'No Title'),
                  subtitle: Text(article.description ?? 'No Description'),
                  onTap: () {
                    // Optionally open the article URL
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
