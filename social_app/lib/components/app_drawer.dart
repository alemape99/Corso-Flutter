import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setBool('loggato', false );
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login',
                            (Route<dynamic> route) => false);
                  }
                  , icon: const Icon(Icons.logout_outlined))
            ],
          )
        ],
      ),
    );
  }
}
