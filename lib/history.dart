import 'package:flutter/material.dart';
import 'package:pet_adoption/petdetails.dart';
import 'package:pet_adoption/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class historypage extends StatefulWidget {
  const historypage({super.key});

  @override
  State<historypage> createState() => _historypageState();
}

class _historypageState extends State<historypage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<petProvider>(context, listen: false).getAlladopted();
    });
  }

  Future<void> _refresh() async {
    await Provider.of<petProvider>(context, listen: false).getAlladopted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adopted Pets History'),
      ),
      body: Consumer<petProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: value.Adoptedpets.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        value.Adoptedpets[index].photourl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      value.Adoptedpets[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          'Adopted on: ${value.Adoptedpets[index].adoptat}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${value.Adoptedpets[index].price}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => petdetails(
                                  name: value.Adoptedpets[index].name,
                                  type: value.Adoptedpets[index].type,
                                  age: value.Adoptedpets[index].age,
                                  location: value.Adoptedpets[index].location,
                                  adopt: value.Adoptedpets[index].adopt,
                                  index: index,
                                  image: value.Adoptedpets[index].photourl,
                                  price: value.Adoptedpets[index].price)));
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
