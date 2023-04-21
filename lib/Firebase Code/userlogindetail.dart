import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// code for show user detiles after login

// Firebase_Authenticatio
// FargotPassword
// userloginpage
// singinpage

class UserProfileDetail extends StatefulWidget {
  const UserProfileDetail({Key? key}) : super(key: key);

  @override
  State<UserProfileDetail> createState() => _UserProfileDetailState();
}

class _UserProfileDetailState extends State<UserProfileDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email;
    final creationTime =
        FirebaseAuth.instance.currentUser!.metadata.creationTime;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('User Detiles', style: TextStyle(fontSize: 25)),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 15.w,
                    child: Text('UserId', style: const TextStyle(fontSize: 15)),
                  ),
                  Container(
                    width: 5.w,
                    child: Text(':', style: const TextStyle(fontSize: 15)),
                  ),
                  // Container(
                  //     width: 55.w,
                  //     child: Text(
                  //       '$uid',
                  //       style: const TextStyle(fontSize: 15),
                  //     )),
                ],
              ),
              Divider(thickness: 1),
              Row(
                children: [
                  Container(
                    width: 15.w,
                    child: Text('Email', style: const TextStyle(fontSize: 15)),
                  ),
                  Container(
                    width: 5.w,
                    child: Text(':', style: const TextStyle(fontSize: 15)),
                  ),
                  // Container(
                  //   width: 55.w,
                  //   child: Text('$email', style: const TextStyle(fontSize: 15)),
                  // ),
                ],
              ),
              Divider(thickness: 1),
              Row(
                children: [
                  Container(
                    width: 15.w,
                    child:
                        Text('Created', style: const TextStyle(fontSize: 15)),
                  ),
                  Container(
                    width: 5.w,
                    child: Text(':', style: const TextStyle(fontSize: 15)),
                  ),
                  // Container(
                  //   width: 55.w,
                  //   child: Text('$creationTime',
                  //       style: const TextStyle(fontSize: 15)),
                  // ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

// Text('User Id: $uid', style: TextStyle(fontSize: 18)),
// Text('Email: $email', style: TextStyle(fontSize: 18)),
// Text(
// 'Created: $creationTime',
// style: TextStyle(fontSize: 18),
// ),
