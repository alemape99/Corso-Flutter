import 'package:flutter/material.dart';
import 'package:social_app/api/api_user.dart';
import 'package:social_app/models/user.dart';

class ProfilePage extends StatefulWidget {
  final String id;
  const ProfilePage({required this.id,Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> _future;

  @override
  void initState() {
    _future = _fetchUser(widget.id);
    super.initState();


  }

  Future<User> _fetchUser(String id) async {
    return ApiUser.getDeatilsFor(id);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, AsyncSnapshot<User> snapshot){
          if (! snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          var user = snapshot.data!;
          return ListView(
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
                      height: 210,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${user.firstName} ${user.lastName} ',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.only(top: 8,left: 8,bottom: 8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple.shade400),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    if (user.location != null && user.location!.city != null)
                    Row(
                      children:  [
                        const Icon(Icons.place),
                        const SizedBox(width: 5,),
                        Text(user.location!.city!)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (user.email != null)
                      Row(
                        children:  [
                          const Icon(Icons.email),
                          const SizedBox(width: 5,),
                          Text(user.email!)
                        ],
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (user.gender != null)
                      Row(
                        children:  [
                          Icon(user.gender == 'male' ? Icons.male : Icons.female),
                          const SizedBox(width: 5,),
                          Text(user.gender!)
                        ],
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (user.phone != null)
                      Row(
                        children:  [
                          const Icon(Icons.phone),
                          const SizedBox(width: 5,),
                          Text(user.phone!)
                        ],
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
