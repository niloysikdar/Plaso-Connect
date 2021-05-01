import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/screens/addoxygen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((val) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: kbackgroundLight,
        primarySwatch: kelectronBlue,
        accentColor: kelectronBlue,
        primaryColor: kelectronBlue,
        iconTheme: IconThemeData(color: kelectronBlue),
      ),
      home: AddOxygenDetails(),
    );
  }
}
