import 'package:flutter/material.dart';
import 'package:social_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      title: 'Social App',
      initialRoute: '/',
      routes: generateRoutes(),
    );
  }
}
