import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  // String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            _crearInput(),
            IconButton(
              icon: const Icon(Icons.notifications_active),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            )
          ])),
    );
  }

  Widget _crearInput() {
    var txt = TextEditingController();
    // txt.addListener(() => setState(() {}));
    return TextField(
        controller: txt,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(
          //     color: Color.fromRGBO(78, 186, 247, 1),
          //   ),
          // ),
          // focusColor: const Color.fromRGBO(78, 186, 247, 1),
          constraints: const BoxConstraints(maxWidth: 220, maxHeight: 30),
          isCollapsed: true,
          filled: true,
          hintText: "Search",
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.cancel_sharp),
            onPressed: () {
              setState(() {
                txt.clear();
              });
            },
          ),
        )
        // onChanged: (valor) {
        //   setState(() {
        //     _searchText = valor;
        //   });
        // },
        // onSubmitted: (searchString) {
        //   //Hacer la búsqueda y los cambios necesarios en la aplicación
        // },
        );
  }
}
