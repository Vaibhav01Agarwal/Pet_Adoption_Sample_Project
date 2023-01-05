import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:pet_adoption/Pages/details_page.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/screens/screen1.dart';
import 'package:pet_adoption/screens/screen2.dart';
import 'package:pet_adoption/screens/screen3.dart';
import 'package:pet_adoption/screens/screen4.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'Persian',
    'Siamese',
    'Siberian',
    'Burmese',
    'Somali',
  ];
  String? selectedValue;
  bool themeMode = true;

  final TextEditingController petEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(""),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              themeMode == false
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          themeMode = true;
                          Get.changeTheme(ThemeData.light());
                        });
                      },
                      icon: const Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                      ))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          themeMode = false;
                          Get.changeTheme(ThemeData.dark());
                        });
                      },
                      icon: const Icon(
                        Icons.light_mode,
                        color: Colors.black,
                      )),
            ],
          ),
          //backgroundColor: Colors.brown[100],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Pet",
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  width: 400,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton2(
                        hint: const Text("Select Pet"),
                        items: items
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item.toString())))
                            .toList(),
                        value: selectedValue,
                        dropdownMaxHeight: 200,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        searchInnerWidget: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 4, right: 8, left: 8),
                          child: TextField(
                            controller: petEditingController,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                hintText: 'Search for pet....',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onChanged: (items) {
                              //items.toString() = value;
                            },
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return (items
                              .toString()
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()));
                        },
                        onMenuStateChange: (isBlank) {
                          if (!isBlank) {
                            petEditingController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ),

                // First Pet

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailsPage()));
                  },
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.blueGrey[300],
                                  borderRadius: BorderRadius.circular(20),
                                  //boxShadow: shadowList,
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Align(
                                child: Image.asset(
                                  'assets/images/persian.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              // ignore: sort_child_properties_last
                              child: Center(
                                  child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Persian',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Icon(
                                        Icons.male,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Persian Cat',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('2 years old',
                                      style: TextStyle(fontSize: 20)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Row(children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.add_location_alt),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text('Distance:2.0 km',
                                        style: TextStyle(fontSize: 14))
                                  ])
                                ],
                              )),
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 40),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  //boxShadow: shadowList,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),

                // Second Pet
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen1()));
                  },
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Align(
                                child: Hero(
                                    tag: 1,
                                    child: Image.asset(
                                      'assets/images/siamese2.jpeg',
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              // ignore: sort_child_properties_last
                              child: Center(
                                  child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Siamese',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.male,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Siamese Cat',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('1 years old',
                                      style: TextStyle(fontSize: 20)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Row(children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.add_location_alt),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text('Distance:5.0 km',
                                        style: TextStyle(fontSize: 14))
                                  ])
                                ],
                              )),
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 40),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),

                // Third Container
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen2()));
                  },
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  //  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Align(
                                child: Image.asset(
                                  'assets/images/siberian2.jpeg',
                                  width: 700,
                                  height: 250,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              // ignore: sort_child_properties_last
                              child: Center(
                                  child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Siberian',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.male,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Siberian Cat',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('4 years old',
                                      style: TextStyle(fontSize: 20)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Row(children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.add_location_alt),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text('Distance:8.0 km',
                                        style: TextStyle(fontSize: 14))
                                  ])
                                ],
                              )),
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 40),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),

                // Fourth Container

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen3()));
                  },
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  //  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Align(
                                child: Image.asset(
                                  'assets/images/burmese.jpeg',
                                  width: 700,
                                  height: 250,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              // ignore: sort_child_properties_last
                              child: Center(
                                  child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Burmese',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.male,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Burmese Cat',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('1 years old',
                                      style: TextStyle(fontSize: 20)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Row(children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.add_location_alt),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text('Distance:2.0 km',
                                        style: TextStyle(fontSize: 14))
                                  ])
                                ],
                              )),
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 40),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),

                // Fifth Container
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen4()));
                  },
                  child: Container(
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  //   color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                              ),
                              Align(
                                child: Image.asset(
                                  'assets/images/somali.jpeg',
                                  width: 700,
                                  height: 250,
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                              // ignore: sort_child_properties_last
                              child: Center(
                                  child: Column(
                                children: [
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Somali',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Icon(
                                        Icons.male,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Somali Cat',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text('3 years old',
                                      style: TextStyle(fontSize: 20)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Row(children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.add_location_alt),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text('Distance:8.0 km',
                                        style: TextStyle(fontSize: 14))
                                  ])
                                ],
                              )),
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 40),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
