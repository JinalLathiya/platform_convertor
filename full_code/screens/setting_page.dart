import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextStyle myTextStyle =
      const TextStyle(color: Color(0xff54759E), fontSize: 20);

  DateTime _currentDate = DateTime.now();
  TimeOfDay _currentTime = TimeOfDay.now();

  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  String? date;
  String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 22, right: 22, top: (isIOS) ? 120 : 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: myTextStyle,
              ),
              Text(
                "$date",
                style: myTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                child: const Text("Change Date"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff54759E),
                ),
                onPressed: () async {
                  (isIOS == false)
                      ? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _currentDate,
                          firstDate: DateTime(1999),
                          lastDate: DateTime(2025),
                          selectableDayPredicate: (DateTime day) {
                            return (day.isBefore(DateTime.now()
                                        .add(const Duration(days: 10))) &&
                                    day.isAfter(DateTime.now()
                                        .subtract(const Duration(days: 1))))
                                ? true
                                : false;
                          })
                      : await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: _currentDate,
                                maximumYear: 2030,
                                minimumYear: 1990,
                                onDateTimeChanged: (val) {
                                  setState(() {
                                    _currentDate = val;
                                  });
                                  print(_currentDate);
                                },
                              ),
                            );
                          });

                  setState(() {
                    date = (isIOS)
                        ? DateFormat("d, MMMM y").format(_currentDate)
                        : DateFormat("d, MMMM y").format(pickedDate!);
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: myTextStyle,
              ),
              Text(
                "$time",
                style: myTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                child: const Text("Change Time"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff54759E),
                ),
                onPressed: () async {
                  (isIOS == false)
                      ? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: _currentTime,
                          confirmText: "Confirm",
                          cancelText: "Dismiss",
                          helpText: "Choose your desired time",
                          initialEntryMode: TimePickerEntryMode.dial,
                          errorInvalidText: "Enter proper time",
                        )
                      : await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              color: Colors.white,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: _currentDate,
                                maximumYear: 2030,
                                minimumYear: 1990,
                                onDateTimeChanged: (val) {
                                  setState(() {
                                    _currentDate = val;
                                  });
                                },
                              ),
                            );
                          });

                  (isIOS)
                      ? setState(() {
                          time = (_currentDate.hour > 12)
                              ? "${_currentDate.hour - 12}:${_currentDate.minute}:${DateTime.now().second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}"
                              : "${_currentDate.hour}:${_currentDate.minute}:${DateTime.now().second} ${(_currentDate.hour > 12) ? 'PM' : 'AM'}";
                        })
                      : setState(() {
                          time = (pickedTime!.periodOffset == 12)
                              ? "${pickedTime!.hour - 12}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}"
                              : "${pickedTime!.hour}:${pickedTime!.minute}:${DateTime.now().second} ${pickedTime!.period.name}";
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
