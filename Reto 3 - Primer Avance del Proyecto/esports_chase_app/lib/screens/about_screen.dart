import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      drawer: const SideDrawer(),
      body: const Center(
        child: Text("Llegó a las configuraciones"),
      ),
    );
  }
}
