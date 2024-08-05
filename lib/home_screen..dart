import 'package:flutter/material.dart';
import 'package:flutter_alpha_task/components/activities_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> days = [
    {'day': 'S', 'date': '21', 'color': Colors.blue},
    {'day': 'M', 'date': '22', 'color': Colors.green},
    {'day': 'T', 'date': '23', 'color': Colors.green},
    {'day': 'W', 'date': '24', 'color': Colors.blue, 'selected': true},
    {'day': 'T', 'date': '25', 'color': Colors.grey},
    {'day': 'F', 'date': '26', 'color': Colors.grey},
    {'day': 'S', 'date': '27', 'color': Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 0, 50, 99)
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color(0xFF006BD8).withOpacity(1), // 73% opacity
                    //     Color(0xFF0054A9).withOpacity(1), // 0% opacity
                    //   ],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/user.png')),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                'Track your progress against your goals',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Color(0xff0C75DF),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: days.map((day) {
                              return _buildDayWidget(
                                day['day'],
                                day['date'],
                                day['color'],
                                day['selected'] ?? false,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ActivitiesContainer(
                              image: 'assets/shoes.png',
                              title: 'Steps',
                              desc: 'Steps',
                              count: '10k',
                              currentSliderValue: 30,
                              min: 0,
                              max: 10000,
                              sliderColor: Color(0xff53FF7B)),
                          ActivitiesContainer(
                            image: 'assets/gym.png',
                            title: 'Gym',
                            desc: 'Visits',
                            count: '5',
                            currentSliderValue: 2 / 5,
                            min: 0,
                            max: 5,
                            sliderColor: Color(0xff00BFFF),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ActivitiesContainer(
                              image: 'assets/sleep.png',
                              title: 'Sleep',
                              desc: 'Sleep Score',
                              count: '90',
                              currentSliderValue: 87,
                              min: 0,
                              max: 90,
                              sliderColor: Color(0xff00BFFF)),
                          ActivitiesContainer(
                            image: 'assets/read.png',
                            title: 'Readiness',
                            desc: 'Readiness Score',
                            count: '85',
                            currentSliderValue: 80,
                            min: 0,
                            max: 85,
                            sliderColor: Color(0xff00BFFF),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ActivitiesContainer(
                              image: 'assets/protien.png',
                              title: 'Protien',
                              desc: 'Consumed',
                              count: '180',
                              currentSliderValue: 160,
                              min: 0,
                              max: 180,
                              sliderColor: Color(0xff00BFFF)),
                          ActivitiesContainer(
                            image: 'assets/c.png',
                            title: 'Calories',
                            desc: 'Consumed ',
                            count: '21k',
                            currentSliderValue: 2100,
                            min: 0,
                            max: 2100,
                            sliderColor: Color(0xffFF6961),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayWidget(
      String day, String date, Color color, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(day,
              style: TextStyle(color: isSelected ? Colors.blue : Colors.white)),
          SizedBox(height: 4.0),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color,
                    width: isSelected ? 4.0 : 1.0,
                  ),
                  color: isSelected
                      ? Colors.blue.withOpacity(0.1)
                      : Colors.transparent,
                ),
              ),
              Text(date, style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
