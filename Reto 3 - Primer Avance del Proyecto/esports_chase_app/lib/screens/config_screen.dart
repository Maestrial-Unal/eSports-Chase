import 'package:esports_chase_app/widgets/settings_appbar.dart';
import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        body: Column(
          children: [
            const SettingsAppbar(tab: "Preferences"),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _preference("1"),
                  _preference("2"),
                  _preference("3"),
                  _preference("4"),
                  _preference("5"),
                  _preference("6"),
                  _preference("7"),
                  _preference("8"),
                  _preference("9"),
                  _preference("10"),
                  _preference("11"),
                  _preference("12"),
                  _preference("13"),
                  _preference("14"),
                  _preference("15"),
                ],
              ),
            )
          ],
        ));
  }

  ListTile _preference(String number) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 23),
      title: Text("Preference $number"),
      subtitle: Text("Description given to the user"),
      onTap: () {
        print("Preference $number tapped");
      },
    );
  }
}
