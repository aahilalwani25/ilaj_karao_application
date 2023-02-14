import 'dart:async';

import 'package:flutter/material.dart';
import './global/styles/screens.dart';
import 'Screens/intro_screen.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (builder) => const IntroScreenClass())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: getWidth(context),
        height: getHeight(context),
        // decoration: const BoxDecoration(
        //   color: Colors.black,
        //   //backgroundBlendMode: BlendMode.darken,
        //     image: DecorationImage(
        //       fit: BoxFit.cover,
        //       image: AssetImage("assets/images/bg_img.jpg"),
        //         alignment: Alignment.center,
        //         ),

        //     ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Image.asset(
              "assets/images/app_logo.jpg",
              width: 100,
              height: 100,
            )),
            const Text(
              "ILAJ KARAO PK",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const CircularProgressIndicator(
              strokeWidth: 4,
              color: Color.fromARGB(255, 0, 151, 93),
            )
          ],
        ),
      ),
    );
  }
}
