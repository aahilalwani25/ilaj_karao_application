import 'package:flutter/material.dart';
import 'package:ilaj_karao_application/Controllers/SignupController.dart';
import 'package:ilaj_karao_application/Models/NewUser.dart';
import 'package:ilaj_karao_application/Screens/LoginForm.dart';
import 'package:intl/intl.dart';
import '../global/styles/screens.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  //form key works just like findViewById in Java
  final _formkey = GlobalKey<FormState>();
  String? _email,
      _password,
      _c_password,
      _dob = 'Enter Date Of Birth',
      _full_name,
      _phone = "+92",
      _gender = "Enter Gender";

  EdgeInsets paddingSpaceTextbox =
      EdgeInsets.symmetric(horizontal: 20, vertical: 7);

  Form getForm(BuildContext context) => (Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //full name
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Full Name";
                  }
                  return null;
                },
                onSaved: (value) => _full_name = value,
                keyboardType: TextInputType.name,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Full Name",
                    prefixIcon: const Icon(Icons.person))),
          ),
          //email
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                validator: (value) {
                  RegExp regexp = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (value!.isEmpty) {
                    return "Enter Email Address";
                  } else if (!regexp.hasMatch(value)) {
                    return "Pleae enter valid email address";
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.emailAddress,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Email", prefixIcon: const Icon(Icons.email))),
          ),

          //phone
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                validator: (value) {
                  //Pattern pattern=r'(3[0-9]{2})\6|0(3[0-9]{2})( |\-)?)[0-9])';
                  //RegExp regExp=RegExp(pattern.toString());
                  if (value!.isEmpty) {
                    return "Enter phone";
                  }
                  // else if(!regExp.hasMatch(value)){
                  //   return "Enter valid Phone Number";
                  // }
                  return null;
                },
                onSaved: (value) => _phone = value,
                keyboardType: TextInputType.phone,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Phone", prefixIcon: const Icon(Icons.phone))),
          ),

          //date of birth
          Padding(
            padding: paddingSpaceTextbox,
            child: InkWell(
                onTap: () async {
                  //print("calendar");

                  final dob = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2024),
                  );

                  setState(() {
                    _dob = DateFormat('yMMMMd').format(dob!).toString();
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Styles().getTextBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.calendar_month),
                      Text('$_dob'),
                    ],
                  ),
                )),
          ),

          //gender
          Padding(
            padding: paddingSpaceTextbox,
            child: InkWell(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          title: const Text('SELECT GENDER'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _gender = "Male";
                                  });

                                  Navigator.of(context).pop();
                                },
                                child: const Text('Male')),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _gender = "Female";
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Female')),
                          ],
                        );
                      });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Color.fromARGB(255, 230, 229, 229),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.male),
                      Text('$_gender'),
                    ],
                  ),
                )),
          ),

          //password
          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                obscureText: true,
                onChanged: (value) => _password=value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter password";
                  } else if (value.length < 8) {
                    return "Password must have at least 8 characters";
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
                keyboardType: TextInputType.text,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Password",
                    prefixIcon: const Icon(Icons.lock))),
          ),

          Padding(
            padding: paddingSpaceTextbox,
            child: TextFormField(
                //onSaved: (value)=>_password=value,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Confirm password";
                  }
                  if(_password!=value){
                    return "Password does not match";
                  }
                  return null;
                },
                //onSaved: (value) => _password = value,
                keyboardType: TextInputType.text,
                decoration: Styles.getTextboxInput(
                    hint: "Enter Confirm Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye))),
          ),

          Padding(
            padding: paddingSpaceTextbox,
            child: SizedBox(
                width: getWidth(context) * 0.6,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Styles().getPurpleColor,
                    ),
                    onPressed: () {
                      
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();

                        NewUser user= NewUser(name: _full_name,
                        password: _password,
                        gender: _gender,
                        phone: _phone,
                        email: _email,
                        dob: _dob,
                        );

                        SignupController sc= SignupController(user: user);
                        sc.signUpUser(context);
                      }
                    },
                    child: const Text('Sign up'))),
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
            const InkWell(
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => const LoginForm()));
              },
              child: Text('Login'),
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
              top: getHeight(context) * 0.1,
              left: getWidth(context) * 0.07,
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
              "Signup to continue",
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
