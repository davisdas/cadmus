import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/group_screen_controller/group_screen_controller.dart';
import 'package:cadmus/view/group_screen/groupcontent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    Provider.of<GroupScreenController>(context, listen: false).fetchgroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    var groupprovider = Provider.of<GroupScreenController>(context).groupdata;
    return Scaffold(
        backgroundColor: themeprovider.primarycolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   groupprovider.createdGroups[1].groupName,
              //   style: TextStyle(color: Colors.amber),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "+ create group",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: themeprovider.secondrycolor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20)
                ],
              ),
              Column(
                children: List.generate(
                    groupprovider.createdGroups.length,
                    (index) => GroupContainer(
                        memberlist: groupprovider.createdGroups[index].members,
                        groupid: groupprovider.createdGroups[index].id,
                        image: groupprovider.createdGroups[index].description,
                        groupname:
                            groupprovider.createdGroups[index].description,
                        des: groupprovider.createdGroups[index].description,
                        memberno:
                            groupprovider.createdGroups[index].members.length)),
              ),
              Column(
                children: List.generate(
                    groupprovider.addedGroups.length,
                    (index) => GroupContainer(
                        memberlist: groupprovider.addedGroups[index].members,
                        groupid: groupprovider.addedGroups[index].id,
                        image: groupprovider.addedGroups[index].groupImage,
                        groupname: groupprovider.addedGroups[index].groupName,
                        des: groupprovider.addedGroups[index].description,
                        memberno:
                            groupprovider.addedGroups[index].members.length)),
              )
            ],
          ),
        ));
  }
}

class GroupContainer extends StatelessWidget {
  const GroupContainer({
    super.key,
    required this.image,
    required this.groupname,
    required this.des,
    required this.memberno,
    required this.groupid,
    required this.memberlist,
  });

  final String image;
  final String groupname;
  final String des;
  final int memberno;
  final int groupid;
  final List memberlist;

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  GroupContent(groupid: groupid, memberlist: [memberlist]),
            )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groupname,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: themeprovider.secondrycolor,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      des,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: themeprovider.secondrycolor,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorConstant.primarygreen),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "$memberno people",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: themeprovider.secondrycolor),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
