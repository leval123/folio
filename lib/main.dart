import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(Folio());
}

class Folio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FiraCode',
      ),
      home: HomeScreen(),
    );
  }
}
