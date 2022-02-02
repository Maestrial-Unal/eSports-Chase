import 'package:flutter/material.dart';

class TournamentInfo extends StatelessWidget {
  const TournamentInfo({Key? key, required this.type, required this.name}) : super(key: key);

  final String type;
  final String name;

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
                  _InformationTile(title: "Name", info: "$type Tournament $name"),
                  const _InformationTile(title: "Status", info: "Active"),
                  const _InformationTile(
                      title: "Description",
                      info:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultrices sapien blandit leo auctor varius. Nam gravida eget magna sed vestibulum. Vestibulum quis ipsum dignissim, faucibus leo a, scelerisque tortor."),
                  const _InformationTile(
                      //ESTA SE PUEDE CAMBIAR PARA MOSTRAR EL LOGO DEL EQUIPO ANTES DE SU NOMBRE
                      title: "Participants",
                      info:
                          "Team Name 1, Team Name 2, Team Name 3, Team Name 4, Team Name 5, Team Name 6, Team Name 7, Team Name 8, Team Name 9, Team Name 10"),
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
