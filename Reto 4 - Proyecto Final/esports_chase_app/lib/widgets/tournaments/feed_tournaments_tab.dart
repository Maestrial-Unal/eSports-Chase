import 'package:esports_chase_app/router/tournament_arguments.dart';
import 'package:flutter/material.dart';

import 'package:esports_chase_app/models/tournament_model.dart';

class FeedTournamentsTab extends StatefulWidget {
  final List<TournamentModel> tournaments;
  const FeedTournamentsTab({Key? key, required this.tournaments})
      : super(key: key);

  @override
  State<FeedTournamentsTab> createState() => _FeedTournamentsTabState();
}

class _FeedTournamentsTabState extends State<FeedTournamentsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build;
    return _TournamentBuilder(tournaments: widget.tournaments);
  }

  @override
  bool get wantKeepAlive => true;
}

class _TournamentBuilder extends StatelessWidget {
  const _TournamentBuilder({
    Key? key,
    required this.tournaments,
  }) : super(key: key);

  final List<TournamentModel> tournaments;

  @override
  Widget build(BuildContext context) {
    List<TournamentModel> favourites = [];
    List<TournamentModel> international = [];
    List<TournamentModel> regional = [];
    List<TournamentModel> national = [];

    for (int i = 0; i < tournaments.length; i++) {
      switch (tournaments[i].name) {
        case "Favourite":
          favourites.add(tournaments[i]);
          break;
        case "International":
          international.add(tournaments[i]);
          break;
        case "Regional":
          regional.add(tournaments[i]);
          break;
        default:
          national.add(tournaments[i]);
          break;
      }
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      children: [
        (favourites.isNotEmpty)
            ? _TournamentCards(tournaments: favourites)
            : Container(),
        (international.isNotEmpty)
            ? _TournamentCards(tournaments: international)
            : Container(),
        (regional.isNotEmpty)
            ? _TournamentCards(tournaments: regional)
            : Container(),
        (national.isNotEmpty)
            ? _TournamentCards(tournaments: national)
            : Container(),
        Container(
          height: 25,
        ),
      ],
    );
  }
}

class _TournamentCards extends StatelessWidget {
  const _TournamentCards({
    Key? key,
    required this.tournaments,
  }) : super(key: key);

  final List<TournamentModel> tournaments;

  @override
  Widget build(BuildContext context) {
    List<Widget> tournamentsCards = [];
    for (int i = 0; i < tournaments.length; i++) {
      bool isFirst = false;
      bool isLast = false;
      if (i == 0) isFirst = true;
      if (i == tournaments.length - 1) isLast = true;

      tournamentsCards.add(_TCard(
        tournament: tournaments[i],
        index: i,
        isFirst: isFirst,
        isLast: isLast,
      ));
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              tournaments[0].type,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        ...tournamentsCards,
      ],
    );
  }
}

class _TCard extends StatelessWidget {
  const _TCard({
    Key? key,
    required this.tournament,
    required this.index,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  final TournamentModel tournament;
  final int index;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      color: const Color.fromRGBO(38, 45, 54, 1),
      borderRadius: BorderRadius.only(
        topLeft: (isFirst) ? const Radius.circular(8) : Radius.zero,
        topRight: (isFirst) ? const Radius.circular(8) : Radius.zero,
        bottomLeft: (isLast) ? const Radius.circular(8) : Radius.zero,
        bottomRight: (isLast) ? const Radius.circular(8) : Radius.zero,
      ),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "Tournament",
            arguments: TournamentArguments(tournament, ""));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: (!isLast)
                ? const BorderSide(color: Color.fromRGBO(110, 141, 181, 1))
                : BorderSide.none,
          ),
        ),
        child: Container(
          height: 80,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: decoration,
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 30,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  print("Toggle Facourite $index");
                },
                icon: Icon(
                  (tournament.type == "Favourite")
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: const Color.fromRGBO(229, 182, 11, 1),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.network(
                  tournament.icon,
                  fit: BoxFit.cover,
                ),
                height: 70,
                width: 70,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    tournament.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
