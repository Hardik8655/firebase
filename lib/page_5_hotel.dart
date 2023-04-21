import 'package:flutter/material.dart';

class page_5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return page_5State();
  }
}

class page_5State extends State<page_5> {
  Color primary = Colors.tealAccent.shade700;

  // bool flag_1 = false;
  // bool flag_2 = false;

  List flag = [
    false,
    false,
    false,
  ];

  List hotel = [
    "assets/images/Hotel.jpg",
    "assets/images/Hotel_2.jpg",
    "assets/images/Hotel_3.jpg",
  ];

  List hotel_name = [
    "Grand Royal Hotel",
    "Queen Hotel",
    "Hotel Taj",
  ];

  List hotel_price = [
    "\$180",
    "\$220",
    "\$150",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Explore",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.location_on_rounded, color: Colors.black, size: 27),
          SizedBox(width: 8),
        ],
        backgroundColor: Colors.white70,
      ),
      backgroundColor: Colors.white,
      body:Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SizedBox(
                    width: 260,
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search..",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  // padding: EdgeInsets.only(top: 9, bottom: 9),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent.shade700,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.search,
                      size: 28, color: Colors.grey.shade300),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // height: 50,
                  // width: 200,
                  //  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 15, left: 10),
                  // color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose date",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      const SizedBox(height: 10), // inbetween
                      const Text(
                        "12 Dec - 22 Dec",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 45,
                    child: const VerticalDivider(
                        thickness: 1, color: Colors.grey)),
                Container(
                  // margin: const EdgeInsets.only(right: 20),
                  padding:
                      const EdgeInsets.only(top: 3, bottom: 18, right: 45),
                  // color: Colors.grey.shade200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nnumber of Rooms",
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "1 Room - 2 Adults",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 3),
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "530 hotels found",
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    const Text(
                      "Filters",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.filter_list_sharp,
                      color: primary,
                      size: 26,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: hotel.length,
                itemBuilder: (context, index) {
                  return (
                    Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.grey,
                              // spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(hotel[index]),
                                        fit: BoxFit.fill),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                ),
                                Positioned(
                                    top: 15,
                                    right: 15,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            // flag_1 = !flag_1;
                                            // flag_2 = !flag_2;
                                            flag[index] = !flag[index];
                                          });
                                        },
                                        child: Icon(
                                          flag[index]
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: flag[index]
                                              ? Colors.red.shade400
                                              : Colors.black,
                                        ))),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    hotel_name[index],
                                    // "Grand Royal Hotel",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Text(
                                      // "\$180",
                                      hotel_price[index],
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 13),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Wembly, Londn",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600]),
                                      ),
                                      const SizedBox(width: 6),
                                      Icon(Icons.location_pin,
                                          color: primary),
                                      Text(
                                        "2 km to city",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 0),
                                  const Text(
                                    "\/per night",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star, size: 14, color: primary),
                                  Icon(Icons.star, size: 14, color: primary),
                                  Icon(Icons.star, size: 14, color: primary),
                                  Icon(Icons.star, size: 14, color: primary),
                                  Icon(Icons.star_border,
                                      size: 14, color: primary),
                                  const SizedBox(width: 10),
                                  Text(
                                    "80 Reviews",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ));
                }),
          )
        ],
      ),
    );
  }
}
