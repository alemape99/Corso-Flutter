import 'package:flutter/material.dart';
import 'package:social_app/components/login_card.dart';
import 'package:social_app/models/user.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({ Key? key}) : super(key: key);

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
                image: AssetImage('assets/icona.png'),
              ),
            ),
          ),
          const Text(
            'Social App',
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'Benvenuto su Social App',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Expanded(
                child: LoginCard(
                    User(
                        id: "60d0fe4f5311236168a109cd",
                        firstName: "Roberto",
                        lastName: "Vega",
                        picture:"https://randomuser.me/api/portraits/med/men/25.jpg")
                ),
              ),
              Expanded(
                child: LoginCard(
                    User(
                        id:"60d0fe4f5311236168a109cf",
                        firstName: "Carolina",
                        lastName: "Lima",
                        picture: "https://randomuser.me/api/portraits/med/women/5.jpg")
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(16)
            ),
            child: const Text(
              'Per accedere scegli uno dei due account',
              style: TextStyle(fontSize: 15,color: Colors.white),),
          )
        ],
      ),
    );
  }
}
