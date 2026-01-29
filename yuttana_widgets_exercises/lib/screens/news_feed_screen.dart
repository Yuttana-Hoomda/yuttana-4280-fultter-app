import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/models/article_model.dart';
import 'package:yuttana_4280_fultter_app/utils/responsive.dart';

int _gridColumn(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return 3;
  } else if (!Responsive.isPortrait(context)) {
    return 2;
  } else {
    return 1;
  }
}

double _gridRatio(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return 1.75;
  } else if (!Responsive.isPortrait(context)) {
    return 1.5;
  } else {
    return 2.5;
  }
}

final List<ArticleModel> articles = [
  const ArticleModel(
    title: 'Introduction to Flutter',
    description: 'Learn the basics of Flutter development...',
    date: '2024-01-05',
    readingTimeMinutes: 5,
  ),
  const ArticleModel(
    title: 'Advanced Widget Patterns',
    description: 'Discover advanced patterns in Flutter...',
    date: '2024-01-04',
    readingTimeMinutes: 8,
  ),
  const ArticleModel(
    title: 'State Management in Flutter',
    description: 'Explore different state management approaches...',
    date: '2024-01-03',
    readingTimeMinutes: 12,
  ),
  const ArticleModel(
    title: 'Building Responsive UIs',
    description: 'Create apps that work on any screen size...',
    date: '2024-01-02',
    readingTimeMinutes: 10,
  ),
];

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Feed')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 12),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _gridColumn(context),
              childAspectRatio: _gridRatio(context),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          Text(
                            article.description,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article.date,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          Text(
                            '${article.readingTimeMinutes} min read',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
