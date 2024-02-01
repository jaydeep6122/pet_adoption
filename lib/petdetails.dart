import 'package:flutter/material.dart';

class petdetails extends StatefulWidget {
  final String name;
  final String type;
  final String age;
  final String location;
  final bool adopt;
  final int index;
  final String image;
  const petdetails(
      {super.key,
      required this.name,
      required this.type,
      required this.age,
      required this.location,
      required this.adopt,
      required this.index,
      required this.image});

  @override
  State<petdetails> createState() => _petdetailsState();
}

class _petdetailsState extends State<petdetails> {
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
                            onPressed: () {},
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                          style: TextStyle(
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
                  ))
            ],
          ),
          // Descripton
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                  textAlign: TextAlign.justify,
                  "Adopting a dog is a compassionate act that involves providing a loving home for a furr companion in need. It not only enriches your life with companionship but also gives a rescued dog a second chance at happiness. By adopting, you contribute to reducing the population of stray animals and supporting the well-being of these loyal and grateful pets. Embrace the joy of adoption and experience the unconditional love and loyalty that a rescued dog can bring to your lifeAdopting a dog is a compassionate act that involves providing a loving home for a furry companion in need. It not only enriches your life with companionship but also gives a rescued dog a second chance at happiness. By adopting, you contribute to reducing the population of stray animals and supporting the well-being of these loyal and grateful pets. Embrace the joy of adoption and experience the unconditional love and loyalty that a rescued dog can bring to your life."),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Adjust the radius as needed
            ),
            minWidth: 300,
            color: Colors.amber,
            onPressed: widget.adopt ? null : () {},
            child: Text("Adopt"),
          )
        ],
      ),
    );
  }
}
