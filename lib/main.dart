import 'package:flutter/material.dart';
import 'package:untitled2/screen/order_private_company.dart';
import 'package:untitled2/screen/profile_admin.dart';

import 'screen/details_private.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Intro(),
    );
  }
}
