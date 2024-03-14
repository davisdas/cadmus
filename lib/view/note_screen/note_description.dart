import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/note_screen_controller/notescreen_controller.dart';
import 'package:cadmus/view/note_screen/note_add.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteDescrption extends StatefulWidget {
  const NoteDescrption({super.key, required this.index});
  final int index;
  @override
  State<NoteDescrption> createState() => _NoteDescrptionState();
}

class _NoteDescrptionState extends State<NoteDescrption> {
  @override
  Widget build(BuildContext context) {
    var currentnotes =
        Provider.of<NoteScreenController>(context).notes[widget.index];
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: provider.primarycolor,
      appBar: AppBar(
        backgroundColor: provider.primarycolor,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: provider.secondrycolor)),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<NoteScreenController>(context, listen: false)
                    .changefav(
                        id: currentnotes.id,
                        title: currentnotes.title,
                        content: currentnotes.content,
                        category: currentnotes.categorizeNote,
                        favorite: currentnotes.favorite);
              },
              icon: currentnotes.favorite == false
                  ? Icon(
                      Icons.favorite_outline,
                      color: provider.secondrycolor,
                    )
                  : Icon(
                      Icons.favorite,
                      color: provider.secondrycolor,
                    )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoteAdd(
                              favorite: currentnotes.favorite,
                              category: currentnotes.categorizeNote!,
                              contnte: currentnotes.content!,
                              title: currentnotes.title!,
                              noteid: currentnotes.id!,
                              edit: true,
                            )));
              },
              icon: Icon(
                Icons.edit,
                color: provider.secondrycolor,
              )),
          IconButton(
              onPressed: () {
                Provider.of<NoteScreenController>(context, listen: false)
                    .deletenote(id: currentnotes.id);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentnotes.title!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: provider.secondrycolor,
                    fontSize: 27),
              ),
              Row(
                children: [
                  Text(
                    currentnotes.createdAt.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: provider.secondrycolor,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.primarygreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, bottom: 3, top: 3),
                      child: Text(
                        currentnotes.categorizeNote,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: provider.secondrycolor,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                currentnotes.content!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: provider.secondrycolor,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
