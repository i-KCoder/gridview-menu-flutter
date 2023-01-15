import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iK Coder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MenuList> menus = [];
  List<MenuList> settings = [];

  @override
  void initState() {
    super.initState();
    menus.addAll([
      MenuList(1, "Personal", Icons.person),
      MenuList(2, "Work", Icons.work),
      MenuList(3, "Meeting", Icons.videocam),
      MenuList(4, "Events", Icons.event),
      MenuList(5, "Privacy", Icons.lock_outline)
    ]);

    settings.addAll([
      MenuList(1, "Report", Icons.bug_report),
      MenuList(2, "Profile", Icons.person_pin_rounded),
      MenuList(4, "Logout", Icons.logout),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff392850),
        body: ListView(shrinkWrap: true, children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16),
            child: Text(
              "Dashboard",
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 15, right: 15),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
            itemCount: menus.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff453658),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(menus[index].icon, color: Colors.white),
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.width > 700 ? 10 : 8),
                    Text(
                      menus[index].title == null
                          ? ""
                          : menus[index].title.toString(),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 16),
            child: Text(
              "Settings",
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 15, right: 15),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
            itemCount: settings.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff453658),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(settings[index].icon, color: Colors.white),
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.width > 700 ? 10 : 8),
                    Text(
                      settings[index].title == null
                          ? ""
                          : settings[index].title.toString(),
                    ),
                  ],
                ),
              );
            },
          ),
        ]));
  }
}

class MenuList {
  int menuId;
  String title;
  IconData icon;

  MenuList(this.menuId, this.title, this.icon);
}
