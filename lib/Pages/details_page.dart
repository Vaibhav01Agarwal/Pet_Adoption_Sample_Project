import 'package:flutter/material.dart';
import 'package:pet_adoption/Pages/history_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details screen")),
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blueGrey[300],
                ),
              ),
              Expanded(
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          'Persian Cat',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'The Persian cat is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the Persian Longhair in English-speaking countries. The first documented ancestors of Persian cats were imported into Italy from Persia around 1620.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  color: Colors.lightGreen[100],
                ),
              )
            ],
          )),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                  tag: 1,
                  child: Image.asset(
                    'assets/images/persian.jpeg',
                    width: 300,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(

                // ignore: sort_child_properties_last
                child: Center(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Persian',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("2000Rs", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    const Text(
                      'Persian Cat',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    const Text('2 years old', style: TextStyle(fontSize: 20)),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.add_location_alt),
                          const Text('Distance:2.0 km',
                              style: TextStyle(fontSize: 14))
                        ])
                  ],
                )),
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color:
                        Colors.white, // Stack box color(Small box on screen).
                    borderRadius: BorderRadius.circular(20))),
          ),
          Align(
            // Box of heart icon and adoption title
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              // ignore: sort_child_properties_last
              child: FloatingActionButton(
                //tooltip: const Text("Adopt Me"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ),
                  );
                },
                hoverColor: Colors.blue,
                backgroundColor: Colors.brown[100],
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
