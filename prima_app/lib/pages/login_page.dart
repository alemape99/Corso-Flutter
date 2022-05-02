import 'package:flutter/material.dart';
import 'package:prima_app/components/form_widget.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';


class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80, left: 80, right: 80),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.jpg'),
              ),
            ),
          ),
          const Text(
            'Welcome',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Log in to your Flutter Account',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              child: Container(
                height: 300,
                child: Form(
                  key: _formkey,
                    child: ListView(
                      children: [
                        const FormWidget(credenziali: 'Username',icone: Icons.person,nomecredenziali: 'alessandro',vuoto: 'Inserire un username',sbagliato: 'Username non valido',),
                        const SizedBox(height: 30,),
                        const FormWidget(credenziali: 'Password',icone: Icons.lock_outline,nomecredenziali: 'mapelli',vuoto: 'Inserire una password', sbagliato: 'Password non valida',),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Align(
                            alignment: Alignment.centerRight,
                              child: Text('Forgot Password?'
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 64),
                          child: ElevatedButton(
                              onPressed: ()  async {
                                if(_formkey.currentState?.validate() ?? false) {
                                  StreamingSharedPreferences sp = await StreamingSharedPreferences.instance;
                                  sp.setBool('loggato', true );
                                  Navigator.of(context).popAndPushNamed('/home');
                                }
                                },
                              child: const Text('Log In')
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
