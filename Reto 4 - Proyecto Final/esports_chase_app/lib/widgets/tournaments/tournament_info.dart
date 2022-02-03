import 'package:esports_chase_app/models/tournament_model.dart';
import 'package:flutter/material.dart';

class TournamentInfo extends StatelessWidget {
  const TournamentInfo({Key? key, required this.data}) : super(key: key);

  final TournamentModel data;

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
                  _InformationTile(
                      title: "Name",
                      info: "${data.type} Tournament ${data.name}"),
                  _InformationTile(title: "Status", info: data.status),
                  _InformationTile(
                      title: "Description", info: data.description),
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
        "About this Tournament",
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
