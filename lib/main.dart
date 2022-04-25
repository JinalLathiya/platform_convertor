import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_convertor_app/screens/settings.dart';

import '../model_classes/lists.dart';
import 'Components/mydrawer.dart';
import 'screens/calls.dart';
import 'screens/chats.dart';

void main() {
  runApp(const MyApp());
}

int _currentStep = 0;
int index = 0;
bool isSwitch = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return (isSwitch == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: DefaultTabController(
              initialIndex: index,
              length: 3,
              child: Scaffold(
                drawer: const Mydrawer(),
                floatingActionButton: Builder(builder: (context) {
                  return FloatingActionButton(
                    child: const Icon(Icons.add),
                    backgroundColor: const Color(0xff54759E),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.48,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Stepper(
                              currentStep: _currentStep,
                              onStepTapped: (val) {
                                setState(() {
                                  _currentStep = val;
                                });
                              },
                              controlsBuilder: (context, details) {
                                return Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xff54759E),
                                      ),
                                      child: (_currentStep == 2)
                                          ? const Text("ADD")
                                          : const Text("CONTINUE"),
                                      onPressed: () {
                                        setState(() {
                                          if (_currentStep < 2) {
                                            _currentStep++;
                                          }
                                        });
                                      },
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.grey,
                                      ),
                                      child: const Text("CANCEL"),
                                      onPressed: () {
                                        setState(() {
                                          if (_currentStep > 0) {
                                            _currentStep--;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                              steps: <Step>[
                                Step(
                                  isActive: (_currentStep >= 0) ? true : false,
                                  title: const Text("PROFILE PHOTO"),
                                  subtitle: const Text("Add Profile Photo"),
                                  content: Container(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        const CircleAvatar(radius: 45),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            color: Colors.blue,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Step(
                                  isActive: (_currentStep >= 1) ? true : false,
                                  title: const Text("Name"),
                                  subtitle: const Text("Enter Name"),
                                  content: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter your name",
                                    ),
                                  ),
                                ),
                                Step(
                                  isActive: (_currentStep >= 2) ? true : false,
                                  title: const Text("Description"),
                                  subtitle: const Text("Enter Description"),
                                  content: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter description",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
                appBar: AppBar(
                  title: const Text("Platform Convertor"),
                  actions: [
                    Switch(
                      value: isSwitch,
                      onChanged: (val) {
                        setState(() {
                          isSwitch = val;
                        });
                      },
                    ),
                  ],
                  bottom: TabBar(
                    onTap: (val) {
                      pageController.animateToPage(
                        val,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                      setState(() {
                        index = val;
                      });
                    },
                    controller: tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                    tabs: myTabs.map((e) => Tab(text: e)).toList(),
                  ),
                  backgroundColor: const Color(0xff54759E),
                ),
                body: PageView(
                  controller: pageController,
                  onPageChanged: (val) {
                    tabController.animateTo(val);
                    setState(() {
                      index = val;
                    });
                  },
                  children: const [
                    ChatsPage(),
                    CallsPage(),
                    Settingspage(),
                  ],
                ),
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Builder(builder: (context) {
                  return CupertinoButton(
                    child: const Icon(Icons.menu),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return Row(
                            children: [
                              const Expanded(
                                flex: 7,
                                child: Mydrawer(),
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }),
                middle: const Text("Platform Convertor"),
                trailing: CupertinoSwitch(
                  value: isSwitch,
                  onChanged: (val) {
                    setState(() {
                      isSwitch = val;
                    });
                  },
                ),
              ),
              child: Stack(
                children: [
                  IndexedStack(
                    index: index,
                    children: const [
                      ChatsPage(),
                      CallsPage(),
                      Settingspage(),
                    ],
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      CupertinoTabBar(
                        currentIndex: index,
                        onTap: (val) {
                          setState(() {
                            index = val;
                          });
                        },
                        backgroundColor:
                            CupertinoColors.opaqueSeparator.withOpacity(0.5),
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                            label: "CHATS",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.phone_fill),
                            label: "CALLS",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(CupertinoIcons.settings),
                            label: "SETTINGS",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
