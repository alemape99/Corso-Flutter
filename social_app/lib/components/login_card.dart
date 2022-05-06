import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCard extends StatelessWidget {
  final User user;

  const LoginCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('loggedUserId', user.id!);
        Navigator.of(context).popAndPushNamed('/home');
      },
      child: Card(
        elevation: 20,
        color: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      user.picture!,
                  ),
                  scale: 0.65,
                ),
                borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(user.firstName!,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),
                ),
                const SizedBox(width: 5),
                Text(user.lastName!,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
