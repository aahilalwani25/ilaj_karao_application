import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Models/NewUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController {
  NewUser user;
  Map<String, dynamic>? users;
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  DatabaseReference? _databaseReference;

  SignupController({required this.user}) {
    //print(user.name);
    _databaseReference = _db.ref('users');
    users = {
      'email': user.email,
      'full_name': user.name,
      'password': user.password,
      'phone': user.phone,
      'gender': user.gender,
      'dob': user.dob,
    };
  }

  void _resultMessage(BuildContext context){

  }


  _verify_email(){

    //verify via
  }

  signUpUser(BuildContext context) async {
    try {
      //var firebaseId= await FirebaseAuth.instance.currentUser;
      await _databaseReference!
      .push()  //gives unique id
      .set(users).then((v) {
        print('signed up');
        showDialog(
            context: context,
            builder: (builder) {
              return AlertDialog(
                content: const Text("Signed up Successfully"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              );
            });
        //print('Signed up successfully!');
      }).onError((error, stackTrace) {
        print("Error: ${error}");
      });
    } catch (e) {
      print('error: ${e}');
    }
  }
}
