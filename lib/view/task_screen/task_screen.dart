import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/task_screen_controller/task_screen_controller.dart';
import 'package:cadmus/view/task_screen/task_add.dart';
import 'package:cadmus/view/task_screen/task_decsription.dart';
import 'package:cadmus/widgets/taskcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    Provider.of<TaskScreenController>(context, listen: false).fetchtasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    var taskprovider = Provider.of<TaskScreenController>(context);
    return Scaffold(
      backgroundColor: themeprovider.primarycolor,
      body: ListView.builder(
        itemCount: taskprovider.task.length,
        itemBuilder: (context, index) => taskprovider.task[index].status == true
            ? SizedBox()
            : InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDescription(
                        index: index,
                      ),
                    )),
                child: TaskContainer(
                    title: '${taskprovider.task[index].title} $index',
                    content: taskprovider.task[index].description,
                    createddate:
                        taskprovider.task[index].createdTime.toString(),
                    dueddate: taskprovider.task[index].remindedDate.toString(),
                    status: taskprovider.task[index].status,
                    taskid: taskprovider.task[index].id),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primarygreen,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskAdd(),
              ));
          // Provider.of<TaskScreenController>(context, listen: false).addtasks();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
