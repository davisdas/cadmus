import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/note_screen_controller/notescreen_controller.dart';
import 'package:cadmus/view/note_screen/note_add.dart';
import 'package:cadmus/view/note_screen/note_description.dart';
import 'package:cadmus/widgets/notecontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {
    Provider.of<NoteScreenController>(context, listen: false).fetchnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    var noteprovider = Provider.of<NoteScreenController>(context);
    return Scaffold(
      backgroundColor: themeprovider.primarycolor,
      body: Column(
        children: [
          // category lists
          SizedBox(
              height: 35,
              child: ListView.builder(
                itemCount: noteprovider.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () =>
                      Provider.of<NoteScreenController>(context, listen: false)
                          .changecategory(index: index),
                  child: Card(
                    color: noteprovider.currentcategory == index
                        ? ColorConstant.primarygreen
                        : Colors.grey.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: index == 1
                              ? Icon(
                                  Icons.favorite,
                                  color: themeprovider.secondrycolor,
                                )
                              : Text(
                                  noteprovider.categories[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: themeprovider.secondrycolor,
                                      fontSize: 15),
                                )),
                    ),
                  ),
                ),
              )),

          // note list by category
          Expanded(
              child: SizedBox(
            child: ListView.builder(
              itemCount: noteprovider.notes.length,
              itemBuilder: (context, index) {
                return noteprovider.currentcategory == 0
                    ? InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteDescrption(index: index),
                            )),
                        child: NoteContainer(
                            title: noteprovider.notes[index].title,
                            content: noteprovider.notes[index].content,
                            date:
                                noteprovider.notes[index].createdAt.toString(),
                            category: noteprovider.notes[index].categorizeNote,
                            favorite: noteprovider.notes[index].favorite),
                      )
                    : noteprovider.currentcategory == 1
                        ? noteprovider.notes[index].favorite
                            ? InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NoteDescrption(index: index),
                                    )),
                                child: NoteContainer(
                                    title: noteprovider.notes[index].title,
                                    content: noteprovider.notes[index].content,
                                    date: noteprovider.notes[index].createdAt
                                        .toString(),
                                    category: noteprovider
                                        .notes[index].categorizeNote,
                                    favorite:
                                        noteprovider.notes[index].favorite),
                              )
                            : const SizedBox()
                        : noteprovider
                                    .categories[noteprovider.currentcategory] ==
                                noteprovider.notes[index].categorizeNote
                            ? InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NoteDescrption(index: index),
                                    )),
                                child: NoteContainer(
                                    title: noteprovider.notes[index].title,
                                    content: noteprovider.notes[index].content,
                                    date: noteprovider.notes[index].createdAt
                                        .toString(),
                                    category: noteprovider
                                        .notes[index].categorizeNote,
                                    favorite:
                                        noteprovider.notes[index].favorite),
                              )
                            : const SizedBox();
              },
              // if (noteprovider.currentcategory == 0) {
              //   NoteContainer(
              //       title: noteprovider.notes[index].title,
              //       content: noteprovider.notes[index].content,
              //       date: noteprovider.notes[index].createdAt.toString(),
              //       category: noteprovider.notes[index].categorizeNote,
              //       favorite: true);
              // } else if (noteprovider.currentcategory == 1) {
              //   if (noteprovider.notes[index].favorite == true) {
              //     NoteContainer(
              //         title: noteprovider.notes[index].title,
              //         content: noteprovider.notes[index].content,
              //         date: noteprovider.notes[index].createdAt.toString(),
              //         category: noteprovider.notes[index].categorizeNote,
              //         favorite: true);
              //   }
              // } else {
              //   noteprovider.categories[noteprovider.currentcategory] ==
              //           noteprovider.notes[index].categorizeNote
              //       ? NoteContainer(
              //           title: noteprovider.notes[index].title,
              //           content: noteprovider.notes[index].content,
              //           date:
              //               noteprovider.notes[index].createdAt.toString(),
              //           category: noteprovider.notes[index].categorizeNote,
              //           favorite: true)
              //       : SizedBox();
              // }
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primarygreen,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NoteAdd(
                    title: '',
                    contnte: '',
                    category: '',
                    edit: false,
                    noteid: 0,
                    favorite: ''),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
