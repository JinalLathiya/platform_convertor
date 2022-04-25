import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/user_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
          child: GestureDetector(
            onTap: () {
              (isIOS)
                  ? showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return myBottomSheet(i);
                      })
                  : showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return myBottomSheet(i);
                      });
            },
            child: Row(
              children: [
                const CircleAvatar(radius: 35),
                SizedBox(width: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(users[i].name),
                    Text(users[i].message),
                  ],
                ),
                Spacer(),
                Text(users[i].time),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myBottomSheet(int i) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50),
          Text(users[i].name),
          Text("+91 7777777777"),
          const SizedBox(height: 15),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                child: Text("Send Message"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff54759E),
                ),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                child: Text("Cancel"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff54759E),
                ),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
