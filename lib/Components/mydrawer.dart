import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.75,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xff54759E),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Tony Stark",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "+91 1111122222",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.people,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "New Groups",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Icon(
                        Icons.people_alt_outlined,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Contacts",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Calls",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Saved Messages",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Icon(
                        Icons.people,
                        color: Colors.grey,
                        size: 26,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "New Group",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
