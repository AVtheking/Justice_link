import 'package:flutter/material.dart';
import 'package:justice_link/common/app_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RehabilationScreen extends StatefulWidget {
  const RehabilationScreen({super.key});

  @override
  State<RehabilationScreen> createState() => _RehabilationScreenState();
}

class _RehabilationScreenState extends State<RehabilationScreen> {
  double percent = 0.75; // Set the initial value of the percent variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfun('Rehabilation Programs'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 8),
                width: 329,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 14.0,
                            top: 8,
                          ),
                          child: Image.asset(
                            "assets/images/Group.png",
                            height: 60,
                            width: 60,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Manoj Kumar",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff046200)),
                              ),
                              Text(
                                'Ward No. : 420',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Recommended Doctor: \n Dr.KK Menon',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Row(
                        children: [
                          const Text(
                            "Progress Bar:",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff046200),
                            ),
                          ),
                          LinearPercentIndicator(
                            barRadius: const Radius.circular(10),
                            width: 189.0,
                            lineHeight: 8.0,
                            percent: percent,
                            backgroundColor: const Color(0xff000000),
                            progressColor: const Color(0xff004D14),
                          ),
                          Text(
                            '${(percent * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 329,
                height: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularPercentIndicator(
                            // ignore: use_full_hex_values_for_flutter_colors
                            backgroundColor: const Color(0xff0000000),
                            lineWidth: 12,
                            percent: .65,
                            progressColor: const Color(0xff046200),
                            radius: 60,
                            center: const Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '12/',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(children: [
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          '12',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                                Text(
                                  '  Courses\nCompleted',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 4, right: 4),
                            child: Column(children: [
                              Image.asset(
                                'assets/images/winner.png',
                                width: 70,
                                height: 70,
                              ),
                              // const Spacer(),
                              const Text(
                                'Targets achieved : 3',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                // ignore: use_full_hex_values_for_flutter_colors
                                backgroundColor: const Color(0xff0000000),
                                lineWidth: 12,
                                percent: .65,
                                progressColor: const Color(0xff046200),
                                radius: 40,
                                center: Column(
                                  children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Image.asset('assets/images/bp.png'),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '12/',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '12',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text('Blood Pressure')
                            ],
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                // ignore: use_full_hex_values_for_flutter_colors
                                backgroundColor: const Color(0xff0000000),
                                lineWidth: 12,
                                percent: .65,
                                progressColor: const Color(0xff046200),
                                radius: 40,
                                center: Column(
                                  children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Image.asset('assets/images/oxygen 1.png'),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '12/',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '12',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text('Blood O2')
                            ],
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                // ignore: use_full_hex_values_for_flutter_colors
                                backgroundColor: const Color(0xff0000000),
                                lineWidth: 12,
                                percent: .65,
                                progressColor: const Color(0xff046200),
                                radius: 40,
                                center: Column(
                                  children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Image.asset('assets/images/tension 1.png'),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '12/',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '12',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text('Stress Level')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Vocational Courses:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 8),
                width: 329,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset(
                  'assets/images/rehab.png',
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 249,
                height: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff046200),
                      Color(0xff098904),
                    ],
                  ),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Appoint a Psychiatrist !",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
