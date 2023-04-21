import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Model/Model_SharedPref.dart';

class SharePrefrenceData extends StatefulWidget {
  // final SharedPrefModel Data;

  const SharePrefrenceData({Key? key}) : super(key: key);

  @override
  State<SharePrefrenceData> createState() => _SharePrefrenceDataState();
}

class _SharePrefrenceDataState extends State<SharePrefrenceData> {
  SharedPrefModel? user;
  Map<String, dynamic> xyz = {
    'email': 'vaghela@gmail.com',
    'uid': 'jnhssnssx',
    'date': '08/02/2023',
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Map<String, dynamic> xyzMap = jsonDecode(source);
    user = SharedPrefModel.fromJson(xyz);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharePrefrence Data'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 15.w,
                child: const Text('UserId', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: 5.w,
                child: const Text(':', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                  width: 55.w,
                  child: Text(
                    '${user!.email}',
                    style: const TextStyle(fontSize: 15),
                  )),
            ],
          ),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 15.w,
                child: const Text('Email', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: 5.w,
                child: const Text(':', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                  width: 55.w,
                  child: Text(
                    '${user!.uid}',
                    style: const TextStyle(fontSize: 15),
                  )),
            ],
          ),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 15.w,
                child: const Text('Date', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: 5.w,
                child: const Text(':', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                  width: 55.w,
                  child: Text(
                    '${user!.date}',
                    style: const TextStyle(fontSize: 15),
                  )),
            ],
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
