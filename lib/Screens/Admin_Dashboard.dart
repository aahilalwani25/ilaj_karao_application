import 'package:flutter/material.dart';
import '../global/styles/screens.dart';
import 'nav_drawer.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles().getPurpleColor,
        title: const Text('Dashboard'),
      ),
      drawer: Navigation_Drawer(context: context).getAdminDrawer,
      body: Container(
        width: getWidth(context),
        height: getHeight(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dashboard'.toUpperCase(), style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
              ],
            ),
      
            Box(Icon(Icons.person, size: 30,), Colors.white, 'Active Users', '8', Colors.blue),
            Box(Icon(Icons.receipt_long, size: 30), Colors.white, 'Feedbacks', '10', Color.fromARGB(255, 14, 224, 42)),
            Box(Icon(Icons.local_hospital, size: 30), Colors.white, 'Registered Private Hospitals','150', Color.fromARGB(255, 218, 158, 70)),
            
            Box(Icon(Icons.local_hospital, size: 30), Colors.white, 'Registered Clinics','150', Color.fromARGB(255, 149, 218, 70)),
            Box(Icon(Icons.person_4, size: 30), Colors.white, 'Registered Doctors','200', Color.fromARGB(255, 218, 70, 139)),


      
          ],
        ),
      ),
    );
  }

  Widget Box(Icon icon, Color textColor, String title, String subtitle, Color backgroundColor){
    return Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: getWidth(context)*0.9,
              height: getHeight(context)*0.12,
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${title}', style: TextStyle(color: textColor, fontSize: 20),),
                        icon
                      ],
                    ),
                    Text('${subtitle}', style: TextStyle(color: textColor, fontSize: 40),),
                  ]),
                ),
              ),
            ),
          
          );
  }

  
}