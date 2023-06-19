import 'package:flutter/material.dart';

import 'home/features/maps/presentation/pages/maps_home_page.dart';

void main() {
  runApp(const MapsApp());
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  MapsHomePage(),
    );
  }
}
