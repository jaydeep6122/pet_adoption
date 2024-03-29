import 'package:flutter/material.dart';
import 'package:pet_adoption/history.dart';
import 'package:pet_adoption/petdetails.dart';
import 'package:pet_adoption/provider/pet_provider.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<petProvider>(context, listen: false).getAllpets("");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // App bar
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Leading Menu icon
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          size: 35,
                        )),
                    //Search Bar
                    Consumer<petProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.grey[200],
                          ),
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Center(
                            child: TextField(
                              onChanged: (valuee) {
                                value.getAllpets(
                                    valuee.toLowerCase().toString());
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search by name ",
                                hintStyle: const TextStyle(fontSize: 13),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.sizeOf(context).height *
                                            0.009),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // History Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const historypage(),
                            ));
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.history),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              // Catagory Container
              Container(
                height: MediaQuery.sizeOf(context).height * 0.13,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Consumer<petProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.getAllpets("");
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.09,
                                      decoration: BoxDecoration(
                                          color: Colors.amber[500],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      child: const Image(
                                        image: AssetImage("assets/all.png"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Text("All")
                            ],
                          ),
                          Column(
                            children: [
                              Consumer<petProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.getAllDogs();
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.09,
                                      decoration: BoxDecoration(
                                          color: Colors.amber[500],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      child: const Image(
                                        image: AssetImage("assets/dog.png"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Text("Dog")
                            ],
                          ),
                          Column(
                            children: [
                              Consumer<petProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.getAllcat();
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.09,
                                      decoration: BoxDecoration(
                                          color: Colors.amber[500],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      child: const Image(
                                        image: AssetImage("assets/cat.png"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Text("Cat")
                            ],
                          ),
                          Column(
                            children: [
                              Consumer<petProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.getAllparrot();
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.09,
                                      decoration: BoxDecoration(
                                          color: Colors.amber[500],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      child: const Image(
                                        image: AssetImage("assets/parrot.png"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Text("parrot")
                            ],
                          ),
                          Column(
                            children: [
                              Consumer<petProvider>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.getAllturtle();
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.09,
                                      decoration: BoxDecoration(
                                          color: Colors.amber[500],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      child: const Image(
                                        image: AssetImage("assets/tourtle.png"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Text("turtle")
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Main body pet list
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<petProvider>(
                    builder: (BuildContext context, value, child) {
                      return GridView.builder(
                        itemCount: value.pets.length,
                        itemBuilder: (context, index) {
                          bool isLastColumn = (index + 1) % 2 == 0;
                          return Hero(
                            tag: index,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => petdetails(
                                            name: value.pets[index].name,
                                            type: value.pets[index].type,
                                            age: value.pets[index].age,
                                            location:
                                                value.pets[index].location,
                                            adopt: value.pets[index].adopt,
                                            index: index,
                                            image: value.pets[index].photourl,
                                            price: value.pets[index].price)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    )
                                  ],
                                  // Image of pet
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          value.pets[index].photourl),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20),
                                  //color: Colors.red,
                                ),
                                margin: isLastColumn
                                    ? EdgeInsets.only(
                                        top: MediaQuery.sizeOf(context).height *
                                            0.03)
                                    : EdgeInsets.only(
                                        bottom:
                                            MediaQuery.sizeOf(context).height *
                                                0.03),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.sizeOf(context).width *
                                          0.03),
                                  // Text on pet image
                                  child: value.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  value.pets[index].name,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                if (value.pets[index].adopt)
                                                  Icon(Icons.check_circle,
                                                      color: Colors.green)
                                              ],
                                            ),
                                            Text(
                                              value.pets[index].type,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Age : ${value.pets[index].age}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.7,
                          //mainAxisExtent: 1
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
