import 'package:flutter/material.dart';
import 'package:esports_chase_app/models/next_match_model.dart';
import 'package:esports_chase_app/models/live_match_model.dart';

import 'package:esports_chase_app/services/esports_chase_api.dart';
import 'package:esports_chase_app/utils/transform_data.dart';

import 'package:esports_chase_app/utils/preferences_http.dart';

class LiveTab extends StatefulWidget {
  const LiveTab({Key? key, required this.screen}) : super(key: key);
  final String screen;
  @override
  State<LiveTab> createState() => _LiveTabState();
}

class _LiveTabState extends State<LiveTab> with AutomaticKeepAliveClientMixin {
  Future<Null> _refreshLocalGallery() async {
    setState(() {});
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    EsportsChaseHttpService esportsChaseService = EsportsChaseHttpService();
    String query = "";
    if (widget.screen != "feed") {
      query = "?esport=${widget.screen}";
    } else {
      query = getQuery();
    }
    Future<String> futureNextMatchs =
        esportsChaseService.getRawNextMatchs(query);
    Future<String> futureLiveMatchs =
        esportsChaseService.getRawLiveMatchs(query);

    super.build;
    return FutureBuilder(
      future: Future.wait([futureLiveMatchs, futureNextMatchs]),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        List<LiveMatchModel> liveMatchs =
            transformDataLiveMatch(snapshot.data?[0]);
        List<NextMatchModel> nextMatchs =
            transformDataNextMatch(snapshot.data?[1]);

        List<Widget> matchs = [];
        for (int i = 0; i < liveMatchs.length; i++) {
          matchs.add(_LiveMatch(matchData: liveMatchs[i]));
        }
        for (int i = 0; i < nextMatchs.length; i++) {
          matchs.add(_NextMatch(matchData: nextMatchs[i]));
        }
        return RefreshIndicator(
            onRefresh: _refreshLocalGallery,
            child: ListView(padding: EdgeInsets.zero, children: matchs));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _LiveMatch extends StatelessWidget {
  const _LiveMatch({
    Key? key,
    required this.matchData,
  }) : super(key: key);

  final LiveMatchModel matchData;

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
          Text(
            "Live: ${matchData.time}",
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Tournament ${matchData.tournament}",
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
            children: [
              Image.network(matchData.team_1_icon,
                  fit: BoxFit.contain, height: 90, width: 90),
              Text(matchData.team_1)
            ],
          ),
        ),
        const Image(
          image: AssetImage("static/assets/Vs.png"),
          height: 80,
        ),
        Expanded(
          child: Column(
            children: [
              Image.network(matchData.team_2_icon,
                  fit: BoxFit.contain, height: 90, width: 90),
              Text(matchData.team_2)
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
    List<Widget> leftStats = [
      _statTile(
        matchData.stats_name[0],
        matchData.stats_team_1[0],
      )
    ];
    List<Widget> rightStats = [
      _statTileR(
        matchData.stats_name[0],
        matchData.stats_team_2[0],
      )
    ];
    for (int i = 1; i < matchData.stats_name.length; i++) {
      leftStats.add(const SizedBox(height: 10));
      leftStats
          .add(_statTile(matchData.stats_name[i], matchData.stats_team_1[i]));

      rightStats.add(const SizedBox(height: 10));
      rightStats
          .add(_statTileR(matchData.stats_name[i], matchData.stats_team_2[i]));
    }

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
                children: leftStats,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: rightStats,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _statTile(String name, String value) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            // fontSize: 18,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(value),
          ),
        ),
      ],
    );
  }

  _statTileR(String name, String value) {
    return Row(
      children: [
        Text(value),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              name,
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
    required this.matchData,
  }) : super(key: key);

  final NextMatchModel matchData;

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
          Text(
            matchData.date,
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              decoration: TextDecoration.underline,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Tournament ${matchData.tournament}",
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
            children: [
              Image.network(matchData.team_1_icon,
                  fit: BoxFit.contain, height: 90, width: 90),
              Text(matchData.team_1)
            ],
          ),
        ),
        const Image(
          image: AssetImage("static/assets/Vs.png"),
          height: 80,
        ),
        Expanded(
          child: Column(
            children: [
              Image.network(matchData.team_2_icon,
                  fit: BoxFit.contain, height: 90, width: 90),
              Text(matchData.team_2)
            ],
          ),
        ),
      ],
    );
  }
}
