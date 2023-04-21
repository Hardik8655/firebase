import 'package:flutter/material.dart';
import 'package:simple_ui/Firebase%20Code/UserLogin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_ui/Firebase%20Code/Singin_page.dart';

class FargotPassword extends StatefulWidget {
  const FargotPassword({Key? key}) : super(key: key);

  // Firebase_Authenticatio
 // FargotPassword
 // userloginpage
 // singinpage

  @override
  State<FargotPassword> createState() => _FargotPasswordState();
}

class _FargotPasswordState extends State<FargotPassword> {
  TextEditingController mailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fargot password'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Reset Link will be sent to you email id !',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: mailControler,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
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
                    onPressed: () {
                      resetpassword();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirebasAuthentication()));
                    },
                    child: Text('Sand Mail')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirebasAuthentication()));
                    },
                    child: Text('Login..', style: TextStyle(fontSize: 20))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Dont have ave an Account?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Singin()));
                    },
                    child: Text('Singup')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  resetpassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: mailControler.text);
      const msg =
          SnackBar(content: Text('Password Reset Email has been sent !'));
      ScaffoldMessenger.of(context).showSnackBar(msg);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const msg2 = SnackBar(content: Text('No user found for that email.'));
        ScaffoldMessenger.of(context).showSnackBar(msg2);
      }
    }
  }
}
