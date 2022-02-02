import 'package:flutter/material.dart';
import 'package:esports_chase_app/models/new_model.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({Key? key, required this.number, required this.data})
      : super(key: key);

  final String number;
  final NewModel data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: Image.network(
                  data.image,
                  fit: BoxFit.cover,
                )),
            Text(
              data.article,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
