import 'package:flutter/material.dart';
import '../main.dart';
import '../models/user_model.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  List users = <User>[
    User(
      id: 1,
      name: "Tony Stark Lokhand Wala",
      message: "Flutter is Great",
      time: "12:28 pm",
    ),
    User(
      id: 2,
      name: "Senapati",
      message: "Mai gareeb hu",
      time: "1:25 am",
    ),
    User(
      id: 3,
      name: "Thor Hathoda Walo",
      message: "Done",
      time: "4:23 pm",
    ),
    User(
      id: 4,
      name: "Thanos Chapti Walo",
      message: "Ready for fight?",
      time: "12:28 pm",
    ),
    User(
      id: 5,
      name: "Hulk Gabhru Jawan",
      message: "I throwed my phone...",
      time: "12:28 pm",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 12, right: 12, top: (isIOS) ? 120 : 10),
      itemCount: users.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              const CircleAvatar(radius: 35),
              SizedBox(width: 25),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(users[i].name),
                  Text(users[i].time),
                ],
              ),
              Spacer(),
              const Icon(
                Icons.phone,
                color: Colors.green,
              ),
            ],
          ),
        );
      },
    );
  }
}
