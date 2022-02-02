import 'package:flutter/material.dart';

class TournamentStandings extends StatelessWidget {
  const TournamentStandings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 25),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: const _GroupStageCard(),
        )
      ],
    );
  }
}

class _GroupStageCard extends StatelessWidget {
  const _GroupStageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Group Stage",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        const _StandingCard(
          standing: "1",
          image: "static/assets/loading.gif",
          name: "Team 1 Name",
        ),
        const _StandingCard(
          standing: "2",
          image: "static/assets/loading.gif",
          name: "Team 2 Name",
        ),
        const _StandingCard(
          standing: "3",
          image: "static/assets/loading.gif",
          name: "Team 3 Name",
        ),
        const _StandingCard(
          standing: "4",
          image: "static/assets/loading.gif",
          name: "Team 4 Name",
        ),
        const _StandingCard(
          standing: "5",
          image: "static/assets/loading.gif",
          name: "Team 5 Name",
        ),
        const _StandingCard(
          standing: "6",
          image: "static/assets/loading.gif",
          name: "Team 6 Name",
        ),
        const _StandingCard(
          standing: "7",
          image: "static/assets/loading.gif",
          name: "Team 7 Name",
        ),
        const _StandingCard(
          standing: "8",
          image: "static/assets/loading.gif",
          name: "Team 8 Name",
        ),
        const _StandingCard(
          standing: "9",
          image: "static/assets/loading.gif",
          name: "Team 9 Name",
        ),
        const _StandingCard(
          standing: "10",
          image: "static/assets/loading.gif",
          name: "Team 10 Name",
        ),
      ],
    );
  }
}

class _StandingCard extends StatelessWidget {
  const _StandingCard({
    Key? key,
    required this.standing,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String standing;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(38, 45, 54, 1),
        margin: const EdgeInsets.only(top: 1),
        padding: const EdgeInsets.fromLTRB(10, 10, 15, 10),
        child: Row(
          children: [
            SizedBox(
              width: 35,
              child: Text(
                standing,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: const Color.fromRGBO(255, 255, 255, 1),
              width: 1,
              height: 45,
            ),
            Image(
              image: AssetImage(image),
              height: 45,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            )
          ],
        ));
  }
}
