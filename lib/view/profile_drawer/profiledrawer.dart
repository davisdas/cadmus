import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/sharedpref_controller/sharedprefcontroller.dart';
import 'package:cadmus/view/completed_task_screen/completed_task_screen.dart';
import 'package:cadmus/view/login_and_registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  var obj = SharedPrefController();

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    return Drawer(
      backgroundColor: themeprovider.primarycolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstant.primarygreen,
                  ),
                  Text(
                    "Back",
                    style: TextStyle(
                        color: ColorConstant.primarygreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundColor: ColorConstant.primarygreen,
            ),
            const SizedBox(height: 10),
            Text(
              "Username",
              style: TextStyle(
                  color: themeprovider.secondrycolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              "Username@gmail.com",
              style: TextStyle(
                  color: themeprovider.secondrycolor,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTaskScreen(),
                  )),
              child: const SettingTile(
                title: "Completed Taks",
                subtitle: "4 task compketed",
              ),
            ),
            const SettingTile(
              title: "Favourites",
              subtitle: "4 fav notes",
            ),

            // theme setting
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: themeprovider.secondrycolor),
                  ),
                  InkWell(
                    onTap: () =>
                        Provider.of<DarkthemeCpntroller>(context, listen: false)
                            .changetheme(),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          border: Border.all(
                              color: ColorConstant.primarygreen, width: 2),
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: themeprovider.darktheme == true
                                    ? ColorConstant.primarygreen
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(8))),
                            child: Center(
                              child: Text(
                                "Dark",
                                style: TextStyle(
                                  color: themeprovider.secondrycolor,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: themeprovider.darktheme == false
                                    ? ColorConstant.primarygreen
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(8))),
                            child: Center(
                                child: Text(
                              "Light",
                              style: TextStyle(
                                color: themeprovider.secondrycolor,
                                fontStyle: FontStyle.italic,
                              ),
                            )),
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                obj.logoutuser();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstant.primarygreen),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign out",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: themeprovider.secondrycolor),
                      ),
                      Icon(
                        Icons.exit_to_app_rounded,
                        color: themeprovider.secondrycolor,
                        size: 27,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: themeprovider.secondrycolor),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontStyle: FontStyle.italic, color: themeprovider.secondrycolor),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: themeprovider.secondrycolor,
      ),
    );
  }
}
