import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cadmus/api_services/api_services.dart';
import 'package:cadmus/model/groupmodel/groupmodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupScreenController extends ChangeNotifier {
  var groupdata;
  var apiserviceeobj = ApiServices();
  fetchgroups() async {
    String endurl = "api/my-groups";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var responsedata = await apiserviceeobj.httpget(endurl, token);
    var decodeddata = jsonDecode(responsedata);
    print(decodeddata);
    // print("object");
    groupdata = GroupModel.fromJson(decodeddata);
    notifyListeners();
  }

  // groupdescription listing members for add members (includes only user who is not in the group)

  List toaddlist = [];

  getusers(int groupid) async {
    String endurl = "groups/$groupid/add-member";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var responsedata = await apiserviceeobj.httpget(endurl, token);
    var decodeddata = jsonDecode(responsedata);
    print(decodeddata);
    toaddlist = decodeddata['registered_users_emails'];
    notifyListeners();
  }

  // add users to group

  adduser(int groupid, String useremail) async {
    var url = Uri.parse("http://10.0.2.2:8000/noteapp/groups/1/add-member/");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    var respons = await http.put(url,
        headers: {'Authorization': 'token $token'}, body: {"email": useremail});
    groupdata();
    fetchgroups();
  }
}
