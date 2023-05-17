import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ui/SPdetailfire.dart';
import 'package:simple_ui/coffee_app_ui/Drawer_Menu.dart';

import '../Firebase Code/UserLogin_page.dart';

class coffee_1 extends StatefulWidget {
  const coffee_1({super.key});

  @override
  State<StatefulWidget> createState() {
    return coffee_1State();
  }
}

class coffee_1State extends State<coffee_1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  FirebasAuthentication firebasAuth = const FirebasAuthentication();

  @override
  void initState() {
    super.initState();
    setState(() {
      _tabController = TabController(length: 5, vsync: this);
    });
  }

  var currentPage = DrawerSection.dashboard;

  List coffee_names = [
    "Cappucino",
    "Latte",
    "Black",
    "Cappucino",
    "Cold Coffee",
    "Hote Coffee",
  ];

  List coffee_images = [
    "assets/images/latte2.jpg",
    "assets/images/coffee_2.jpg",
    "assets/images/coffee_1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[600]),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DrawerMenu(),
              DrawerList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.home,
                    color: Colors.grey[500],
                  )),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Xyz()));
                },
                child: Icon(
                  Icons.navigate_next,
                  color: Colors.grey[500],
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: InkWell(
                onTap: () {
                  //UserLogout();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirebasAuthentication()));
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.grey[500],
                ),
              ),
              label: ""),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Find Your Coffee..",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey[500],
            tabs: const [
              Tab(
                child: Text(
                  "Cappucino",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Latte",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Black",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Hot Coffee",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Cold Coffee",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: coffee_images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 180,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Image.asset(coffee_images[index]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Latte",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "With Almond Milk",
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("\$4.00"),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: InkWell(
                                            onTap: () {},
                                            child: const Icon(Icons.add))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  Container(
                    color: Colors.grey,
                    child: const Text(
                      "Hello!",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: const Text(
                      "Hello!",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: const Text(
                      "Hello!",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: const Text(
                      "Hello!",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.contacts_outlined,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(4, "Notes", Icons.note_add,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(5, "Settings", Icons.settings,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(6, "Notification", Icons.notifications,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(8, "Sand feedback", Icons.feedback,
              currentPage == DrawerSection.dashboard ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      // color: selected ? Colors.grey[500] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSection.contacts;
            } else if (id == 3) {
              currentPage = DrawerSection.events;
            } else if (id == 4) {
              currentPage = DrawerSection.notes;
            } else if (id == 5) {
              currentPage = DrawerSection.settings;
            } else if (id == 6) {
              currentPage = DrawerSection.notification;
            } else if (id == 7) {
              currentPage = DrawerSection.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSection.sand_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.grey[500],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future UserLogout() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    const msg3 = SnackBar(content: Text('Logout Successfully'));
    ScaffoldMessenger.of(context).showSnackBar(msg3);

    // Write code here fore navigate to login page
  }
}

enum DrawerSection {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notification,
  privacy_policy,
  sand_feedback,
}
