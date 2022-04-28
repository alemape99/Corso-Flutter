import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: SafeArea(
        child: Column(

          children: [
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(

                        'assets/logo.jpeg'
                    ),
                  ),
                  Text('Benvenuto',  style: TextStyle(
                    fontSize: 18,
                  ),),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).popAndPushNamed('/home'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () => Navigator.of(context).popAndPushNamed('/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Favorite'),
              onTap: () =>
                  Navigator.of(context).popAndPushNamed('/favorite'),
            ),
            ListTile(
              leading: const Icon(Icons.travel_explore),
              title: const Text('Global Search'),
              onTap: () => Navigator.of(context).popAndPushNamed('/search'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setBool('loggato', false );
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login',
                        (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
