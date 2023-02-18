import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './global/styles/screens.dart';
import 'Screens/intro_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ilaj karao Application',
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
        color: Styles().getPurpleColor,
        width: getWidth(context),
        height: getHeight(context),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            //AnimatedContainer(duration: 5,),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/app_logo.jpg"),
                ),
            Text(
              "ILAJ KARAO PK",
              style: TextStyle(
                  color: Colors.white,
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
