import 'package:cadmus/view/group_screen/group_screen.dart';
import 'package:cadmus/view/note_screen/note_screen.dart';
import 'package:cadmus/view/task_screen/task_screen.dart';
import 'package:flutter/material.dart';

class BottomNavController extends ChangeNotifier {
  int currentindex = 0;
  List screenlist = [
    const NoteScreen(),
    const TaskScreen(),
    Text("group"),
    const GroupScreen()

    // const NoteScreen(),
    // const TaskScreen(),
    // const SearchScreen(),
    // const GroupScreen()
  ];

  void changescreen(int screenindex) {
    currentindex = screenindex;
    notifyListeners();
  }
}
