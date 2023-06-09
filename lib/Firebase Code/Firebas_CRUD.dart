import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_ui/Firebase%20Code/FirebaseEdit.dart';

import 'UserLogin_page.dart';

class FirebaseExmple extends StatefulWidget {
  const FirebaseExmple({Key? key}) : super(key: key);

  @override
  State<FirebaseExmple> createState() => _FirebaseExmpleState();
}

class _FirebaseExmpleState extends State<FirebaseExmple> {
  TextEditingController username = TextEditingController();
  TextEditingController userage = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebasAuthentication firebasAuth = const FirebasAuthentication();

// code for CRED opration to firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Firebase Example"),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This filed is Required";
                  } else {
                    return null;
                  }
                },
                controller: username,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This filed is Required";
                  } else {
                    return null;
                  }
                },
                controller: userage,
                decoration: InputDecoration(
                  hintText: "Enter Your Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        UserData(name: username.text, age: userage.text);
                        userage.clear();
                        username.clear();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 45,
                      width: 150,
                      child: const Center(
                          child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      UserLogout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirebasAuthentication()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 45,
                      width: 150,
                      child: const Center(
                          child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const Text("Data loding");
                        //return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            style:
                                                const TextStyle(fontSize: 18),
                                            '${snapshot.data!.docs[index].data()['name']}'),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditPage(
                                                              name: snapshot
                                                                      .data!
                                                                      .docs[index]
                                                                      .data()[
                                                                  'name'],
                                                              age: snapshot
                                                                      .data!
                                                                      .docs[index]
                                                                      .data()[
                                                                  "age"],
                                                              id: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id)));
                                            },
                                            icon: const Icon(Icons.edit,
                                                size: 18)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            style:
                                                const TextStyle(fontSize: 15),
                                            '${(snapshot.data!.docs[index].data()["age"])}'),
                                        IconButton(
                                          onPressed: () {
                                            UserDataDelet(
                                                id: snapshot
                                                    .data!.docs[index].id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ));
  }

  Future UserLogout() async {
    await FirebaseAuth.instance.signOut();
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    const msg3 = SnackBar(content: Text('Logout Successfully'));
    ScaffoldMessenger.of(context).showSnackBar(msg3);

    // Write code here fore navigate to login page
  }

  Future UserData({required String name, required String age}) async {
    await FirebaseFirestore.instance.collection('users').add({
      "name": name,
      "age": age,
    });
  }

  Future UserDataDelet({required String id}) async {
    await FirebaseFirestore.instance.collection('users').doc(id).delete();
  }

// Future UserEditData(
//     {required String name, required String age, required String id}) async {
//   await FirebaseFirestore.instance.collection('users').doc(id).update({
//     "name": name,
//     "age": age,
//   });
// }
}
