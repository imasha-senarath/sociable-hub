import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helper_functions.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  void logout() async {
    //FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
    showConfirmDialog(
      'Logout',
      'Are you sure you want to logout?',
      () {
        FirebaseAuth.instance.signOut();
      },
      context,
    );
    //
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile_page');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.group,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("Users"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/users_page');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: const Text("Logout"),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
