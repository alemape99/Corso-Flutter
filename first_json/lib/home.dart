import 'package:first_json/api/api_users.dart';
import 'package:first_json/models/users.dart';
import 'package:first_json/models/users_response.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Users> _listaUsersVisualizzate;
  late bool _hasMoreUsers;
  late int _skipUsers;
  late Future<List<Users>> _future;


  @override
  void initState(){
    super.initState();
    _listaUsersVisualizzate = [];
    _hasMoreUsers = false;
    _skipUsers = 0;
    _future = _fetchUsers();
  }

  Future<List<Users>> _fetchUsers() async {
    final UserResponse result = await ApiUsers.getUsersFromInternet(skip: _skipUsers);
    setState(() {
      _skipUsers = _skipUsers + result.limit;
      _hasMoreUsers = (result.total - _skipUsers > 0);
      _listaUsersVisualizzate = _listaUsersVisualizzate + result.users;
    });

    return _listaUsersVisualizzate;

  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            _listaUsersVisualizzate = [];
            _hasMoreUsers = false;
            _skipUsers = 0;
            _future = _fetchUsers();
          });
          return Future.value();
        },
        child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data is List<Users>) {
                final listUsers = snapshot.data as List<Users>;

                return ListView.builder(
                    itemCount: listUsers.length + (_hasMoreUsers ? 1 : 0),
                    itemBuilder: (context, index) {
                      if(index == listUsers.length ){
                        _future = _fetchUsers();
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const  BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('${listUsers[index].firstName} ${listUsers[index].lastName} '),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Gender: ${listUsers[index].gender}'),
                                Text('Phone Number: ${listUsers[index].phone}'),
                                Text('Address: ${listUsers[index].address}'),
                                Text('University: ${listUsers[index].university}')
                              ],
                            ),
                          ),
                        ),
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
      ),
    );
  }
}
