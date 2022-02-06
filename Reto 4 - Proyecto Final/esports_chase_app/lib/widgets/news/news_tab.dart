import 'package:esports_chase_app/router/news_arguments.dart';
import 'package:flutter/material.dart';

import 'package:esports_chase_app/models/new_model.dart';

import 'package:esports_chase_app/services/esports_chase_api.dart';
import 'package:esports_chase_app/utils/transform_data.dart';
import 'package:esports_chase_app/utils/preferences_http.dart';

class NewsTab extends StatefulWidget {
  final String imageURL;
  final String tabName;
  final String screen;

  const NewsTab({
    Key? key,
    required this.imageURL,
    required this.tabName,
    required this.screen,
  }) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with AutomaticKeepAliveClientMixin {
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

    super.build;
    return RefreshIndicator(
      onRefresh: _refreshLocalGallery,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _NewsHeader(imageURL: widget.imageURL, tabName: widget.tabName),
          FutureBuilder(
              future: esportsChaseService.getRawNews(query),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return _NewsBody(
                  newsData: transformDataNews(snapshot.data),
                );
              }),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _NewsHeader extends StatelessWidget {
  const _NewsHeader({
    Key? key,
    required this.imageURL,
    required this.tabName,
  }) : super(key: key);

  final String imageURL;
  final String tabName;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
              Color.fromRGBO(17, 24, 33, 0.5), BlendMode.srcOver),
          child: Image(image: AssetImage(imageURL)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: width *
              (850 / 1920), //SE DEBEN MANTENER LAS DIMENSIONES DE LA IMAGEN
          margin: const EdgeInsets.only(bottom: 30),
          child: Align(
            child: Text(
              tabName,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

class _NewsBody extends StatelessWidget {
  final List<NewModel> newsData;

  const _NewsBody({Key? key, required this.newsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myChildren = [];
    for (var i = 0; i < newsData.length; i++) {
      myChildren.add(_NewsCard(nNews: i.toString(), data: newsData[i]));
    }
    return Column(
      children: myChildren,
    );
  }
}

// Entrada de la card
class _NewsCard extends StatelessWidget {
  final String nNews;
  final NewModel data;

  const _NewsCard({Key? key, required this.nNews, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "News",
            arguments: NewsArguments(nNews, "", data));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Card(
          margin: const EdgeInsets.only(bottom: 30),
          color: const Color.fromRGBO(38, 45, 54, 1),
          elevation: 5,
          shadowColor: const Color.fromRGBO(0, 82, 201, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 15, right: 8, bottom: 15),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.network(
                    data.image,
                    fit: BoxFit.cover,
                  ),
                  height: 100,
                  width: 140,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        width: double.infinity,
                        child: Text(data.description),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
