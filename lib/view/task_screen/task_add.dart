import 'package:cadmus/constants/colorconstant.dart';
import 'package:cadmus/controller/darktheme_controller/darktheme_controller.dart';
import 'package:cadmus/controller/task_screen_controller/task_screen_controller.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TaskAdd extends StatefulWidget {
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  // DateTime _selectedDateTime = DateTime.now();
  DateTime? selectedDateTime;
  var formattedDateTime;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "set reminder on.",
              style: TextStyle(
                  color: themeprovider.secondrycolor,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => selectedDateTime == null
                      ? themeprovider.secondrycolor.withOpacity(0.5)
                      : ColorConstant.primarygreen,
                ),
              ),
              onPressed: () {
                picker.DatePicker.showDateTimePicker(
                  theme: picker.DatePickerTheme(
                      headerColor: ColorConstant.secondrygreen,
                      backgroundColor: ColorConstant.primarygreen,
                      itemStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      cancelStyle: TextStyle(
                          color: ColorConstant.primarygreen,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      doneStyle: TextStyle(
                          color: ColorConstant.primarygreen,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  context,
                  currentTime: selectedDateTime,
                  onConfirm: (dateTime) {
                    setState(() {
                      selectedDateTime = dateTime;
                      formattedDateTime =
                          convertToDesiredFormat(selectedDateTime.toString());
                      print(formattedDateTime);
                    });
                  },
                );
              },
              child: Text(
                selectedDateTime == null
                    ? "select time "
                    : '${selectedDateTime.toString()}',
                style: TextStyle(
                    color: themeprovider.secondrycolor,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),

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
                      color: themeprovider.secondrycolor,
                      fontSize: 25,
                      fontStyle: FontStyle.italic),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(
                          color: themeprovider.secondrycolor.withOpacity(0.5),
                          fontSize: 25,
                          fontStyle: FontStyle.italic)),
                ),
              )),

          // content
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.grey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  maxLines: 10,
                  controller: contentcontroller,
                  style: TextStyle(
                      color: themeprovider.secondrycolor,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "content",
                      hintStyle: TextStyle(
                          color: themeprovider.secondrycolor.withOpacity(0.5),
                          fontSize: 18,
                          fontStyle: FontStyle.italic)),
                ),
              )),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Provider.of<TaskScreenController>(context, listen: false).addtasks(
              title: titlecontroller.text,
              description: contentcontroller.text,
              date: formattedDateTime);
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.primarygreen),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              " Save ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: themeprovider.secondrycolor),
            ),
          ),
        ),
      ),
    );
  }

  String convertToDesiredFormat(String inputDateTimeString) {
    // Parse input string into DateTime object
    DateTime inputDateTime = DateTime.parse(inputDateTimeString);

    // Format the DateTime object into the desired format
    String formattedDateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(inputDateTime);

    return formattedDateTime;
  }
}
