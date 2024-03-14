import 'dart:convert';

import 'package:cadmus/api_services/api_services.dart';
import 'package:cadmus/model/taskmodel/taskmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreenController extends ChangeNotifier {
  var apiserviceeobj = ApiServices();
  String endurl = 'todos';
  List task = [];

  fetchtasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var responsedata = await apiserviceeobj.httpget(endurl, token);
    var decodeddata = jsonDecode(responsedata);
    // print(decodeddata);
    task = decodeddata.map((e) => Taskmodel.fromJson(e)).toList();
    notifyListeners();
  }

  addtasks(
      {required String title,
      required String description,
      required String date}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var userid = prefs.get('userid');
    // print(userid);
    // var responsedata =
    await apiserviceeobj.httppost(endurl, token, {
      'title': title,
      'description': description,
      'reminded_date': date,
      'owner': userid.toString()
    });
    fetchtasks();
    notifyListeners();
  }

//  donetask calling at task screen
  donetask(
      {required int id,
      required String title,
      required String description,
      required String date,
      required bool status}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var userid = prefs.get('userid');
    // print(userid);
    // var responsedata =
    await apiserviceeobj.httpput(endurl: endurl, token: token, id: id, data: {
      'title': title,
      'description': description,
      'reminded_date': date,
      'owner': userid.toString(),
      'status': "${!status}"
    });
    fetchtasks();
    notifyListeners();
  }

  // deletetask
  deletetask({required int id, required var context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    await apiserviceeobj.httpdelete(endurl, token, id);
    await fetchtasks();
    Navigator.pop(context);
    notifyListeners();
  }

  edittask(
      {required int id,
      required String title,
      required String description,
      required String date,
      required bool status}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var userid = prefs.get('userid');
    // print(userid);
    // var responsedata =
    await apiserviceeobj.httpput(endurl: endurl, token: token, id: id, data: {
      'title': title,
      'description': description,
      'reminded_date': date,
      'owner': userid.toString(),
      'status': status.toString()
    });
    fetchtasks();
    notifyListeners();
  }
}
