import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/ex_logo.png',
                  alignment: Alignment.centerLeft,
                  height: 120,
                  width: 120,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.black,
                    ))
              ],
            ),
            const TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(97, 133, 122, 122),
                    hintText: "Search Country",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.search))),
          ])),
    );
  }
}
