import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/task_screen_controller/task_screen_controller.dart';
import 'package:cadmus/widgets/taskcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<DarkthemeCpntroller>(context);
    var taskprovider = Provider.of<TaskScreenController>(context);
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
      ),
      body: ListView.builder(
        itemCount: taskprovider.task.length,
        itemBuilder: (context, index) => taskprovider.task[index].status ==
                false
            ? const SizedBox()
            : TaskContainer(
                title: '${taskprovider.task[index].title} $index',
                content: taskprovider.task[index].description,
                createddate: taskprovider.task[index].createdTime.toString(),
                dueddate: taskprovider.task[index].remindedDate.toString(),
                status: taskprovider.task[index].status,
                taskid: taskprovider.task[index].id,
              ),
      ),
    );
  }
}
