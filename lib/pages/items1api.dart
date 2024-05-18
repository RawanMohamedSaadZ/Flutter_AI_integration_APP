import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

class Items_API extends StatefulWidget {
  const Items_API({super.key});

  @override
  State<Items_API> createState() => _Items_APIState();
}

class _Items_APIState extends State<Items_API> {
  List<String> imagePaths = [];
  List<bool> _isFavorite = [];
  int foundResults = 0 ;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await
    http.get(Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        imagePaths = data.map((cat) => cat['url'].toString()).toList();
        _isFavorite = List.filled(imagePaths.length, false);

        foundResults =  imagePaths.length;
      });
    } else {
      throw Exception('Failed to load cat images');
    }
  }

  void addToFavorites(int index) {
    setState(() {
      _isFavorite[index] = !_isFavorite[index];
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite[index] ? 'Added to Favorites' : 'Removed from Favorites',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7E4DB5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            // Implement search functionality
          },
          child: const SizedBox(width: 200, height: 30,

              child:  Text('Search here')),

        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/custom-drawer");
            },
            icon: const Icon(Icons.more_vert),
            iconSize: 40,
            color: Colors.black,
          ),
        ],
        elevation: 4,
      ),
      backgroundColor: const Color(0xffDBCCEC),
      body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                    "Found $foundResults Results",
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 33),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Positioned(
                        top: 10,
                        left: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(imagePaths[index]),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: IconButton(
                          onPressed: () {
                            addToFavorites(index);
                            },
                          icon: Icon(
                            _isFavorite[index]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            // Icons.favorite_border,
                            size: 30,
                            color: _isFavorite[index] ?
                            Colors.red : Colors.black,
                            // color: Colors.black,
                          ),
                        ),
                      ),
                    ]);
                  }),
            ),
          ],

        ),


    );
  }
}
