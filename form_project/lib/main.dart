import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
  final _controllerPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Page'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60),
              bottomRight: Radius.circular(60),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_outlined)),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/sunset.jpg',
                          )),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.widgets_outlined),
                        title: Text(
                          'Menu Options',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.paid_outlined),
                        title: Text(
                          'Refunds',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.credit_card_outlined),
                        title: Text(
                          'Transactions',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings_outlined),
                        title: Text(
                          'Settings',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            const Text(
              "Let's Get Started",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              'Create an account to Q Allure to get all features',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                height: 580,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _controllerName,
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.red),
                          hintText: 'Name',
                          focusedBorder: OutlineInputBorder(
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
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _controllerEmail,
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.blue,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.red),
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
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
                        validator: (value){
                          if(value ==null || value.isEmpty){
                            return 'Inserisci una email';
                          }
                          if(!value.contains('@') || !value.contains('.')){
                            return 'Inserisci una mail valida';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _controllerPhone,
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.phone_outlined,
                            color: Colors.blue,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.red),
                          hintText: 'Phone',
                          focusedBorder: OutlineInputBorder(
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
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.lock_outlined,
                            color: Colors.blue,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.red),
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
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
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.lock_outlined,
                            color: Colors.blue,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.red),
                          hintText: 'Confirm Password',
                          focusedBorder: OutlineInputBorder(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Align(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) =>  AlertDialog(
                                  content: Text(
                                      "Questi sono i tuoi dati:\n ${_controllerName.text} \n ${_controllerEmail.text} \n ${_controllerPhone.text}"
                                  ),
                                ),
                              ),
                              child: const Text('Create')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: ' Login Here',
                                  style: TextStyle(color: Colors.blue)
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
