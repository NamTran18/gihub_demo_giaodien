import 'package:bai3/src/resources/login_page.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}