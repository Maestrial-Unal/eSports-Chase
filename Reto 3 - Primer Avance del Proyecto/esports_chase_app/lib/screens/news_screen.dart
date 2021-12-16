import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/news/news_appbar.dart';
import 'package:esports_chase_app/widgets/news/news_article.dart';
import 'package:esports_chase_app/widgets/news/news_info.dart';
import 'package:esports_chase_app/router/news_arguments.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NewsArguments;

    return Scaffold(
        endDrawer: NewsInfo(number: args.number),
        body: Column(
          children: [
            const NewsAppbar(),
            NewsArticle(number: args.number),
          ],
        ));
  }
}
