import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:ilaj_karao_application/global/styles/screens.dart';
import '../Models/LoggedInUser.dart';
import '../global/components/dropdown_list.dart';
import 'nav_drawer.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  EdgeInsets paddingSpaceTextbox = const EdgeInsets.symmetric(horizontal: 20, vertical: 7);
  DatabaseReference hospitals= FirebaseDatabase.instance.ref('hospitals');
  bool showHospitalList=false;

  //appointment attributes
  String? hospitalNameSelected, email;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Appointment Form'),
          backgroundColor: Styles().getPurpleColor,
        ),
        drawer:
            Navigation_Drawer(context: context, user_type: 'user').getDrawer,
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: paddingSpaceTextbox,
                  child: TextFormField(
                    enabled: false,
                    initialValue: LoggedInUser().getEmail(),
                    decoration: Styles.getTextboxInput(
                        hint: "",
                        prefixIcon: const Icon(Icons.email)),
                  ),
                ),


                Padding(
                  padding: paddingSpaceTextbox,
                  child: TextFormField(
                    enabled: false,
                    initialValue: 'Phone here',
                    decoration: Styles.getTextboxInput(
                        hint: "Enter Email",
                        prefixIcon: const Icon(Icons.phone)),
                  ),
                ),

                Padding(
                  padding: paddingSpaceTextbox,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ListTile(
                      title: Text(''),
                      trailing: InkWell(
                        onTap: () => setState(() {
                          showHospitalList=!showHospitalList;
                        }),
                        child: showHospitalList==false?Icon(Icons.arrow_drop_down_circle):Icon(Icons.arrow_drop_up)),
                    ),
                  )
                ),
                

                SizedBox(
                  //width: getWidth(context),
                  height: 100,
                  child: DropdownList(
                    onTap: (){

                    }, databaseReference: hospitals, toggle: showHospitalList)
                  .getDropdownLists(),
                ),
              ],
            )
          )
        )
      ;
  }
}
