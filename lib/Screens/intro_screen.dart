import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ilaj_karao_application/Screens/SignupForm.dart';

import '../global/styles/screens.dart';

class IntroScreenClass extends StatefulWidget {
  const IntroScreenClass({super.key});

  @override
  State<IntroScreenClass> createState() => _IntroScreenClassState();
}

class _IntroScreenClassState extends State<IntroScreenClass> {
  Widget Slide1(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: getWidth(context) * 0.9,
          child: const Text(
            'Findout Trusted Doctors',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: getWidth(context) * 0.7,
          child: const Text(
            'Find a specialist that you only need on a consulting application',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          width: getWidth(context) * 0.4,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles().getPurpleColor,
                
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const SignupForm()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white,
                        decorationColor: Styles().getPurpleColor),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles().getPurpleColor,
      body: Container(
        height: getHeight(context) * 0.5,
        width: getWidth(context),
        margin: EdgeInsets.only(top: getHeight(context) * 0.5),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Slide1(context),
      ),
    );
  }
}
