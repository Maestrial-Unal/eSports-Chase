import 'package:esports_chase_app/widgets/live_tab.dart';
import 'package:esports_chase_app/widgets/tournaments_tab.dart';
import 'package:esports_chase_app/widgets/news_tab.dart';
import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/custom_appbar.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldState = GlobalKey<ScaffoldState>();
    const _selectedTabColor = Color.fromRGBO(78, 186, 247, 1);

    return Scaffold(
        key: scaffoldState,
        drawer: const SideDrawer(),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              CustomAppbar(scaffoldState: scaffoldState),
              const TabBar(
                labelColor: _selectedTabColor,
                indicatorColor: _selectedTabColor,
                unselectedLabelColor: Colors.white,
                tabs: [Tab(text: 'News'), Tab(text: 'Tournaments'), Tab(text: 'Live Matches')],
                // isScrollable: true, //Solo utilizar si se añaden nuevas pestañas
              ),
              const _TabsContent()
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
    return const Expanded(
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        children: [
          NewsTab(imageURL: "static/assets/B_League.jpg", tabName: "Your Feed"),
          TournamentsTab(),
          LiveTab(),
        ],
      ),
    );
  }
}
