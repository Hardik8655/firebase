import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List Names = [
      'Groot',
      'BetMan',
      'Akash',
      'Milan',
      'Raj',
      'Harry',
    ];

    List Images = [
      "assets/images/groot.jpg",
      "assets/images/tower.jpg",
      "assets/images/betman.jpg",
      "assets/images/groot.jpg",
      "assets/images/tower.jpg",
      "assets/images/betman.jpg",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(height: 150),
                      SizedBox(
                        height: 60,
                        // width: 180,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Firend",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Dragon Lee",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        // width: 180,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: InkWell(
                                      onTap: () {},
                                      child: const Icon(Icons.search, size: 30))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 18),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                          height: 43,
                          width: 148,
                          child: const Center(
                              child: Text(
                            "208 Fans",
                            style: TextStyle(
                                // color: Colors.black54,
                                fontWeight: FontWeight.w800),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                          height: 43,
                          width: 148,
                          child: const Center(
                              child: Text(
                            "102 Follow",
                            style: TextStyle(color: Colors.white),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 25,
                                color: Colors.blue.shade200,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Names.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(Images[index]),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Names[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25),
                                    ),
                                    Text(
                                      "I am ${Names[index]}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Icon(
                                  Icons.add,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
