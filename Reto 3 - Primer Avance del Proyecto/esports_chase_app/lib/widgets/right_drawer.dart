import 'package:flutter/material.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
      child: Drawer(
        child: Column(children: [
          _header(),
          const _NotificationsBody(),
        ]),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      child: const Text(
        "Notifications",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}

class _NotificationsBody extends StatelessWidget {
  const _NotificationsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              _NotificationCard(image: "static/assets/League.png"),
              _NotificationCard(image: "static/assets/Valorant.png"),
              _NotificationCard(image: "static/assets/League.png"),
              _NotificationCard(image: "static/assets/Valorant.png"),
              _NotificationCard(image: "static/assets/Valorant.png"),
            ],
          )),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(38, 45, 54, 1),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image(
                  image: AssetImage(image),
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Tournament Name",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  constraints: const BoxConstraints(maxWidth: 20, maxHeight: 20),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 5),
                  iconSize: 20,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: const Color.fromRGBO(80, 85, 90, 1),
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    print("Se presionó el botón para eliminar la notificación");
                  },
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color.fromRGBO(80, 85, 90, 1),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Aquí se encuenta la información de la notificación, y su descripción. Si se pulsa la notificación se debe redirigir al usuario al lugar en la aplicación en la que pueda ver más información sobre la misma.",
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
