import 'package:flutter/material.dart';

import '../../../auth/interactor/atoms/auth_atom.dart';

class ThingsPage extends StatefulWidget {
  const ThingsPage({super.key});

  @override
  State<ThingsPage> createState() => _ThingsPageState();
}

class _ThingsPageState extends State<ThingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 40),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                logoutAction();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Things'),
      ),
    );
  }
}
