import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/task_screen_controller/task_screen_controller.dart';
import 'package:cadmus/view/task_screen/task_add.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskDescription extends StatefulWidget {
  const TaskDescription({super.key, required this.index});
  final int index;
  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  @override
  Widget build(BuildContext context) {
    var currenttask =
        Provider.of<TaskScreenController>(context).task[widget.index];
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    return Scaffold(
      backgroundColor: themeprovider.primarycolor,
      appBar: AppBar(
        backgroundColor: themeprovider.primarycolor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: themeprovider.secondrycolor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TaskAdd()));
              },
              icon: Icon(
                Icons.edit,
                color: themeprovider.secondrycolor,
              )),
          IconButton(
            onPressed: () {
              Provider.of<TaskScreenController>(context, listen: false)
                  .deletetask(id: currenttask.id, context: context);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TaskScreenController>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value.task[widget.index].title,
                style: TextStyle(
                    fontSize: 25,
                    color: themeprovider.secondrycolor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.primarygreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    value.task[widget.index].remindedDate.toString(),
                    // currenttask.remindedDate.toString(),
                    style: TextStyle(
                        color: themeprovider.secondrycolor,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                // currenttask.description,
                value.task[widget.index].description,
                maxLines: 10,
                style: TextStyle(
                    fontSize: 18,
                    color: themeprovider.secondrycolor,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
