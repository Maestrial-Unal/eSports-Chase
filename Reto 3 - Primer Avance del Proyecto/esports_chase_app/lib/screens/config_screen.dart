import 'package:flutter/material.dart';
import 'package:esports_chase_app/widgets/side_drawer.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuration"),
      ),
      drawer: const SideDrawer(),
      body: const Center(
        child: Text("Llegó a las configuraciones"),
      ),
    );
  }
}
