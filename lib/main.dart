import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:search_types/model/places_model.dart';
import 'package:search_types/service/places_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  List<PlacesModel> placesCopy = [];
  List<PlacesModel> resultOfSearch = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PlacesService().getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            placesCopy = snapshot.data!;
            resultOfSearch = snapshot.data!;
            log("---------------outside statefull builder---------------");
            return StatefulBuilder(builder: (context, setstate) {
              log("---------------------inside statfull builder-----------------");
              return Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      resultOfSearch = [];
                      if (value.isNotEmpty || value != "") {
                        print(value);
                        placesCopy.forEach(
                          (element) {
                            if (element.name.contains(value)) {
                              resultOfSearch.add(element);
                            }
                          },
                        );
                      } else {
                        resultOfSearch = snapshot.data!;
                      }
                      print(resultOfSearch);
                      print(resultOfSearch.length);
                      setstate(() {});
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: resultOfSearch.length,
                        itemBuilder: (context, index) {
                          print(resultOfSearch[index].hashCode);
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        placesModel: resultOfSearch[index],
                                      ),
                                    ));
                              },
                              title: Text(resultOfSearch[index].name),
                              leading: Hero(
                                  tag: resultOfSearch[index],
                                  child: Image.network(
                                      resultOfSearch[index].image)),
                              subtitle: Text(resultOfSearch[index].population),
                            ),
                          );
                        }),
                  )
                ],
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class SearchPageWithServer extends StatelessWidget {
  SearchPageWithServer({super.key});
  String lexem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(builder: (context, setstate) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                lexem = value;
                setstate(() {});
              },
            ),
            FutureBuilder(
              future: PlacesService().search(lexem: lexem),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Image.network(snapshot.data![index].image),
                        subtitle: Text(snapshot.data![index].population),
                        title: Text(snapshot.data![index].name),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        );
      }),
    );
  }
}

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.placesModel});

  PlacesModel placesModel;

  @override
  Widget build(BuildContext context) {
    print(placesModel.hashCode);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(tag: placesModel, child: Image.network(placesModel.image)),
          ListTile(
            title: Text(placesModel.name),
            subtitle: Text(placesModel.population),
          )
        ],
      ),
    );
  }
}
