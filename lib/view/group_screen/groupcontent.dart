import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/group_screen_controller/group_screen_controller.dart';
import 'package:cadmus/view/group_screen/groupdescription.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupContent extends StatefulWidget {
  const GroupContent({Key? key, required this.groupid, required this.memberlist}) : super(key: key);
  final int groupid;
  final List memberlist;
  @override
  State<GroupContent> createState() => _GroupContentState();
}

class _GroupContentState extends State<GroupContent> {


  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkthemeCpntroller>(context);
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: themeProvider.primarycolor,
        appBar: AppBar(
          backgroundColor: themeProvider.primarycolor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: themeProvider.secondrycolor,
            ),
          ),
          title: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GroupDescription(
                          groupid: widget.groupid,memberlist: widget.memberlist,
                        ))),
            child: Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 15),
                Text(
                  "groupname",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: themeProvider.secondrycolor,
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            labelColor: ColorConstant.primarygreen,
            indicatorColor: ColorConstant.primarygreen,
            tabs: const [
              Tab(icon: Icon(Icons.notes), text: 'Notes'),
              Tab(icon: Icon(Icons.task_alt_rounded), text: 'Tasks')
            ],
          ),
        ),
        body: TabBarView(
          children: [GroupNotes(), GroupTask()],
        ),
      ),
    );
  }
}

class GroupNotes extends StatelessWidget {
  const GroupNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

class GroupTask extends StatelessWidget {
  const GroupTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
