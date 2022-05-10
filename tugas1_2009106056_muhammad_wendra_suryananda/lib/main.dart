import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tugas1_2009106056_muhammad_wendra_suryananda/form.dart';
import 'package:tugas1_2009106056_muhammad_wendra_suryananda/home.dart';
import 'package:tugas1_2009106056_muhammad_wendra_suryananda/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FormPage(),
      },
      home: Home(),
    );
  }
}
