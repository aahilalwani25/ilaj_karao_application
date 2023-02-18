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

  Drawer get getDrawer => (Drawer(
        child: ListView(children: [

          //header
          DrawerHeader(
            child: SizedBox(
              height: getHeight(context) * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundImage: AssetImage('/assets/app_logo.jpg'),
                    radius: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('email here', style: TextStyle(fontSize: 10,),),
                      CircleAvatar(
                        child: Icon(Icons.edit),
                      )
                    ],
                  )
                ],
              ),
          )
          ),

          //list tile
          
        ]),
      ));
}
