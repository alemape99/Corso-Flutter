import 'package:first_json/api/api_users.dart';
import 'package:first_json/models/users_response.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: FutureBuilder(
          future: ApiUsers.getUsersFromInternet(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data is UserResponse) {
              final listUsers = (snapshot.data as UserResponse).users;

              return ListView.builder(
                  itemCount: listUsers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listUsers[index].firstName),
                      subtitle: Text(listUsers[index].lastName),
                    );
                  });
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          }),
    );
  }
}
