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
  RemoteService _remoteService = RemoteService();
  // @override
  //void initState() {
  // super.initState();

  //Fetch API without state manager
  //getData();
  //}

  Future<void> getData() async {
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
                  prefixIcon: Icon(Icons.search)),
              onChanged: null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.language,
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
                  child: FutureBuilder<List<ListModel>?>(
                future: _remoteService.getCountries(),
                builder: ((context, snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: countries.toString().length,
                      itemBuilder: (context, index) {
                        return _listItem(index);
                      });
                }),
              )),

              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
            )
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
              image: NetworkImage(countries![index].flags!.png),
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
                                        countries![index].flags!.png),
                                    alignment: Alignment.topCenter,
                                  ),
                                  Image(
                                    image: NetworkImage(
                                        countries![index].coatOfArms!.png),
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
                          'Region',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(countries![index].region.toString()),
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
                          'Independence:',
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
