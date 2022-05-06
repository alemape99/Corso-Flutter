import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/components/info_intestazione.dart';
import 'package:social_app/models/user.dart';

class IntestazioneProfilo extends StatelessWidget {
  final User user;
  const IntestazioneProfilo(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            radius: 115,
            backgroundColor: Colors.purple,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.picture ?? 'https://via.placeholder.com/150',
                scale: 0.35,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        const Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 8.0
          ),
          child: Divider(
            thickness: 3,
            color: Colors.purple,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            children: [
              if (user.dateOfBirth != null)
                Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                        DateFormat('d/M/y').format(
                            DateTime.parse(user.dateOfBirth!),
                        ),
                    ),
                  ],
                ),
              if (user.location != null && user.location!.city != null)
                InfoIntestazione(
                    icon: Icons.place,
                    testo: user.location!.city!,
                ),
              const SizedBox(
                height: 5,
              ),
              if (user.email != null)
                InfoIntestazione(
                    icon: Icons.email,
                    testo: user.email!,
                ),
              const SizedBox(
                height: 5,
              ),
              if (user.gender != null)
                Row(
                  children: [
                    Icon(
                      user.gender == 'male'
                          ? (Icons.male)
                          : (Icons.female),
                      color: Colors.purple,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                        user.gender!
                    ),
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              if (user.phone != null)
                InfoIntestazione(
                    icon: Icons.phone,
                    testo:  user.phone!,
                ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
              left: 8, top: 8
          ),
          child: Text(
            'Posts',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
