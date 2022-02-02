import 'package:flutter/material.dart';

class TournamentSchedule extends StatelessWidget {
  const TournamentSchedule({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _LiveMatch(name: name),
        _NextMatch(name: name),
        _NextMatch(name: name),
        _NextMatch(name: name),
        _NextMatch(name: name),
      ],
    );
  }
}

class _LiveMatch extends StatelessWidget {
  const _LiveMatch({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(38, 45, 54, 1),
      ),
      child: Column(
        children: [
          _headerInfo(),
          _matchTeams(),
          _divider(),
          _matchInfo(),
        ],
      ),
    );
  }

  Widget _headerInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromRGBO(85, 250, 58, 1),
            ),
            height: 8,
            width: 8,
          ),
          const Text(
            "Live",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                name,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchTeams() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: const [
              Image(
                image: AssetImage("static/assets/loading.gif"),
                width: 100,
              ),
              Text("Team 1")
            ],
          ),
        ),
        const Image(
          image: AssetImage("static/assets/Vs.png"),
          height: 80,
        ),
        Expanded(
          child: Column(
            children: const [
              Image(
                image: AssetImage("static/assets/loading.gif"),
                width: 100,
              ),
              Text("Team 2")
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          color: const Color.fromRGBO(5, 115, 255, 1),
          height: 1,
        ),
        const Align(
          child: Text(
            "Match Statistics",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }

  Widget _matchInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  _statTile(1),
                  const SizedBox(height: 10),
                  _statTile(2),
                  const SizedBox(height: 10),
                  _statTile(3),
                  const SizedBox(height: 10),
                  _statTile(4),
                  const SizedBox(height: 10),
                  _statTile(5),
                  const SizedBox(height: 10),
                  _statTile(6),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  _statTileR(1),
                  const SizedBox(height: 10),
                  _statTileR(2),
                  const SizedBox(height: 10),
                  _statTileR(3),
                  const SizedBox(height: 10),
                  _statTileR(4),
                  const SizedBox(height: 10),
                  _statTileR(5),
                  const SizedBox(height: 10),
                  _statTileR(6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _statTile(int number) {
    return Row(
      children: [
        Text(
          "Stat $number",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            // fontSize: 18,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("value $number"),
          ),
        ),
      ],
    );
  }

  _statTileR(int number) {
    return Row(
      children: [
        Text("value $number"),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Stat $number",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NextMatch extends StatelessWidget {
  const _NextMatch({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(38, 45, 54, 1),
      ),
      child: Column(
        children: [
          _headerInfo(),
          _matchTeams(),
        ],
      ),
    );
  }

  Widget _headerInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          const Text(
            "Tomorrow - 7am",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              decoration: TextDecoration.underline,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                name,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchTeams() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: const [
              Image(
                image: AssetImage("static/assets/loading.gif"),
                width: 100,
              ),
              Text("Team 1")
            ],
          ),
        ),
        const Image(
          image: AssetImage("static/assets/Vs.png"),
          height: 80,
        ),
        Expanded(
          child: Column(
            children: const [
              Image(
                image: AssetImage("static/assets/loading.gif"),
                width: 100,
              ),
              Text("Team 2")
            ],
          ),
        ),
      ],
    );
  }
}
