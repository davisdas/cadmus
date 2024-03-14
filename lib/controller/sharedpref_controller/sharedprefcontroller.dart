import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  var login;
  addlogindetails(String tokens, int userid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", true);
    await prefs.setString("token", tokens);
    await prefs.setInt("userid", userid);
  }

  fetchlogindatails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.get("login");
  }

  logoutuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    prefs.setString("token", "");
  }
}
