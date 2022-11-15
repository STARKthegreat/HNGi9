import 'package:countriesapp/Services/remote_services.dart';
import 'package:countriesapp/model/list_model.dart';
import 'package:flutter/material.dart';

//import 'package:countriesapp/country_details.dart'
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
      theme: ThemeData(primarySwatch: Colors.lightBlue),
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
      setState(() {
        isLoaded = true;
      });
    }
  }

  void updateList(String value) {
    //this is the function that will search through our list
    setState(() {});
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
            TextField(
              onChanged: (value) => updateList(value),
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(97, 133, 122, 122),
                  hintText: "Search Country",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              ListTile(
                                title: const Text('Language'),
                                trailing: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close)),
                              ),
                              ListTile(
                                title: const Text('English'),
                                trailing: IconButton(
                                    onPressed: () {
                                      //Icon(Icons.radio_button_checked);
                                    },
                                    icon: const Icon(Icons.radio_button_off)),
                              )
                            ],
                          );
                        });
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.language,
                        color: Colors.black,
                      ),
                      Text(
                        'EN',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            children: [
                              ListTile(
                                title: const Text('Filter'),
                                trailing: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close)),
                              ),
                              ListTile(
                                  title: const Text('Continent'),
                                  trailing: DropdownButton(
                                    onChanged: (value) {},
                                    items: const [],
                                  ))
                            ],
                          );
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: Expanded(
                    child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: countries.toString().length,
                      itemBuilder: (context, index) {
                        return _listItem(index);
                      }),
                )))
          ],
        ),
      ),
    );
  }

  _listItem(index) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image(
              image: NetworkImage(countries![index].flags!.png!),
              height: 50,
              width: 50,
            ),
          ),
          title: Text(countries![index].name!.official.toString()),
          subtitle: Text(countries![index].capital.toString()),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(countries![index].name!.common.toString()),
                  centerTitle: true,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Expanded(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        countries![index].flags!.png!),
                                    alignment: Alignment.topCenter,
                                  ),
                                  Image(
                                    image: NetworkImage(
                                        countries![index].coatOfArms!.png!),
                                    alignment: Alignment.topCenter,
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Population:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].population.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Region:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].subregion.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Capital',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].capital.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Official Language:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].languages.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Independent:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].independent.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Area:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].area.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Currency:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].currencies.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Timezones:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].languages.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Date fomart:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].languages.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Dialing code:',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].languages.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Driving side:',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(countries![index].languages.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }));
          },
        ),
      ],
    ));
  }
}
