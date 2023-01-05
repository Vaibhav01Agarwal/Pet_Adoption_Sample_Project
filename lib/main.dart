import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_adoption/Pages/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    splashscreen();
    super.initState();
  }

  Duration splashDuration = const Duration(seconds: 1);

  splashscreen() async {
    Timer(
        splashDuration,
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        body: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset("assets/images/Puppy.jpeg", height: 400, width: 400),
            const Text(
              "You and your dog make the cutest duo.",
              style: TextStyle(fontSize: 20, color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
