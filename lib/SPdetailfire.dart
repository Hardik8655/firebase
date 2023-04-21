import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ui/Firebase%20Code/UserLogin_page.dart';
import 'Firebase Code/UserLogin_page.dart';
import 'Firebase Code/UserLogin_page.dart';
import 'package:sizer/sizer.dart';

// with the help of SharedPrefrence data showing form firebase

class Xyz extends StatefulWidget {
  const Xyz({Key? key}) : super(key: key);

  @override
  State<Xyz> createState() => _XyzState();
}

class _XyzState extends State<Xyz> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailvalue;
    uidvalue;
    CreationValue;
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Show with SharedPref"),
      ),
      body: Column(
        children: [
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
                    emailvalue,
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
                child: const Text('UID', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: 5.w,
                child: const Text(':', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                  width: 55.w,
                  child: Text(
                    uidvalue,
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
                child: const Text('Dtate', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                width: 5.w,
                child: const Text(':', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(
                  width: 55.w,
                  child: Text(
                    CreationValue,
                    style: const TextStyle(fontSize: 15),
                  )),
            ],
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getMail = prefs.getString('email');
    var getUid = prefs.getString('uid');
    var getDate = prefs.getString('Creationtime');
    print(getMail);
    print(getUid);
    print(getDate);
    setState(() {
      emailvalue = getMail ?? " ";
      uidvalue = getUid ?? " ";
      CreationValue = getDate ?? " ";
    });
  }
}
