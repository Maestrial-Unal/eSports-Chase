import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eSports Chase"),
        backgroundColor: Color.fromRGBO(38, 52, 55, 1),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.photo_album, color: Colors.blue,),
                  title: Text("Titulo de la Tarjeta"),
                  subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text("Cancelar"),
                      onPressed: () {}
                    ),

                    TextButton(
                      child: const Text("Ok"),
                      onPressed: () {}
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}