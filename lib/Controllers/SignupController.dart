import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Models/NewUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController {
  NewUser user;
  String? uid;
  Map<String, dynamic>? users;
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  DatabaseReference? _databaseReference;
  BuildContext context; 

  final auth= FirebaseAuth.instance;

  SignupController({required this.user, required this.context}) {
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


  Future<void> verify_email() async{

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: users!['email'],
              password: users!['password']
          )
          .then((userCredential){
            uid= userCredential.user?.uid;
            signUpUser();
          })
          //.then(()=>alertMessage("Si", icon))
          .catchError((error){
            alertMessage('The account already exists for that email.',
            const Icon(Icons.error, color: Colors.red));
          });
          
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        alertMessage('The account already exists for that email.', const Icon(Icons.error, color: Colors.red));
      }
    } catch (e) {
      print(e);
    }
    
  }

  Future<void> signUpUser() async {

    //print('sign up');
    try {
      //var firebaseId= await FirebaseAuth.instance.currentUser;
      await _databaseReference!
      .child(uid!)
      .set(users).then((v) {
        print('signed up');
        alertMessage('Signed up Successfully', const Icon(Icons.check_circle, color: Colors.green));
        //print('Signed up successfully!');
      }).onError((error, stackTrace) {
        alertMessage('Not sugned up',
            const Icon(Icons.check_circle, color: Colors.green));
      });
    } catch (e) {
      print('error: ${e}');
    }
  }

  alertMessage(String? title, Icon? icon){
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            icon: icon,
            content: Text("${title}"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"))
            ],
          );
        });
  }
}
