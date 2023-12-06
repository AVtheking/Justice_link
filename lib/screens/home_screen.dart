import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF004D14), size: 30),
      ),
      endDrawer: Drawer(
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
                      child: const Icon(
                        Icons.person_2_sharp,
                        size: 50,
                        color: Colors.white,
                      ),
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
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 35,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
