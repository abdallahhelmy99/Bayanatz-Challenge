// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/Colors.dart';
import 'package:flutter_application_1/Screens/DigitalReceipt.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Screens/ReceiptsList.dart';
import 'Firebase/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'Screens/Settings.dart';



// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.primaryColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // rgb color values
        primaryColor: Colors.black,
        fontFamily: 'Poppins',
      ),
      home: ReceiptsList(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to my Flutter app!'),
      ),
    );
  }
}