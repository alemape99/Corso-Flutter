import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/pages/profile_page.dart';

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
                children:  [
                  Image.asset( 'assets/icona.png', scale: 4.5,),
                  const Text('Benvenuto',  style: TextStyle(
                    fontSize: 18,
                  ),),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.purple,),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).popAndPushNamed('/home'),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.purple,),
              title: const Text('Profile'),
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                var _loggedId = sp.getString('loggedUserId');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      id: _loggedId!,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 440,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.purple,),
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
