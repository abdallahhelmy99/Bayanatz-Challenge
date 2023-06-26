// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/Colors.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Screens/ReceiptsList.dart';
import 'Firebase/firebase_options.dart';

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
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Poppins', useMaterial3: true),
      home: ReceiptsList(),
    );
  }
}