import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal(); // name constructor
  static const MyApp _instance =
      MyApp._internal(); // Singleton or single instance
  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Payment App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Text('Home Page'),
        ));
  }
}
