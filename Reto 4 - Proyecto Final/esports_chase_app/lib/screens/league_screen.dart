import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/live_tab.dart';
import 'package:esports_chase_app/widgets/news/news_tab.dart';
import 'package:esports_chase_app/widgets/right_drawer.dart';
import 'package:esports_chase_app/widgets/tournaments/tournaments_tab.dart';
import 'package:esports_chase_app/widgets/custom_appbar.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';
import 'package:flutter/foundation.dart';

import 'package:esports_chase_app/services/esports_chase_api.dart';
import 'package:esports_chase_app/utils/transform_data.dart';

import 'package:esports_chase_app/models/tournament_model.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _selectedTabColor = Color.fromRGBO(78, 186, 247, 1);

    return Scaffold(
        drawer: const SideDrawer(),
        endDrawer: const RightDrawer(),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: const [
              CustomAppbar(),
              TabBar(
                labelColor: _selectedTabColor,
                indicatorColor: _selectedTabColor,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: 'News'),
                  Tab(text: 'Tournaments'),
                  Tab(text: 'Live Matches')
                ],
                // isScrollable: true, //Solo utilizar si se añaden nuevas pestañas
              ),
              _TabsContent()
            ],
          ),
        ));
  }
}

// V2
class _TabsContent extends StatelessWidget {
  const _TabsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EsportsChaseHttpService esportsChaseService = EsportsChaseHttpService();
    return Expanded(
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: [
          FutureBuilder(
              future: esportsChaseService.getRawNews("esport=LOL"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return NewsTab(
                  imageURL: "static/assets/B_League.jpg",
                  tabName: "League of Legends",
                  newsData: transformDataNews(snapshot.data),
                );
              }),
          FutureBuilder(
              future: esportsChaseService.getRawTournaments("esport=LOL"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return TournamentsTab(
                  tournaments: transformDataTournaments(snapshot.data),
                );
              }),
          const LiveTab(),
        ],
      ),
    );
  }
}

// List<TournamentModel> transformData(String? raw) {
//   List<TournamentModel> torneosMelos = [];
//   torneosMelos.add(TournamentModel(
//       "International",
//       "12054",
//       "Worlds LOL",
//       "https://static.wikia.nocookie.net/logopedia/images/4/42/LOL_Worlds_icon.png/revision/latest/scale-to-width-down/250?cb=20200304185510",
//       "WORLD"));

//   torneosMelos.add(TournamentModel(
//     "International",
//     "12051",
//     "MSI",
//     "https://liquipedia.net/commons/images/thumb/d/d7/MSI_crest.png/600px-MSI_crest.png",
//     "WORLD",
//   ));

//   return torneosMelos;
// }



// class LOLEsportsHttpService {
//   var headers = {'x-api-key': '0TvQnueqKa5mxJntVWt0w4LpLfEkrV1Ta8rQBb9Z'};
//   final String baseURL = "https://esports-api.lolesports.com/persisted/gw";

//   Future<String> getRawLeagues() async {
//     String fullURL = '$baseURL/getLeagues?hl=tr-TR';
//     Response res = await get(Uri.parse(fullURL), headers: headers);

//     if (res.statusCode == 200) {
//       return res.body;
//     } else {
//       throw "Unable to retrieve posts.";
//     }
//   }
// }

