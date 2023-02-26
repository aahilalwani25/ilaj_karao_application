import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ilaj_karao_application/Models/LoggedInUser.dart';
import 'package:ilaj_karao_application/Models/NewUser.dart';
import 'package:ilaj_karao_application/Screens/LoginForm.dart';

import '../global/styles/screens.dart';
import 'Admin/admin_profile.dart';
import 'Appointment_Form.dart';

// ignore: camel_case_types
class Navigation_Drawer {
  BuildContext context;

  Navigation_Drawer({
    required this.context,
  });

  //List Nav_lists= List.generate(length, (index) => null)

  Color _selectedColor = Color.fromARGB(255, 218, 218, 218);
  bool _selected = false;
  
  
  //DrawerControllerState drawerControllerState= DrawerControllerState();

  Drawer get getAdminDrawer => (Drawer(
        child: Column(children: [
          DrawerHeader(
              child: SizedBox(
            width: getWidth(context),
            height: getHeight(context) * 0.4,
            child: Container(
                decoration: BoxDecoration(
                  color: Styles().getPurpleColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'admin@ilajkarao.com',
                            style: const TextStyle(color: Colors.white),
                          ),
                          InkWell(
                              onTap: () {
                                //admin profile navigate
                                Navigator.push(context,
                                MaterialPageRoute(builder: (builder)=>AdminProfile())
                                );
                              },
                              child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.create_rounded,
                                    color: Colors.grey,
                                  )))
                        ],
                      ),
                    ),
                  ],
                )),
          )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const AppointmentForm()));
            },
            child: const ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.create_rounded),
            ),
          ),
          InkWell(
            onTap: () => print('register'),
            child: ListTile(
              title: Text('View Receipts'),
              leading: Icon(Icons.receipt),
            ),
          ),
          InkWell(
            onTap: () => print('register'),
            child: ListTile(
              title: Text('Search Hospitals and Doctors'),
              leading: Icon(Icons.search),
            ),
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const LoginForm()));
            },
            child: ListTile(
              title: Text('Sign out'),
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
            ),
          ),
        ]),
      ));

  Drawer get getUserDrawer => (Drawer(
        child: Column(children: [
          DrawerHeader(
              child: SizedBox(
            width: getWidth(context),
            height: getHeight(context) * 0.4,
            child: Container(
                decoration: BoxDecoration(
                  color: Styles().getPurpleColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser!.email.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.create_rounded,
                                    color: Colors.grey,
                                  )))
                        ],
                      ),
                    ),
                  ],
                )),
          )),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>const AppointmentForm()));
            },
            child: const ListTile(
              title: Text('Register Appointment'),
              leading: Icon(Icons.create_rounded),
            ),
          ),
          InkWell(
            onTap: () => print('register'),
            child: ListTile(
              title: Text('View Receipts'),
              leading: Icon(Icons.receipt),
            ),
          ),
          InkWell(
            onTap: () => print('register'),
            child: ListTile(
              title: Text('Search Hospitals and Doctors'),
              leading: Icon(Icons.search),
            ),
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const LoginForm()));
            },
            child: ListTile(
              title: Text('Sign out'),
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
            ),
          ),
        ]),
      ));
}
