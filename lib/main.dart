import 'dart:ffi';

import 'package:bank/db/userRepository.dart';
import 'package:bank/pages/my_home_page.dart';
import 'package:bank/pages/user_page.dart';
import 'package:bank/provider/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(ChangeNotifierProvider<Controller>(
    create: (_) => Controller(),
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff024b03),
        ),
        // primarySwatch: Colors.blue,
        fontFamily: 'RobotoSlab',
        primaryColor: Color(0xff024b03),
      ),
      home: const MyHomePage(),
    );
  }
}


