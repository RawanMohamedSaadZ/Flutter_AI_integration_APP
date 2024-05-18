// import 'package:detection_app1/pages/searchpage.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _HomePageState();
}

class _HomePageState extends State<Items> {

  List<String> namelist = [
    'Cat1',
    'Cat2',
    'Cat3',
    'Cat4',
    // Add name as needed
  ];
// dynamic
  List<String> imagePaths = [
    'Assets/images/cat2.jpg',
    'Assets/images/cat4.jpg',
    'Assets/images/Cat.jpg',
    'Assets/images/cat3.jpg',

    // Add image paths as needed
  ];
  List<bool> _isFavorite = [];

  @override
  void initState() {
    // Initialize imagePaths and _isFavorite
    // after the object is created
    imagePaths = [
      'Assets/images/cat2.jpg',
      'Assets/images/cat4.jpg',
      'Assets/images/Cat.jpg',
      'Assets/images/cat3.jpg',
      // Add image paths as needed
    ];
    // Initialize _isFavorit list with false values
    _isFavorite = List.filled(imagePaths.length, false);
    // The State class  extends State<StatefulWidget>
    // and  includes an initState() method.
    super.initState();
  }
  void addToFavorites(int index) {
    setState(() {
      //common pattern used for toggling boolean states in programming.
      _isFavorite[index] = !_isFavorite[index];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite[index] ?
          'Added to Favorites' : 'Removed from Favorites',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
  // create new Data , class
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
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Found 4 Results",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
                          backgroundImage: AssetImage(imagePaths[index]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          addToFavorites(index);

                          // Navigator.pushNamed(context,"/details-screen");
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
                    Positioned(
                        left: 41,
                        bottom: -8,
                        child: Text(
                          namelist[index],
                          style: const TextStyle(fontSize: 20),
                        )),
                  ]);
                }),
          ),
        ],
      ),
    );
  }
}
