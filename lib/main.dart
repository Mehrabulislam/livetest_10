import 'package:flutter/material.dart';

void main() {
  runApp(NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  final List<NewsArticle> newsArticles = [
    NewsArticle(
      title: 'Breaking News 1',
      thumbnailUrl: 'https://pm1.aminoapps.com/7233/3f6abeffd208e23749fcc36cbed4ae3260f4d465r1-720-827v2_uhq.jpg',
    ),
    NewsArticle(
      title: 'Breaking News 2',
      thumbnailUrl: 'https://pm1.aminoapps.com/7233/3f6abeffd208e23749fcc36cbed4ae3260f4d465r1-720-827v2_uhq.jpg',
    ),
    NewsArticle(
      title: 'Breaking News 3',
      thumbnailUrl: 'https://pm1.aminoapps.com/7233/3f6abeffd208e23749fcc36cbed4ae3260f4d465r1-720-827v2_uhq.jpg',
    ),
    // Add more news articles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView.builder(
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: orientation == Orientation.portrait ? 80 : 120,
                  height: orientation == Orientation.portrait ? 80 : 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(newsArticles[index].thumbnailUrl),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                title: Text(newsArticles[index].title),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsArticle {
  final String title;
  final String thumbnailUrl;

  NewsArticle({
    required this.title,
    required this.thumbnailUrl,
  });
}
