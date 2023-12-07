import 'package:flutter/material.dart';
import 'package:justice_link/screens/case_status.dart';
import 'package:justice_link/widgets/drawer_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

// enum DrawerItems { caseStatus, medicalUpdates, needHelp }
class _HomeScreen extends State<HomeScreen> {
  List<String> drawerItems = [
    "Case Status",
    "Medical Updates",
    "Need Help",
    "Meetings",
    "Guidlines",
    "Fundamental Rights",
    "Reminders",
    "Contact Us"
  ];
  List<String> eServices = [
    "Case Status",
    "Medical Updates",
    "Need Help",
    "Meetings",
    "UTRC connection",
    "Document Verfication",
    "Rehabilitation Program",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF004D14), size: 30),
      ),
      endDrawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF098904),
              Color(0xFF004111),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.9],
          )),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF004D14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 12, 117, 9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // child: const Icon(
                        //   Icons.person_2_sharp,
                        //   size: 50,
                        //   color: Colors.white,
                        // ),
                        child: Image.asset("assets/images/profile.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Welcome",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => {Navigator.pop(context)},
                                child: const RotatedBox(
                                    quarterTurns: 2,
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 35,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: drawerItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return DrawerItem(
                      icon: "assets/drawer_images/$index.png",
                      text: drawerItems[index]);
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 50.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Log Out",
                        style: TextStyle(
                            color: Color(0xFF098904),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset("assets/images/logout.png")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF004D14),
                  const Color(0xFF004D14).withOpacity(0.7),
                  const Color(0xFF046200)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 0.7, 0.9],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 4,
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/1.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Tue,December 4,2023",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(77, 30),
                    ),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          // const Spacer(),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.logout,
                            color: Color(0xFF004D14),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "eServices",
                  style: TextStyle(
                      color: Color(0xFF046200),
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 1.0,
                    // width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    // crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemCount: eServices.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CaseStatus()));
                          }
                        },
                        child: Image.asset(
                          "assets/eServices_images/$index.png",
                          color: Color.fromARGB(255, 4, 78, 1),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        eServices[index],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 34, 35, 34),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      )
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Key Features",
                  style: TextStyle(
                      color: Color(0xFF046200),
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 1.0,
                    // width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 111,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: 72,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 21,
                          backgroundColor: const Color(0xFF046200),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: ClipRRect(
                              // borderRadius: BorderRadius.circular(5),

                              // borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/key_features/0.png",
                                width: 25,
                                height: 25,
                                color: Color.fromARGB(255, 4, 76, 3),

                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Guidelines",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 26, 30, 26),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // color: Colors.white,

            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
            // shadowColor: Color(0xFF000000).withOpacity(0.8),
            child: Container(
              width: double.infinity,
              height: 66,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                    spreadRadius: 1)
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/reminders.png",
                            height: 25,
                            width: 25,
                            color: Color.fromARGB(255, 4, 50, 2)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Reminders",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/feedback.png",
                          height: 25,
                          width: 25,
                          color: Color.fromARGB(255, 9, 46, 7),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Feedback",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/contact.png",
                          height: 25,
                          width: 25,
                          color: Color.fromARGB(255, 4, 78, 1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Contact Us",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Text(
            "All Rights Reserved @ 2023",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/par.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
