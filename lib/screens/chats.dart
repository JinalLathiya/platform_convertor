import 'package:flutter/material.dart';
import '../../model_classes/lists.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(Option[i].image),
                    ),
                    SizedBox(width: 30,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Option[i].name),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(Option[i].msg),
                      ],
                    ),
                    Spacer(),
                    Text(Option[i].time),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
