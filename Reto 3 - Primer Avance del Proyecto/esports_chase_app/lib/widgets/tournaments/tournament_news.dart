import 'package:flutter/material.dart';
import 'package:esports_chase_app/router/news_arguments.dart';

class TournamentNews extends StatefulWidget {
  final String imageURL;
  final String tabName;

  const TournamentNews({
    Key? key,
    required this.imageURL,
    required this.tabName,
  }) : super(key: key);

  @override
  State<TournamentNews> createState() => _TournamentNewsState();
}

class _TournamentNewsState extends State<TournamentNews> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _NewsHeader(imageURL: widget.imageURL, tabName: widget.tabName),
        const _NewsBody(),
      ],
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
          colorFilter: const ColorFilter.mode(Color.fromRGBO(17, 24, 33, 0.5), BlendMode.srcOver),
          child: Image(image: AssetImage(imageURL)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: width * (850 / 1920), //SE DEBEN MANTENER LAS DIMENSIONES DE LA IMAGEN
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
  const _NewsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _NewsCard(nNews: "1"),
        _NewsCard(nNews: "2"),
        _NewsCard(nNews: "3"),
        _NewsCard(nNews: "4"),
        _NewsCard(nNews: "5"),
        _NewsCard(nNews: "6"),
        _NewsCard(nNews: "7"),
        _NewsCard(nNews: "8"),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String nNews;

  const _NewsCard({Key? key, required this.nNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "News", arguments: NewsArguments(nNews, ""));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Card(
          margin: const EdgeInsets.only(bottom: 30),
          color: const Color.fromRGBO(38, 45, 54, 1),
          elevation: 5,
          shadowColor: const Color.fromRGBO(0, 82, 201, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 15, right: 8, bottom: 15),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Image(
                    image: AssetImage("static/assets/loading.gif"),
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Titulo de la Noticia $nNews",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        width: double.infinity,
                        child: Text(
                          "Esta es la descripción de la noticia $nNews. Aquí se puede encontrar información de relevancia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies malesuada rhoncus.",
                        ),
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
