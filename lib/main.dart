import 'package:flutter/material.dart';
import 'package:lgapp/theme_model.dart';
import 'package:provider/provider.dart';

import 'about_me.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  // ignore: library_private_types_in_public_api
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            home: LGHomePage(
              mode: _themeMode,
            ),
          );
        }));
  }
}

class LGHomePage extends StatefulWidget {
  const LGHomePage({super.key, required this.mode});
  final ThemeMode mode;
  @override
  State<LGHomePage> createState() => _LGHomePageState();
}

class _LGHomePageState extends State<LGHomePage> {
  int i = 0;
  Color themeColor = const Color(0xFF4C7CBF);
  void colorChange(int i) {
    setState(() {
      if (i == 0) {
        themeColor = const Color(0xFFEF4F3F);
      } else if (i == 1) {
        themeColor = const Color(0xFFFCBA25);
      } else if (i == 2) {
        themeColor = const Color(0xFF4C7CBF);
      } else if (i == 3) {
        themeColor = const Color(0xFF31B161);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(' L G '),
            centerTitle: true,
            backgroundColor: themeColor,
            actions: [
              IconButton(
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                  icon: Icon(themeNotifier.isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded))
            ],
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 64, 84, 94),
                ),
                child: Text(
                  'L I Q U I D  G A L A X Y',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: const Text('A B O U T  M E'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AboutMe()));
                },
              ),
            ],
          )),
          body: Center(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image.asset(
                'assets/images/LIQUIDGALAXYLOGO.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    colorChange(0);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4F3F),
                  ),
                  child: Text(
                    "R E D",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                    onPressed: () {
                      colorChange(1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFCBA25),
                    ),
                    child: Text(
                      "Y E L L O W",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                    onPressed: () {
                      colorChange(2);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C7CBF),
                    ),
                    child: Text(
                      "B L U E",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                    onPressed: () {
                      colorChange(3);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF31B161),
                    ),
                    child: Text(
                      "G R E E N",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ]),
          ));
    });
  }
}
