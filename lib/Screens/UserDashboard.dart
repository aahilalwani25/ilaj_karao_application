import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ilaj_karao_application/Screens/nav_drawer.dart';
import 'package:ilaj_karao_application/global/styles/screens.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles().getPurpleColor,
      ),
      drawer: Navigation_Drawer(context: context).getUserDrawer
    );
  }
}