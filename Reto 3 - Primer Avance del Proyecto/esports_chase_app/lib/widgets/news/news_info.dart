import 'package:flutter/material.dart';

class NewsInfo extends StatelessWidget {
  const NewsInfo({Key? key, required this.number}) : super(key: key);

  final String number;

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
                  _InformationTile(title: "Title", info: "Título de la noticia $number"),
                  const _InformationTile(title: "Author", info: "Jhon Doe"),
                  const _InformationTile(
                      title: "About the author",
                      info:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultrices sapien blandit leo auctor varius. Nam gravida eget magna sed vestibulum. Vestibulum quis ipsum dignissim, faucibus leo a, scelerisque tortor."),
                  const _InformationTile(title: "Tags", info: "Teams, Game, Player, Tournament "),
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
