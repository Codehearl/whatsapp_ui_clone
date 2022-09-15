import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/responsive_layout.dart';
import 'package:whatsapp_ui_clone/screens/mobile_layout.dart';
import 'package:whatsapp_ui_clone/screens/web_layout.dart';
import 'package:whatsapp_ui_clone/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(mobileLayout:MobileLayout(),webLayout: WebLayout())
    );
  }
}



