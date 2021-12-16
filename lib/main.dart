import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Load(),
      '/location': (context) => const Chooselocation(),
      '/home': (context) => const Home()
    },
  ));
}
