import 'package:flutter/material.dart';

class NewsTab extends StatefulWidget {
  final String imageURL;
  final String tabName;

  const NewsTab({
    Key? key,
    required this.imageURL,
    required this.tabName,
  }) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _NewsHeader(imageURL: widget.imageURL, tabName: widget.tabName),
        const _NewsBody(),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
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
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(Color.fromRGBO(17, 24, 33, 0.5), BlendMode.srcOver),
          child: Image(image: AssetImage(imageURL)),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 35),
          child: Align(
            heightFactor: 3.75,
            child: Text(
              tabName,
              style: const TextStyle(fontSize: 36),
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
        print("Se presionó la noticia $nNews");
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
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading: const Image(
                image: AssetImage("static/assets/loading.gif"),
                height: 80,
              ),
              title: const Text(
                "Titulo de la Noticia",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "Esta es la descripción de la noticia $nNews. Aquí se puede encontrar información de relevancia.",
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
