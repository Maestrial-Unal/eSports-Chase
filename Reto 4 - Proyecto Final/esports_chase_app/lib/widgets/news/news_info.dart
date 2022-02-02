import 'package:esports_chase_app/models/new_model.dart';
import 'package:flutter/material.dart';

class NewsInfo extends StatelessWidget {
  const NewsInfo({Key? key, required this.number, required this.data})
      : super(key: key);

  final String number;
  final NewModel data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
      child: Drawer(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  _InformationTile(title: "Title", info: data.title),
                  _InformationTile(title: "Author", info: data.author),
                  _InformationTile(
                      title: "About the author", info: data.infoAuthor),
                  _InformationTile(
                      title: "Tags", info: data.generateStringTags()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      child: const Text(
        "About this News",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class _InformationTile extends StatelessWidget {
  const _InformationTile({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
          ),
          Text(info),
        ],
      ),
    );
  }
}
