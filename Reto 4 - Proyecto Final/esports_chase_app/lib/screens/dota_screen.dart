import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/live_tab.dart';
import 'package:esports_chase_app/widgets/news/news_tab.dart';
import 'package:esports_chase_app/widgets/right_drawer.dart';
import 'package:esports_chase_app/widgets/tournaments/tournaments_tab.dart';
import 'package:esports_chase_app/widgets/custom_appbar.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';

import 'package:esports_chase_app/services/esports_chase_api.dart';
import 'package:esports_chase_app/utils/transform_data.dart';

class DotaScreen extends StatelessWidget {
  const DotaScreen({Key? key}) : super(key: key);

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
              future: esportsChaseService.getRawNews("esport=DOTA"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return NewsTab(
                  imageURL: "static/assets/B_Dota.jpg",
                  tabName: "Dota 2",
                  newsData: transformDataNews(snapshot.data),
                );
              }),
          const TournamentsTab(
            tournaments: [],
          ),
          const LiveTab(),
        ],
      ),
    );
  }
}
