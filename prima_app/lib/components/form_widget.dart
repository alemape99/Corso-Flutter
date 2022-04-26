import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String credenziali;
  final IconData icone;
  final String vuoto;
  final String sbagliato;
  final String nomecredenziali;

  const FormWidget({required this.credenziali, required this.icone, required this.vuoto,required this.sbagliato, required this.nomecredenziali, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      decoration:  InputDecoration(
        icon:  Icon(
          icone,
          color: Colors.blue,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        errorStyle: const TextStyle(color: Colors.red),
        hintText: credenziali,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30),
            right: Radius.circular(30),
          ),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 3,
          ),
        ),
      ),
      style: const TextStyle(color: Colors.blue),
      validator: (value) {
        if(value == null || value.isEmpty){
          return vuoto;
        }
        if(value != nomecredenziali){
          return sbagliato;
        }
        return null;
      },
    );
  }
}
