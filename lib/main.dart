import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    supportedLocales: [
      const Locale('de', 'DE'),
    ],
    home: Home(),
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

  // Images for Cards
  AssetImage sis = const AssetImage("assets/sis.png");
  AssetImage horde = const AssetImage("assets/horde.png");
  AssetImage lea = const AssetImage("assets/lea.png");
  AssetImage leaIntern = const AssetImage("assets/leaIntern.png");
  AssetImage miaImg = const AssetImage("assets/mia.png");
  AssetImage mensaImage = const AssetImage("assets/mensaImage.png");
  AssetImage praktoImage = const AssetImage("assets/praktoImage.png");
  AssetImage stundenplan = const AssetImage("assets/stundenplan.png");
  AssetImage zeitplanImage = const AssetImage("assets/zeitplanImage.png");

  // Links to websites
  String linkSIS = "https://sis.h-brs.de";
  String linkHorde = "https://horde.inf.h-brs.de";
  String linkLea = "https://lea.h-brs.de";

  String miaLink = "https://mia.h-brs.de/";
  String linkEva = "https://eva.inf.h-brs.de";
  String linkPrakto = "https://praktomat.inf.h-brs.de/";
  String stundenplanEva = "https://eva2.inf.h-brs.de/stundenplan/";
  String zeitplan = "https://horde.inf.h-brs.de/fbz.html";

  String mensa =
      "https://www.studierendenwerk-bonn.de/essen-trinken/mensen-cafes/mensa-sankt-augustin/";

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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          makeRow(horde, sis, linkHorde, linkSIS),
                          makeRow(lea, miaImg, linkLea, miaLink),
                          makeRow(mensaImage, praktoImage, mensa, linkPrakto),
                          makeRow(stundenplan, zeitplanImage, stundenplanEva,
                              zeitplan),
                        ],
                      ),
                    ),
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

Row makeRow(image1, image2, link1, link2) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(link1));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Image(image: image1)),
            ),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(link2));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Image(image: image2)),
            ),
          ),
        ),
      ),
    ],
  );
}
