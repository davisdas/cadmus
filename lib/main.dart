import 'package:cadmus/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/group_screen_controller/group_screen_controller.dart';
import 'package:cadmus/controller/note_screen_controller/notescreen_controller.dart';
import 'package:cadmus/controller/task_screen_controller/task_screen_controller.dart';
import 'package:cadmus/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DarkthemeCpntroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GroupScreenController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
