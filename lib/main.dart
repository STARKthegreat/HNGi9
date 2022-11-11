import 'dart:convert';

import 'package:countriesapp/Services/remote_services.dart';
import 'package:countriesapp/model/list_model.dart';
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
  List<ListModel>? countries;
  var isLoaded = false;
  //Load data when page initializes

  @override
  void initState() {
    super.initState();

    //Fetch API without state manager
    getData();
  }

  getData() async {
    countries = await RemoteService().getCountries();
    if (countries != null) {
      setState((() {
        isLoaded = true;
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                    onPressed: () {
                      const Icon(Icons.bedtime_outlined);
                    },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.public,
                        color: Colors.black,
                      ),
                      Text('EN')
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black,
                      ),
                      Text('Filter')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isLoaded,

              // ignore: sort_child_properties_last
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: countries?.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(countries![index].flag),
                                  Text(
                                      countries![index].name.common.toString()),
                                ],
                              ),
                            ],
                          ));
                    }),
              ),
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
