import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ilaj_karao_application/Models/NewUser.dart';

class LoggedInUser {
  FirebaseDatabase db = FirebaseDatabase.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userId;

  NewUser? user;

  LoggedInUser() {
    getAllCredentials();
  }

  Map<String, dynamic>? loggedInUserData;

  String? isLoggedIn() {
    User? u = auth.currentUser;

    if (u?.uid != null) {
      return u?.uid;
    }
    return null;
  }

  String? getEmail() {
    return auth.currentUser!.email;
  }

  void getAllCredentials() {
    userId = auth.currentUser?.uid != null ? auth.currentUser!.uid : null;

    if (userId != null) {
      db.ref('users').child(userId!).get().then((dataSnapshots) {
        loggedInUserData = {
          'full_name': dataSnapshots.child('full_name').value.toString(),
          'dob': dataSnapshots.child('dob').value.toString(),
          'email': dataSnapshots.child('email').value.toString(),
          'phone': dataSnapshots.child('phone').value.toString(),
          'gender': dataSnapshots.child('gender').value.toString(),
        };
      });
    }
  }
}
