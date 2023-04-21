import 'package:flutter/material.dart';

class page_4 extends StatefulWidget {
  @override
  State<page_4> createState() => _page_4State();
}

// setting page


class _page_4State extends State<page_4> {
  bool flag_1 = false;
  bool flag_2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 18, right: 20, left: 20, bottom: 13),
              child: const Text(
                "Section 1",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language, size: 28),
              title: const Text(
                "Language",
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text("English"),
            ),
            Divider(thickness: 1),
            ListTile(
                leading: const Icon(Icons.phone_android_outlined, size: 28),
                title: const Text(
                  "Use Sysem Theme",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Switch(
                    // activeColor: Colors.orange,
                    value: flag_1,
                    onChanged: (on) {
                      setState(() {
                        flag_1 = on;
                      });
                    })),
            Padding(
              padding: const EdgeInsets.only(
                  top: 18, left: 20, right: 20, bottom: 13),
              child: const Text(
                "Section 2",
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock, size: 28),
              title: const Text(
                "Security",
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text("Fingerprint"),
            ),
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(Icons.fingerprint, size: 28),
              title: const Text(
                "Use fingerprint",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Switch(
                  value: flag_2,
                  onChanged: (tap) {
                    setState(() {
                      flag_2 = tap;
                    });
                  }),
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
