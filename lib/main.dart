import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ui/Firebase%20Code/Firebas_CRUD.dart';
import 'package:simple_ui/Firebase%20Code/Singin_page.dart';
import 'package:simple_ui/Firebase%20Code/notificationclass.dart';
import 'package:simple_ui/SecondPage.dart';
import 'package:simple_ui/coffee_app_ui/coffee.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Firebase Code/UserLogin_page.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
// this code is for background notification
Future<void> _firebaseMessagingBackgroundHandler(message) async {
  // print('Handling a backgroud massage ${message.messageId}');
}

NotificationsServices notificationsServices = NotificationsServices();

Future<void> main() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.getString('email', );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var prefs = await SharedPreferences.getInstance();
  prefs.getString(emailvalue);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(Simple_Ui());
}

class Simple_Ui extends StatefulWidget {
  @override
  State<Simple_Ui> createState() => _Simple_UiState();
}

class _Simple_UiState extends State<Simple_Ui> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "App_Ui",
          theme: ThemeData(
            // brightness: Brightness.dark, // for coffee UI
            // primarySwatch: Colors.orange // for coffee UI
            // primarySwatch: Colors.blue,
          ),
          home: FirebasAuthentication()
        // FirebaseExmple(), Firebase CRUD opration
        // emailvalue.isEmpty ? FirebasAuthentication() : coffee_1(),
      );
    });
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var Searchcontoler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    notificationPermission();
    initMessaing();
    notificationsServices.initialiseNotifications();
  }

  @override
  Widget build(BuildContext context) {
    List arrImage = [
      "assets/images/groot.jpg",
      "assets/images/tower.jpg",
      "assets/images/betman.jpg",
      "assets/images/groot.jpg",
    ];

    List arrTitle = [
      "I'm Groot",
      "It's a Tower",
      "I'm Betman",
      "I'm groot",
    ];

    // List Names = [" Groot", " Tower", " Betman", " Groot"];

    List Logo = [
      "assets/images/fb.png",
      "assets/images/twitter.png",
      "assets/images/YT.png",
      "assets/images/insta.png",
    ];

    List LogoName = [
      "Face book",
      "Twitter",
      "You Tube",
      "Instagram",
    ];

    List text = [
      "The seagull migration was delayed for half of month this year",
      "Tulsi Gabbard By the Numbers: Loved by the Right",
      "How TV Became Tech's Favorite Vanity project",
      "Fackbook News Won't Fix the News",
    ];

    List iconLogo = [
      "assets/images/fb.png",
      "assets/images/insta.png",
      "assets/images/twitter.png",
      "assets/images/YT.png",
      "assets/images/snap.png",
      "assets/images/fb.png",
      "assets/images/insta.png",
      "assets/images/twitter.png",
      "assets/images/YT.png",
      "assets/images/snap.png",
    ];

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.grey.shade200,
              child: SizedBox(
                // width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: Searchcontoler,
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black54,
                                width: 2,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.search, size: 35),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Today's hot",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SecondPage()));
                                },
                                icon: const Icon(Icons.add, size: 30)),
                            IconButton(
                                onPressed: () {
                                  notificationsServices.sandNotification(
                                      'HOLA', 'Hello');
                                },
                                icon: Icon(Icons.notification_add))
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 45,
                          // width: MediaQuery.of(context).size.width * 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: iconLogo.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(iconLogo[index]),
                                  maxRadius: 25,
                                  backgroundColor: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 22),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: arrTitle.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 25.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 85,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(arrImage[index]),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.6,
                                          child: Text(
                                            text[index],
                                            style: const TextStyle(
                                                height: 1.5,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        // Text(Names[index]),
                                        const SizedBox(height: 13),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage:
                                              AssetImage(arrImage[index]),
                                              radius: 10,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              arrTitle[index],
                                              style: const TextStyle(
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(width: 8),
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  Logo[index]),
                                              radius: 12,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              LogoName[index],
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }

  void initMessaing1() {
    FirebaseMessaging.onMessage
        .asBroadcastStream()
        .listen((RemoteMessage message) {
      // print('Got a message whilst in the onMessage!');
      print("onMessage: ${message.data}");
      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification
                ?.toMap()}');
      }
    });
  }

  Future<void> initMessaing() async {
    await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the onMessageOpenedApp!');
      print("onMessageOpenedApp: ${message.data}");
      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification
                ?.android!.toMap()}');
      }
    });
    initMessaing1();
  }

  // direct call in init state
  void notificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}
