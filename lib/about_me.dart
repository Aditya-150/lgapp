import 'package:flutter/material.dart';
import 'package:lgapp/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri lUrl =
    Uri.parse('https://www.linkedin.com/in/aditya-prasad-mohanty-6736231a0/');
final Uri bUrl =
    Uri.parse('https://www.behance.net/adityaprasadmohanty');
final Uri gUrl =
    Uri.parse('https://github.com/Aditya-150');
Future<void> linkedinUrl() async {
  if (!await launchUrl(lUrl)) {
    throw Exception('Could not launch $lUrl');
  } else {
    await launchUrl(lUrl);
  }
}
Future<void> behanceUrl() async {
  if (!await launchUrl(bUrl)) {
    throw Exception('Could not launch $bUrl');
  } else {
    await launchUrl(bUrl);
  }
}
Future<void> githubUrl() async {
  if (!await launchUrl(gUrl)) {
    throw Exception('Could not launch $gUrl');
  } else {
    await launchUrl(gUrl);
  }
}
class AboutMe extends StatelessWidget {
  const AboutMe({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color:
                      themeNotifier.isDark ? Colors.white54 : Colors.black54),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/Pic.png',
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "ADITYA PRASAD MOHANTY",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.w700,
                    color: themeNotifier.isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "S T U D E N T  D E V E L O P E R",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    fontWeight: FontWeight.w700,
                    color:
                        themeNotifier.isDark ? Colors.white54 : Colors.black54,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: linkedinUrl,
                      icon: Icon(FontAwesomeIcons.linkedin,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          size: 24.0),
                    ),
                    IconButton(
                      onPressed: behanceUrl,
                      icon: Icon(FontAwesomeIcons.behance,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          size: 24.0),
                    ),
                    IconButton(
                      onPressed: githubUrl,
                      icon: Icon(FontAwesomeIcons.github,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          size: 24.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08),
                  child: Text(
                    "Hey, nice to meet you!! I'm a 3rd year BTech undergrad at Odisha University of Technology and Research, Bhubaneswar. I'm an open source enthusiast. I'm here to learn, contribute and collaborate.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontWeight: FontWeight.w500,
                      color: themeNotifier.isDark
                          ? Colors.white54
                          : Colors.black87,
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
