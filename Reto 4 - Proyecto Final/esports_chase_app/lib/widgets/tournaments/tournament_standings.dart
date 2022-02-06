import 'package:flutter/material.dart';
import 'package:esports_chase_app/models/tournament_model.dart';

class TournamentStandings extends StatelessWidget {
  const TournamentStandings({Key? key, required this.tournamentData})
      : super(key: key);
  final TournamentModel tournamentData;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 25),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          child: _GroupStageCard(
            tournamentData: tournamentData,
          ),
        )
      ],
    );
  }
}

class _GroupStageCard extends StatelessWidget {
  const _GroupStageCard({Key? key, required this.tournamentData})
      : super(key: key);
  final TournamentModel tournamentData;
  @override
  Widget build(BuildContext context) {
    List<Widget> teamsCards = [
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
      )
    ];

    for (int i = 0; i < tournamentData.teams.length; i++) {
      teamsCards.add(_StandingCard(
        standing: i.toString(),
        image: tournamentData.teams_icons[i],
        name: tournamentData.teams[i],
      ));
    }

    return Column(
      children: teamsCards,
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
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
              height: 45,
              width: 45,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
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
