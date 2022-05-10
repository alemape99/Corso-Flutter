import 'package:flutter/material.dart';
import 'package:social_app/api/api_user.dart';
import 'package:social_app/models/user.dart';

class ModificaUtente extends StatefulWidget {
  final User user;
  const ModificaUtente({required this.user, Key? key}) : super(key: key);

  @override
  State<ModificaUtente> createState() => _ModificaUtenteState();
}

class _ModificaUtenteState extends State<ModificaUtente> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    _phoneController = TextEditingController(text: widget.user.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8,
        left: 8,
        right: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom,),
      child: ListView(
        shrinkWrap: true,
        children: [
          TextField(
            controller: _phoneController,
          ),
          Row(
            children: [
              TextButton(
                  child: const Text('Annulla'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
              ),
              TextButton(
                  child: const Text('Modifica'),
                  onPressed: () async {
                    var _modUser = User(
                      id: widget.user.id,
                      phone: _phoneController.text
                    );
                    await ApiUser.modifiyUser(_modUser);
                    Navigator.of(context).pop(true);
                  },
              ),
            ],
          )
        ],
      ),
    );
  }
}
