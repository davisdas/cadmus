import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/bottom_nav_controller/bottom_nav_controller.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/view/profile_drawer/profiledrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = Provider.of<BottomNavController>(context).currentindex;
    return SafeArea(
      child: Scaffold(
        drawer: const ProfileDrawer(),
        // appbar
        appBar: AppBar(
          backgroundColor:
              Provider.of<DarkthemeCpntroller>(context).primarycolor,
          title: Text(
            "app name",
            style: TextStyle(color: ColorConstant.primarygreen),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Center(
                    child: CircleAvatar(
                      radius: 20,
                    ),
                  ));
            },
          ),
          // actions: [
          //   InkWell(
          //     onTap: () =>
          //         Provider.of<DarkthemeCpntroller>(context, listen: false)
          //             .changetheme(),
          //     child: Container(
          //       color: ColorConstant.primarygreen,
          //       child: const Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Text("dark"),
          //       ),
          //     ),
          //   )
          // ],
        ),

        // body
        body:
            Provider.of<BottomNavController>(context).screenlist[currentIndex],

        // bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              Provider.of<DarkthemeCpntroller>(context).primarycolor,
          selectedItemColor: ColorConstant.primarygreen,
          unselectedItemColor: ColorConstant.secondrygreen,
          elevation: 0,
          iconSize: 32,
          currentIndex: Provider.of<BottomNavController>(context).currentindex,
          onTap: (value) {
            Provider.of<BottomNavController>(context, listen: false)
                .changescreen(value);
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'notes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt_rounded), label: 'task'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "group")
          ],
        ),
      ),
    );
  }
}
