import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilaj_karao_application/Screens/UserDashboard.dart';

import '../global/components/AlertMessages.dart';

class LoginController {
  String email, password;
  FirebaseAuth auth = FirebaseAuth.instance;
  BuildContext? context;

  LoginController(
      {required this.context, required this.email, required this.password});

  Future<void> login() async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushReplacement(context!,
                MaterialPageRoute(builder: (builder) => const UserDashboard()))
            .catchError((value) {
          alertMessage(context, 'Either username or password is incorrect',
              Icon(Icons.error));
        });
      });
    } on FirebaseAuthException catch (e) {
      alertMessage(context, 'Error', Icon(Icons.error));
    }
  }
}
