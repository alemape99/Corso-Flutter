import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';

class ModificaUtente extends StatefulWidget {
  final User? user;
  const ModificaUtente({this.user, Key? key}) : super(key: key);

  @override
  State<ModificaUtente> createState() => _ModificaUtenteState();
}

class _ModificaUtenteState extends State<ModificaUtente> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    if(widget.user!.phone != null)
    _phoneController = TextEditingController(text: widget.user!.phone);
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
          TextField(controller: _phoneController,)
        ],
      ),
    );
  }
}
