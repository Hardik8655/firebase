import 'package:flutter/material.dart';

class page_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return page_3_State();
  }
}

class page_3_State extends State<page_3> {
  List flag = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  var box_color = [
    Colors.lightGreen,
    Colors.yellowAccent,
    Colors.blue,
    Colors.grey,
    Colors.cyanAccent,
    Colors.pinkAccent,
    Colors.orange,
    Colors.blueGrey,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: box_color.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: box_color[index],
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.all(5),
              ),
              Positioned(
                  right: 12,
                  top: 10,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          flag[index] = !flag[index];
                        });
                      },
                      child: Icon(
                          flag[index]
                              ? Icons.accessible_forward
                              : Icons.accessible,
                          color: flag[index] ? Colors.white : Colors.black)))
            ],
          );
        },
      ),
    );
  }
}
