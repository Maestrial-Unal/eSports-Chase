import 'package:flutter/material.dart';

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({
    Key? key,
    required this.tab,
  }) : super(key: key);

  final String tab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromRGBO(54, 61, 71, 1),
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
