import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_ui/Firebase%20Code/UserLogin_page.dart';

class Singin extends StatefulWidget {
  const Singin({Key? key}) : super(key: key);

  // Firebase_Authenticatio
// FargotPassword
// userloginpage
// singinpage

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sing in demo page"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This fild is Required...!!";
                        } else if (!value.contains('@')) {
                          return 'Please Enter Valid Email';
                        } else {
                          return null;
                        }
                      },
                      controller: EmailController,
                      decoration: InputDecoration(
                        hintText: "ENTER YOUR E-MAIL",
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
                          return "This filed is required";
                        } else if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      },
                      controller: PasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "ENTER YOUR PASSWORD",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            registration(
                                email: EmailController.text,
                                password: PasswordController.text);
                            EmailController.clear();
                            PasswordController.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FirebasAuthentication()));
                          }
                        },
                        child: const Text('Singin..!'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            googleSingin();
                          },
                          child: const Text('Google Singin')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Email Password and Creat user first time

  Future registration({required String email, required String password}) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      const msg2 = SnackBar(content: Text("Ragiester Successfully"));
      ScaffoldMessenger.of(context).showSnackBar(msg2);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        const msg = SnackBar(content: Text("This Mail is alredy Existed"));
        ScaffoldMessenger.of(context).showSnackBar(msg);
      } else {
        print(e.toString());
      }
      ;
    }
  }

  // google Sing in method

  Future googleSingin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: Home(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   TextEditingController t1 = TextEditingController();
//   TextEditingController t2 = TextEditingController();
//   String verify = "";
//   String verificationId1 = "";
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OTP"),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: t1,
//             decoration: InputDecoration(hintText: "Enter Number"),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 await auth.verifyPhoneNumber(
//                   phoneNumber: '+91${t1.text}',
//                   verificationCompleted:
//                       (PhoneAuthCredential credential) async {
//                     await auth.signInWithCredential(credential);
//                   },
//                   verificationFailed: (FirebaseAuthException e) {
//                     if (e.code == 'invalid-phone-number') {
//                       print('The provided phone number is not valid.');
//                     }
//                   },
//                   codeSent: (String verificationId, int? resendToken) {
//                     verificationId1 = verificationId;
//                     setState(() {});
//                   },
//                   codeAutoRetrievalTimeout: (String verificationId) {},
//                 );
//               },
//               child: Text("Send")),
//           TextField(
//             controller: t2,
//             decoration: InputDecoration(hintText: "Enter Otp"),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 String smsCode = "${t2.text}";
//
//                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                     verificationId: verificationId1, smsCode: smsCode);
//
//                 await auth.signInWithCredential(credential);
//               },
//               child: Text("Submit")),
//         ],
//       ),
//     );
//   }
// }
