import 'package:esports_chase_app/router/tournament_arguments.dart';
import 'package:flutter/material.dart';

class FeedTournamentsTab extends StatefulWidget {
  const FeedTournamentsTab({Key? key}) : super(key: key);

  @override
  State<FeedTournamentsTab> createState() => _FeedTournamentsTabState();
}

class _FeedTournamentsTabState extends State<FeedTournamentsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build;
    List<String> tournaments = [
      "International",
      "Regional",
      "Regional",
      "National",
      "National",
      "National",
    ];
    return _TournamentBuilder(tournaments: tournaments);
  }

  @override
  bool get wantKeepAlive => true;
}

class _TournamentBuilder extends StatelessWidget {
  const _TournamentBuilder({
    Key? key,
    required this.tournaments,
  }) : super(key: key);

  final List<String> tournaments;

  @override
  Widget build(BuildContext context) {
    List<String> favourites = [];
    List<String> international = [];
    List<String> regional = [];
    List<String> national = [];

    for (int i = 0; i < tournaments.length; i++) {
      switch (tournaments[i]) {
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
        (favourites.isNotEmpty) ? _TournamentCards(type: favourites) : Container(),
        (international.isNotEmpty) ? _TournamentCards(type: international) : Container(),
        (regional.isNotEmpty) ? _TournamentCards(type: regional) : Container(),
        (national.isNotEmpty) ? _TournamentCards(type: national) : Container(),
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
    required this.type,
  }) : super(key: key);

  final List<String> type;

  @override
  Widget build(BuildContext context) {
    List<Widget> typeCards = [];
    for (int i = 0; i < type.length; i++) {
      bool isFirst = false;
      bool isLast = false;
      if (i == 0) isFirst = true;
      if (i == type.length - 1) isLast = true;

      typeCards.add(_TCard(
        type: type[i],
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
              type[0],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        ...typeCards,
      ],
    );
  }
}

class _TCard extends StatelessWidget {
  const _TCard({
    Key? key,
    required this.type,
    required this.index,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  final String type;
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
            arguments: TournamentArguments(
                type, (index + 1).toString(), "static/assets/B_Tournament.jpg", ""));
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
          padding: const EdgeInsets.only(left: 5, right: 10),
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
                icon: const Icon(
                  Icons.star_rounded,
                  color: Color.fromRGBO(229, 182, 11, 1),
                ),
              ),
              const Image(
                image: AssetImage("static/assets/loading.gif"),
                // height: 60,
                width: 30,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "$type Tournament",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
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
