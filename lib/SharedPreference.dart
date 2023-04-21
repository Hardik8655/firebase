import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sizer/sizer.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({Key? key}) : super(key: key);

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

// try page Shared Pref

class _SharedPreferenceState extends State<SharedPreference> {
  TextEditingController nameControler = TextEditingController();

  String nameValue = "No Value Saved";

  // String getEmail = "";
  // String getUid = "";
  // String getCreationtime = "";

  // final email = FirebaseAuth.instance.currentUser!.email;
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  // final Creationtime =
  //     FirebaseAuth.instance.currentUser!.metadata.creationTime.toString();

// code for SharedPrefrenceData local save

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: nameControler,
                decoration: InputDecoration(
                  label: const Text('Enter Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString("name", nameControler.text.toString());
                  nameControler.clear();
                  // prefs.setString("getEmail", email!);
                  // prefs.setString("getUid", uid);
                  // prefs.setString("Creationtime", Creationtime);
                  getValue();
                },
                child: const Text('Save')),
            const SizedBox(height: 10),
             Text(nameValue, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString('name');
    // var getEmail = prefs.getString('email');
    // var getUid = prefs.getString('uid');
    // var getCreationtime = prefs.getString('Creationtime');
    setState(() {
      nameValue = getName ?? " ";
    });
  }
}
