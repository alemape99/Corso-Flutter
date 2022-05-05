import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';

class IntestazioneProfilo extends StatelessWidget {
  final User user;
  const IntestazioneProfilo(this.user,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CircleAvatar(
            radius: 115,
            backgroundColor: Colors.purple.shade400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.picture ?? 'https://via.placeholder.com/150',
                scale: 0.34,
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
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            thickness: 3,
            color: Colors.purple.shade400,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple.shade400),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              if (user.location != null &&
                  user.location!.city != null)
                Row(
                  children: [
                    const Icon(Icons.place),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(user.location!.city!)
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              if (user.email != null)
                Row(
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(user.email!)
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              if (user.gender != null)
                Row(
                  children: [
                    Icon(user.gender == 'male'
                        ? Icons.male
                        : Icons.female),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(user.gender!)
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              if (user.phone != null)
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      user.phone!,
                    ),
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 8),
          child: Text(
            'Post',
            style:
            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
