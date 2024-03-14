import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/group_screen_controller/group_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupDescription extends StatefulWidget {
  const GroupDescription(
      {super.key, required this.groupid, required this.memberlist});
  final int groupid;
  final List memberlist;
  @override
  State<GroupDescription> createState() => _GroupDescriptionState();
}

class _GroupDescriptionState extends State<GroupDescription> {
  @override
  void initState() {
    Provider.of<GroupScreenController>(context, listen: false)
        .getusers(widget.groupid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkthemeCpntroller>(context);
    return Scaffold(
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
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://tse1.mm.bing.net/th?id=OIP.GPFEY6kfgxbsja6gmrW6rwHaE7&pid=Api&P=0&h=180"),
                      fit: BoxFit.cover)),
            ),
          ),

          Text(
            "Groupname",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: themeProvider.secondrycolor,
                fontStyle: FontStyle.italic,
                fontSize: 25),
          ),

          Text(
            "3 members",
            style: TextStyle(
              // fontWeight: FontWeight.w500,
              color: themeProvider.secondrycolor,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),

          // add member button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Add members',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 20),
                      ),
                      content: SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                                  Provider.of<GroupScreenController>(context)
                                      .toaddlist
                                      .length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(Provider.of<
                                                        GroupScreenController>(
                                                    context)
                                                .toaddlist[index]),
                                            InkWell(
                                              onTap: () {
                                                Provider.of<GroupScreenController>(
                                                        context,
                                                        listen: false)
                                                    .adduser(
                                                        widget.groupid,
                                                        Provider.of<GroupScreenController>(
                                                                context,
                                                                listen: false)
                                                            .toaddlist[index]);
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: ColorConstant
                                                        .primarygreen),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: themeProvider
                                                            .secondrycolor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))),
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "close",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.primarygreen),
                            ))
                      ],
                    );
                  },
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ColorConstant.primarygreen, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: ColorConstant.primarygreen,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Add Memeber",
                          style: TextStyle(
                              color: ColorConstant.primarygreen,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(children: [
            SizedBox(width: 10),
            Text(
              "Members",
              style: TextStyle(
                  color: themeProvider.secondrycolor,
                  fontSize: 19,
                  fontStyle: FontStyle.italic),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    widget.memberlist[0].length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.memberlist[0][index].toString(),
                                style: TextStyle(
                                    color: themeProvider.secondrycolor),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorConstant.primarygreen,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Remove",
                                    style: TextStyle(
                                        color: themeProvider.secondrycolor),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
