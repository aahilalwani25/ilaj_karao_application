import 'package:flutter/material.dart';
import 'package:ilaj_karao_application/Screens/LoginForm.dart';
import '../global/styles/screens.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  //form key works just like findViewById in Java
  final _formkey = GlobalKey<FormState>();
  String? _email, _password, _dob, _full_name, _phone, _gender;

  EdgeInsets paddingSpaceTextbox =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);

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
              },
              child: TextFormField(
                  enabled: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter DOB";
                    }
                    return null;
                  },
                  onSaved: (value) => _dob = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: Styles.getTextboxInput(
                      hint: "Enter Date of Birth",
                      prefixIcon: const Icon(Icons.calendar_month))),
            ),
          ),

          //date of birth
          Padding(
            padding: paddingSpaceTextbox,
            child: InkWell(
              onTap: () async {
                //print("calendar");

                
              },
              child: TextFormField(
                  enabled: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Gender";
                    }
                    return null;
                  },
                  onSaved: (value) => _gender = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: Styles.getTextboxInput(
                      hint: "Enter Gender",
                      prefixIcon: const Icon(Icons.male))),
            ),
          ),

          //password
          //phone
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
                    hint: "Enter Confirm Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye))),
          ),

          Padding(
            padding: paddingSpaceTextbox,
            child: SizedBox(
              width: getWidth(context)*0.6,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Styles().getPurpleColor,
              ), onPressed: () {

                //save the form state
                _formkey.currentState!.save();
                print(_dob!+" "+_full_name!);
              }, child: Text('Sign up'))),
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
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const LoginForm()));
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
          width: getWidth(context)*0.9,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: getHeight(context) * 0.23, left: getWidth(context)*0.09, right: getWidth(context) * 0.09),
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
