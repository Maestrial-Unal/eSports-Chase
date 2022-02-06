import 'package:esports_chase_app/models/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/tournaments/tournament_standings.dart';
import 'package:esports_chase_app/widgets/tournaments/tournament_appbar.dart';
import 'package:esports_chase_app/widgets/tournaments/tournament_info.dart';
import 'package:esports_chase_app/widgets/tournaments/tournament_news.dart';
import 'package:esports_chase_app/widgets/tournaments/tournament_schedule.dart';
import 'package:esports_chase_app/router/tournament_arguments.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _selectedTabColor = Color.fromRGBO(78, 186, 247, 1);
    final args =
        ModalRoute.of(context)!.settings.arguments as TournamentArguments;

    return Scaffold(
        endDrawer: TournamentInfo(data: args.data),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TournamentAppbar(),
              const TabBar(
                labelColor: _selectedTabColor,
                indicatorColor: _selectedTabColor,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: 'News'),
                  Tab(text: 'Schedule'),
                  Tab(text: 'Standings')
                ],
              ),
              _TabsContent(tournamentData: args.data)
            ],
          ),
        ));
  }
}

class _TabsContent extends StatelessWidget {
  const _TabsContent({Key? key, required this.tournamentData})
      : super(key: key);
  final TournamentModel tournamentData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: [
          TournamentNews(tournament: tournamentData),
          TournamentSchedule(tournamentData: tournamentData),
          TournamentStandings(tournamentData: tournamentData),
        ],
      ),
    );
  }
}
