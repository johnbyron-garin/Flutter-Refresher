import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../views/settings_screen.dart';
import 'my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Icon(
                Icons.food_bank,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            MyDrawerTile(
              text: 'H O M E',
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
            MyDrawerTile(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen(),
                  ),
                );
              },
            ),
            const Spacer(),
            MyDrawerTile(
              text: 'L O G O U T',
              icon: Icons.logout,
              onTap: logout,
            ),
          ],
        ));
  }
}
