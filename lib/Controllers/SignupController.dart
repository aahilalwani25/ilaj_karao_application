import 'package:firebase_database/firebase_database.dart';

import '../Models/NewUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignupController{

  NewUser user;
  Map<String,dynamic>? users;
  final db= FirebaseDatabase.instance.ref('users');

  SignupController({required this.user}){
    users= {
      'full_name': user.name,
      'email': user.email,
      'password': user.password,
      'phone': user.phone,
      'gender': user.gender,
      'dob': user.dob,
    };
  }

  Future<void> signUpUser() async{
    db.push().set(users!).then((value){
      print('Signed up successfully!');
    })
    .onError((error, stackTrace){
      print("Error: ${error}");
    });
  }
}