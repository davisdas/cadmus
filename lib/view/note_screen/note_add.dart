import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/note_screen_controller/notescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteAdd extends StatefulWidget {
  const NoteAdd(
      {super.key,
      required this.title,
      required this.contnte,
      required this.category,
      required this.edit,
      required this.noteid,
      required this.favorite
      });
  final String title;
  final String contnte;
  final String category;
  final bool edit;
  final int noteid;
  final favorite;
  @override
  State<NoteAdd> createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();

  @override
  void initState() {
    categorycontroller.text = widget.category;
    titlecontroller.text = widget.title;
    contentcontroller.text = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: provider.primarycolor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // category
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: categorycontroller,
                      style: TextStyle(
                          color: provider.secondrycolor,
                          fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Category",
                          hintStyle: TextStyle(
                              color: provider.secondrycolor.withOpacity(0.5),
                              fontStyle: FontStyle.italic)),
                    ),
                  )),
              // const SizedBox(height: 10),

              // titleeeee
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: titlecontroller,
                      style: TextStyle(
                          color: provider.secondrycolor,
                          fontSize: 25,
                          fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title",
                          hintStyle: TextStyle(
                              color: provider.secondrycolor.withOpacity(0.5),
                              fontSize: 25,
                              fontStyle: FontStyle.italic)),
                    ),
                  )),
              // const SizedBox(height: 10),

              // content
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        controller: contentcontroller,
                        style: TextStyle(
                            color: provider.secondrycolor,
                            fontStyle: FontStyle.italic),
                        maxLines: 30,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Content",
                            hintStyle: TextStyle(
                                color: provider.secondrycolor.withOpacity(0.5),
                                fontStyle: FontStyle.italic)),
                      ),
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            widget.edit == true
                ? Provider.of<NoteScreenController>(context, listen: false)
                    .editnote(
                        favorite: widget.favorite,
                        id: widget.noteid,
                        category: categorycontroller.text,
                        content: contentcontroller.text,
                        title: titlecontroller.text)
                :
            Provider.of<NoteScreenController>(context, listen: false).addnotes(
              category: categorycontroller.text,
              title: titlecontroller.text,
              content: contentcontroller.text,
            );
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstant.primarygreen),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                widget.edit == true ? " edit " : " Save ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: provider.secondrycolor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
