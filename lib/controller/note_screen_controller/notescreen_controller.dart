import 'dart:convert';

import 'package:cadmus/api_services/api_services.dart';
import 'package:cadmus/model/notemodel/notemodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteScreenController extends ChangeNotifier {
  var apiserviceeobj = ApiServices();

  String endurl = 'notes';
  List categories = [
    "All",
    "favourite",
  ];
  int currentcategory = 0;
  changecategory({required int index}) {
    currentcategory = index;
    notifyListeners();
  }

//  cred operations
  List notes = [];

  // get notes
  fetchnotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var responsedata = await apiserviceeobj.httpget(endurl, token);
    var decodeddata = jsonDecode(responsedata);
    notes = decodeddata.map((e) => Notemodel.fromJson(e)).toList();
    getcate(notes);
    notifyListeners();
  }

// add notes
  addnotes(
      {required String title,
      required String content,
      required String category}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    // var userid = prefs.get('userid');
    await apiserviceeobj.httppost(
      endurl,
      token,
      {
        'title': title,
        'content': content,
        'categorize_note': category,
        // 'owner': userid.toString(),
      },
    );
    fetchnotes();
    notifyListeners();
  }

  // deletenote
  deletenote({required int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    await apiserviceeobj.httpdelete(endurl, token, id);
    fetchnotes();
    notifyListeners();
  }

  // add to fav
  changefav(
      {required int id,
      required String title,
      required String content,
      required String category,
      required bool favorite}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    // var userid = prefs.get('userid');
    var changedfavorite = !favorite;
    await apiserviceeobj.httpput(endurl: endurl, token: token, id: id, data: {
      'title': title,
      'content': content,
      'categorize_note': category,
      // 'owner': userid.toString(),
      'favorite': changedfavorite.toString(),
    });
    fetchnotes();
    notifyListeners();
  }

  // edit note

  editnote(
      {required int id,
      required String title,
      required String content,
      required String category,
      required bool favorite}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    // var userid = prefs.get('userid');
    await apiserviceeobj.httpput(endurl: endurl, token: token, id: id, data: {
      'title': title,
      'content': content,
      'categorize_note': category,
      // 'owner': userid.toString(),
      'favorite': favorite.toString(),
    });
    fetchnotes();
    notifyListeners();
  }

  // getting categeries from the list
  getcate(List notes) {
    categories.clear();
    categories.add('All');
    categories.add('');
    for (int i = 0; i < notes.length; i++) {
      if (categories.contains(notes[i].categorizeNote)) {
      } else {
        categories.add(notes[i].categorizeNote);
      }
    }
    notifyListeners();
  }
}
