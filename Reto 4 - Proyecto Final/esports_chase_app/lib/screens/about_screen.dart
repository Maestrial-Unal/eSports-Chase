import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/settings_appbar.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        body: Column(
          children: const [
            SettingsAppbar(tab: "About"),
          ],
        ));
  }
}
