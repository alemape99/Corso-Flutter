import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/pages/profile_page.dart';

class BottoneProfilo extends StatelessWidget {
  const BottoneProfilo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
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
      icon: const Icon(Icons.person, color: Colors.purple,),
    );
  }
}
