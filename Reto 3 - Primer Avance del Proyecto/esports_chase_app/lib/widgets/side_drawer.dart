import 'package:flutter/material.dart';
import 'package:esports_chase_app/models/drawer_model.dart';
import 'package:esports_chase_app/shared_prefs/favourite_prefs.dart';
import 'package:esports_chase_app/utils/drawer_provider.dart';
import 'package:esports_chase_app/utils/icon_to_string.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final double _drawerHeaderHeight = 120;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      child: Drawer(
        child: Column(children: <Widget>[
          _DrawerHeader(drawerHeaderHeight: _drawerHeaderHeight),
          _DrawerBody(drawerHeaderHeight: _drawerHeaderHeight)
        ]),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
    required double drawerHeaderHeight,
  })  : _drawerHeaderHeight = drawerHeaderHeight,
        super(key: key);

  final double _drawerHeaderHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _drawerHeaderHeight,
      padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(Icons.account_circle, size: 70),
            margin: const EdgeInsets.only(right: 20),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 18),
                child: const Text('Username@email.com'),
              ),
              const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}

class _DrawerBody extends StatefulWidget {
  const _DrawerBody({
    Key? key,
    required double drawerHeaderHeight,
  })  : _drawerHeaderHeight = drawerHeaderHeight,
        super(key: key);

  final double _drawerHeaderHeight;

  @override
  State<_DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<_DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - widget._drawerHeaderHeight,
      child: FutureBuilder(
        future: drawerProvider.cargarData(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: _getOptions(
              context,
              snapshot.data,
            ),
          );
        },
      ),
    );
  }

  List<Widget> _getOptions(BuildContext context, List<dynamic>? data) {
    if (data == null) return [];

    final drawerModel = Provider.of<DrawerModel>(context); //Para saber en que pestaña está
    final favourites = FavouritePreferences(); //Para llevar control sobre los juegos en favoritos

    List<Widget> feed = [];
    List<Widget> games = [];
    List<Widget> config = [];

    for (int i = 0; i < data.length; i++) {
      final listTile = data[i];

      var leading = (listTile['section'] == "Games")
          ? Image(image: AssetImage(listTile['icon']), width: 24)
          : getIcon(listTile['icon']);

      var trailing = (listTile['section'] == "Games")
          ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon((favourites.getFavourite(listTile['name']))
                  ? Icons.star_rounded
                  : Icons.star_border_rounded),
              color: const Color.fromRGBO(229, 182, 11, 1),
              onPressed: () {
                setState(() {
                  favourites.setFavourite(
                      listTile['name'], !favourites.getFavourite(listTile['name']));
                });
              },
            )
          : null;

      final widgetTemp = Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: (drawerModel.selected == listTile['name'])
                  ? const Color.fromRGBO(45, 65, 90, 1)
                  : null),
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              title: Text(listTile['name']),
              leading: leading,
              trailing: trailing,
              onTap: () {
                if (drawerModel.selected != listTile['name']) {
                  drawerModel.selected = listTile['name'];
                  Navigator.pushReplacementNamed(context, listTile['name']);
                }
                // Navigator.pop(context);
                //NAVIGATE TO TAB
              }));

      if (listTile["section"] == "Feed" ||
          listTile['section'] == "Games" && favourites.getFavourite(listTile['name'])) {
        feed.add(widgetTemp);
      } else if (listTile['section'] == "Games") {
        games.add(widgetTemp);
      } else {
        config.add(widgetTemp);
      }
    }

    return [
      _SectionWidget(sectionName: "Feed", sectioinItems: feed, notFirst: false),
      _SectionWidget(sectionName: "Games", sectioinItems: games, notFirst: true),
      _SectionWidget(sectionName: "Configuration", sectioinItems: config, notFirst: true)
    ];
  }
}

class _SectionWidget extends StatelessWidget {
  const _SectionWidget({
    Key? key,
    required this.sectionName,
    required this.sectioinItems,
    required this.notFirst,
  }) : super(key: key);

  final String sectionName;
  final List<Widget> sectioinItems;
  final bool notFirst;

  @override
  Widget build(BuildContext context) {
    if (sectioinItems.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (notFirst) ? const Divider() : Container(),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
          child: Text(
            sectionName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...sectioinItems
      ],
    );
  }
}
