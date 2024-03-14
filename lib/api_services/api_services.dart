import 'dart:convert';

import 'package:cadmus/controller/sharedpref_controller/sharedprefcontroller.dart';
import 'package:cadmus/view/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  var obj = SharedPrefController();
  var baseurl = 'http://10.0.2.2:8000/noteapp';

  //// user login
  void login(
      {required String username,
      required String password,
      required var context}) async {
    var url = Uri.parse("$baseurl/login/");
    var response = await http
        .post(url, body: {"username": username, "password": password});
    Map jsonresponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonresponse["msg"])));
      obj.addlogindetails(jsonresponse["token"], jsonresponse["id"]);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(jsonresponse["msg"])));
    }
  }

  // userregister
  void register(
      {required var context,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.parse("$baseurl/register/");
    try {
      var response = await http.post(url, body: {
        "username": username,
        "email": email,
        "password": password,
      });
      Map jsonresponse = jsonDecode(response.body);
      // print(response.statusCode);
      // print(response.body);
      List? usernames = jsonresponse["username"];
      if (response.statusCode == 201) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(jsonresponse['msg'])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(usernames![0])));
      }
    } catch (e) {
      // print(e);
    }
  }

  //  get using token

  httpget(String endurl, var token) async {
    var url = Uri.parse('$baseurl/$endurl/');
    var response =
        await http.get(url, headers: {'Authorization': 'token $token'});
    var responsedata = response.body;
    // print(responsedata);
    return responsedata;
  }

  // post using token
  httppost(String endurl, var token, var data) async {
    var url = Uri.parse('$baseurl/$endurl/');
    var response = await http.post(url,
        headers: {'Authorization': 'token $token'}, body: data);
    print(response.statusCode);

    // var responsedata = response.body;
    // print(responsedata);
  }

  // put using token
  httpput(
      {required String endurl,
      required var token,
      required Map data,
      required int id}) async {
    var url = Uri.parse('$baseurl/$endurl/$id/');
    var respons = await http.put(url,
        headers: {'Authorization': 'token $token'}, body: data);
    print(respons.body);
    print(id);
  }

  // delete using token
  httpdelete(String endurl, var token, int id) async {
    var url = Uri.parse('$baseurl/$endurl/$id/');
    await http.delete(url, headers: {'Authorization': 'token $token'});
  }
}
