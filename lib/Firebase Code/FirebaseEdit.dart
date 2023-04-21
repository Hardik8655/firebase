import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// edit data in CRUD opration in flutter

class EditPage extends StatefulWidget {
  const EditPage(
      {Key? key, required this.name, required this.age, required this.id})
      : super(key: key);
  final String name;
  final String age;
  final String id;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.name;
    ageController.text = widget.age;
  }

  // initState for data passing to the text fild

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit page"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This filed is Required";
                } else {
                  return null;
                }
              },
              controller: nameController,
              // initialValue: '${widget.name ?? ''}',
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "This filed is Required";
                } else {
                  return null;
                }
              },
              controller: ageController,
              // initialValue: '${widget.age}',
              decoration: InputDecoration(
                hintText: "Enter Your Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    UserEditData(
                        name: nameController.text,
                        age: ageController.text,
                        id: widget.id);
                    Navigator.pop(context);
                  }
                },
                child: Text("Edit...")),
          ],
        ),
      ),
    );
  }

  Future UserEditData(
      {required String name, required String age, required String id}) async {
    await FirebaseFirestore.instance.collection('users').doc(id).update({
      "name": name,
      "age": age,
    });
  }
}
