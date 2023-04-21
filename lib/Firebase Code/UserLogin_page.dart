import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ui/Firebase%20Code/FargotPassword.dart';
import 'package:simple_ui/Firebase%20Code/Singin_page.dart';
import 'package:simple_ui/SPdetailfire.dart';
import 'package:simple_ui/coffee_app_ui/coffee.dart';

import '../SharePrefrenceData.dart';
import '../SharedPreference.dart';

// Email and Password Sing in code

// Firebase_Authenticatio
// FargotPassword
// userloginpage
// singinpage
//

String emailvalue = "";
String uidvalue = " ";
String CreationValue = " ";

class FirebasAuthentication extends StatefulWidget {
  const FirebasAuthentication({Key? key}) : super(key: key);

  @override
  State<FirebasAuthentication> createState() => _FirebasAuthenticationState();
}

class _FirebasAuthenticationState extends State<FirebasAuthentication> {
  TextEditingController Emailcontrolar = TextEditingController();
  TextEditingController Passwordcontrolar = TextEditingController();

  late String email;
  late String uid;
  late String Creationtime;

  // FirebasAuthentication firebasAuth = const FirebasAuthentication();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIn Demo"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "E-mail is Required";
                    } else if (!value.contains('@')) {
                      return 'Plases Enter Valid Email';
                    } else {
                      return null;
                    }
                  },
                  controller: Emailcontrolar,
                  decoration: InputDecoration(
                    hintText: "Enter E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return "This Fild is Required...!!!";
                    } else {
                      return null;
                    }
                  },
                  controller: Passwordcontrolar,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        UserLogin(
                            email: Emailcontrolar.text,
                            password: Passwordcontrolar.text);
                        Emailcontrolar.clear();
                        Passwordcontrolar.clear();
                        // var sharedPref = await SharedPreferences.getInstance();
                        // sharedPref.setBool(SplashScreenState.KEYOGIIN, true);
                        // const msg4 =
                        //     SnackBar(content: Text("Login successfully"));
                        // ScaffoldMessenger.of(context).showSnackBar(msg4);

                      }
                    },
                    child: const Text('Login..!'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // UserLogout();
                      },
                      child: const Text('Logout')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Don't Have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Singin()));
                    },
                    child: const Text("Sing in"),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (Context) => const FargotPassword()));
                  },
                  child: Text('Forget Password?')),
            ],
          ),
        ),
      ),
    );
  }

  // UserLoging after creating

  Future UserLogin({required String email, required String password}) async {
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', user.user!.uid);
      await prefs.setString('email', user.user!.email ?? "");
      await prefs.setString(
          'Creationtime', user.user!.metadata.creationTime.toString());
      // print(user.user!.uid);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => coffee_1()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'User-not-found') {
        const msg = SnackBar(content: Text("No user found for that Email"));
        ScaffoldMessenger.of(context).showSnackBar(msg);
      } else if (e.code == 'wrong-password') {
        const msg3 = SnackBar(content: Text('Worng password provided by User'));
        ScaffoldMessenger.of(context).showSnackBar(msg3);
        const msg2 = SnackBar(content: Text('Worng Password Provided by User'));
        ScaffoldMessenger.of(context).showSnackBar(msg2);
      } else {
        print(e.toString());
      }
    }
  }

// SharedPrefrence data

// void getValue() async {
//   var prefs = await SharedPreferences.getInstance();
//   var getMail = prefs.getString("email");
//   var getUid = prefs.getString("uid");
//   var getDate = prefs.getString("Date");
//   setState(() {
//     emailvalue = getMail ?? " ";
//     uidvalue = getUid ?? " ";
//     CreationValue = getDate ?? " ";
//   });
// }
}
