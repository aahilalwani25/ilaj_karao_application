import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../global/styles/screens.dart';
import 'SignupForm.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //form key works just like findViewById in Java
  final _formkey = GlobalKey<FormState>();
  String? _email, _password;

  EdgeInsets paddingSpaceTextbox =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);

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
                    hint: "Enter Email", prefixIcon: const Icon(Icons.email))),
          ),

          
          

          //password
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter password";
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.text,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Password",
                    prefixIcon: const Icon(Icons.lock))),
          ),
          Padding(
            padding: paddingSpaceTextbox,
            child: SizedBox(
                width: getWidth(context) * 0.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles().getPurpleColor,
                    ),
                    onPressed: () {},
                    child: Text('Login'))),
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
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const SignupForm()));
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            const InkWell(
              child: Text('Login',
              style: TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                ),),
            )
          ],
        ),
      ),
      backgroundColor: Styles().getPurpleColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          width: getWidth(context) * 0.9,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              top: getHeight(context) * 0.5,
              left: getWidth(context) * 0.09,
              right: getWidth(context) * 0.09),
          child: Column(children: [
            Text(
              "Welcome!",
              style: TextStyle(
                  color: Styles().getPurpleColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Signin to continue",
              style: TextStyle(
                  color: Styles().getPurpleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            getForm(context)
          ]),
        ),
      ),
    );
  }
}