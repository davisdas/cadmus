import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.category,
    required this.favorite,
  });
  final String title;
  final String content;
  final String date;
  final String category;
  final bool favorite;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DarkthemeCpntroller>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 6, right: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: provider.secondrycolor),
                  ),
                ),
                SizedBox(
                    child: favorite == false
                        ? const SizedBox()
                        : Icon(
                            Icons.favorite,
                            color: provider.secondrycolor,
                          ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              content,
              maxLines: 4,
              style: TextStyle(
                  letterSpacing: 1,
                  wordSpacing: 1.2,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: provider.secondrycolor),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  date,
                  style: TextStyle(color: provider.secondrycolor),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.primarygreen,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 3, top: 3),
                    child: Text(
                      category,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: provider.secondrycolor,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
