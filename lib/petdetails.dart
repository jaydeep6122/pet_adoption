import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adoption/Home.dart';

import 'package:pet_adoption/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class petdetails extends StatefulWidget {
  final String name;
  final String type;
  final String age;
  final String location;
  final bool adopt;
  final int index;
  final String image;
  final int price;
  const petdetails(
      {super.key,
      required this.name,
      required this.type,
      required this.age,
      required this.location,
      required this.adopt,
      required this.index,
      required this.image,
      required this.price});

  @override
  State<petdetails> createState() => _petdetailsState();
}

class _petdetailsState extends State<petdetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCounter();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.index,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.05),
                  height: MediaQuery.sizeOf(context).height * 0.55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("${widget.image}"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back, size: 30),
                            color: Colors.white,
                          ),
                          const Spacer(),
                          IconButton(
                            hoverColor: Colors.red,
                            onPressed: () {},
                            icon: const Icon(Icons.share, size: 30),
                            color: Colors.white,
                          ),
                        ],
                      ),
                      //
                    ],
                  ),
                ),
              ),
              // White box over image
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8,
                          offset: Offset(0, 5),
                        )
                      ]),
                  margin: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.06,
                    right: MediaQuery.sizeOf(context).width * 0.06,
                    top: MediaQuery.sizeOf(context).height * 0.5,
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.17,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.sizeOf(context).height * 0.01,
                        horizontal: MediaQuery.sizeOf(context).width * 0.04),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.name}",
                              style: const TextStyle(
                                  fontSize: 33, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${widget.type}",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Text(
                              "Age :- ${widget.age}",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 17,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  "${widget.location}",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Rs ${widget.price}",
                          style: TextStyle(color: Colors.teal, fontSize: 25),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          // Descripton
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                  textAlign: TextAlign.justify,
                  "Adopting a dog is a compassionate act that involves providing a loving home for a furr companion in need. It not only enriches your life with companionship but also gives a rescued dog a second chance at happiness. By adopting, you contribute to reducing the population of stray animals and supporting the well-being of these loyal and grateful pets. Embrace the joy of adoption and experience the unconditional love and loyalty that a rescued dog can bring to your lifeAdopting a dog is a compassionate act that involves providing a loving home for a furry companion in need. It not only enriches your life with companionship but also gives a rescued dog a second chance at happiness. By adopting, you contribute to reducing the population of stray animals and supporting the well-being of these loyal and grateful pets. Embrace the joy of adoption and experience the unconditional love and loyalty that a rescued dog can bring to your life."),
            ),
          ),
          Consumer<petProvider>(
            builder: (BuildContext context, petProvider value, Widget? child) {
              return MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                ),
                minWidth: 300,
                color: Colors.amber,
                onPressed: widget.adopt
                    ? null
                    : () async {
                        await updateLocalJsonFile(1);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Adoption Successful'),
                              content:
                                  Text('You’ve now adopted ${widget.name}'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    );
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                child: const Text("Adopt"),
              );
            },
          )
        ],
      ),
    );
  }
}

Future<void> updateLocalJsonFile(int petId) async {
  try {
    // Read the existing JSON file
    File file = File('assets/db/db.json');
    String content = await rootBundle.loadString('assets/db/db.json');
    Map<String, dynamic> jsonData = json.decode(content);

    // Assuming your JSON structure is something like {"pets": [...]}, adjust accordingly
    List<dynamic> petsList = jsonData['pets'];

    // Find the pet with the specified ID and update its 'adopt' status
    for (int i = 0; i < petsList.length; i++) {
      if (petsList[i]['id'] == petId) {
        petsList[i]['adopt'] = true;
        break; // Stop searching once the pet is found
      }
    }
    await file.writeAsString(json.encode(jsonData));
    // Write back the updated data to the JSON file

    print("Local JSON file updated successfully!");
  } catch (error) {
    print("Error updating local JSON file: $error");
  }
}

Future<String> readCounter() async {
  try {
    String jsonString = await rootBundle.loadString('assets/db/db.json');
    return jsonString;
  } catch (e) {
    return "";
  }
}
