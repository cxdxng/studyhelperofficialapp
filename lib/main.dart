import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studyhelper/Calendar.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    supportedLocales: [
      const Locale('de', 'DE'),
    ],
    initialRoute: "/",
    routes: {
      "/": (context) => const Home(),
      "/overview": (context) => const Overview(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Declare variables for runtime

  // Create a list for all upcomming appointments for runtime
  List appointments = [];
  // Create an instance of DateTime.now() to get current time
  DateTime now = DateTime.now();
  // Empty Strings to hold selected Date/Time for adding events
  String formattedDate = "";
  String formattedTime = "";

  // Unformatted date for uploading to mysql
  String mysqlDate = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Study Helper"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(child: makeDarkText("Overview")),
              ),
              ListTile(
                title: const Text("Home"),
                onTap: () => Navigator.pushNamed(context, "/"),
              ),
              ListTile(
                title: const Text("Calendar"),
                onTap: () => Navigator.pushNamed(context, "/overview"),
              ),
            ],
          ),
        ),
        body: Builder(builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/wallpaper.jpg"))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: makeText("Welcome to StudyHelper"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "made with ❤ by cxdxng",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ]),
          );
        }),
      ),
    );
  }
}

Widget makeText(String data) {
  return Text(
    data,
    style: const TextStyle(
        fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
  );
}

Widget makeDarkText(String data) {
  return Text(
    data,
    style: const TextStyle(
        fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
  );
}
