import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../global/styles/screens.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  //form key works just like findViewById in Java
  final _formkey = GlobalKey<FormState>();
  String? _email, _password;

  EdgeInsets paddingSpaceTextbox = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  Form getForm(BuildContext context) => (Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //email
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Email Address";
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.emailAddress,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Phone", icon: Icon(Icons.email))),
          ),

          //phone
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
              
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter phone";
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.phone,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Phone", icon: Icon(Icons.phone))),
          )
        ],
      )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getWidth(context) * 0.4,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            InkWell(
              child: Text(
                'Sign up',
                style: TextStyle(color: Color.fromARGB(255, 173, 173, 173)),
              ),
            ),
            InkWell(
              child: Text('Login'),
            )
          ],
        ),
      ),
      backgroundColor: Styles().getPurpleColor,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
        width: getWidth(context),
        height: getHeight(context),
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top: getHeight(context) * 0.6),
        child: Column(children: [
          Text("Welcome Back!"),
          Text("Signin to continue"),
          getForm(context)
        ]),
      ),
    );
  }
}
