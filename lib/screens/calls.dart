import 'package:flutter/material.dart';

import '../model_classes/lists.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Option.length,
        itemBuilder: (context, i) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(Option[i].image),
                    ),
                    SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Option[i].name),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(Option[i].time),
                      ],
                    ),
                    Spacer(),
                    const Icon(
                      Icons.phone,
                      size: 26,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
