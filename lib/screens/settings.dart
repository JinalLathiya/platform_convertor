import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  TextStyle myStyle = const TextStyle(
    fontSize: 18,
    color: Color(0xff54759E),
  );

  DateTime _currentDate = DateTime.now();
  TimeOfDay _currentTime = TimeOfDay.now();

  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  String? date;
  String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 20, right: 20, top: (isSwitch) ? 120 : 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: myStyle,
              ),
              Text(
                "$date",
                style: myStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width - 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff54759E),
                ),
                child: const Text("Change Date"),
                onPressed: () async {

                  (isSwitch == false) ?
                  pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2030),
                    confirmText: "Confirm",
                    cancelText: "Dismiss",
                    errorInvalidText: "Enter Valid Date",
                    // selectableDayPredicate: (DateTime day) {
                    //   return (day.isBefore(DateTime.now()
                    //       .add(const Duration(days: 10))) &&
                    //       day.isAfter(DateTime.now()
                    //           .subtract(const Duration(days: 1))))
                    //       ? true
                    //       : false;
                    // },
                  ) :
               await showCupertinoModalPopup(context: context, builder: (context){
                    return Container(
                      height: 250,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        initialDateTime: _currentDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (val){
                       setState(() {
                         _currentDate = val;
                       });
                      }),
                    );
                  });
                  setState(() {
                    (isSwitch == false) ?
                    date = DateFormat("d, MMMM y").format(pickedDate!)
                    : date = DateFormat("d, MMMM y").format(_currentDate);
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: myStyle,
              ),
              Text(
                "$time",
                style: myStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width - 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff54759E),
                ),
                child: const Text("Change Time"),
                onPressed: () async {
                  // pickedTime = await showTimePicker(
                  //   context: context,
                  //   initialTime: _currentTime,
                  //   confirmText: "Confirm",
                  //   cancelText: "Dismiss",
                  //   errorInvalidText: "Enter Valid time",
                  // );
                  await showCupertinoModalPopup(context: context, builder: (context){
                    return Container(
                      height: 250,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                          initialDateTime: _currentDate,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (val){
                            setState(() {
                              _currentDate = val;
                            });
                          }),
                    );
                  });
                  setState(() {
                    // time =  "${(pickedTime?.periodOffset == 12) ? (pickedTime!.hour == 12) ?pickedTime!.hour :pickedTime!.hour - 12 : (pickedTime!.hour == 0)? 12 : pickedTime!.hour }:${pickedTime!.minute}:${DateTime.now().second} ${(pickedTime!.period.name)}";
                    time = "${_currentDate.hour}:${_currentDate.minute}:${_currentDate.second} ${(_currentDate.hour > 12) ? "AM": "PM"}";
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
