import 'package:flutter/material.dart';
import 'Home.dart';
import 'Contact.dart';
import 'Mod.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Trackit",
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/contact': (context) => Contact(),
        '/mod': (context) => Mod(),
      },
    ),
  );
}
