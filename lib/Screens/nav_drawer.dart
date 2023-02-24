import 'package:flutter/material.dart';

import '../global/styles/screens.dart';

// ignore: camel_case_types
class Navigation_Drawer {
  BuildContext context;
  String user_type;

  Navigation_Drawer({
    required this.context,
    required this.user_type,
  });

  //List Nav_lists= List.generate(length, (index) => null)

  Color _selectedColor = Color.fromARGB(255, 218, 218, 218);
  bool _selected = false;
  //DrawerControllerState drawerControllerState= DrawerControllerState();

  Drawer get getDrawer => (Drawer(
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
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(color: Colors.white),
                          ),
                          InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: const Icon(
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
            onTap: () {},
            child: ListTile(
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
            onTap: () => print('register'),
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
