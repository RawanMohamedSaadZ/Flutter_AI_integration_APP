import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight:  Radius.circular(80),
            bottomRight:  Radius.circular(80),
          ),
        ),
        backgroundColor: const Color(0xff653E91),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Rawan Mohamed Saad"),
              accountEmail: const Text("Rawan@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://i.pinimg.com/originals/8a/e0/6c/8ae06c97498f44da0df62e0a660d787b.jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://i.pinimg.com/originals/21/40/fb/2140fbfaa6ff0ead316e684fd14825a4.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              title: const Text("Home",
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, "/HomePage");
              },
            ),
            ListTile(
              leading: const Icon(Icons.star,size: 30,color: Colors.white,),
              title: const Text("Items",style:  TextStyle(fontSize:26 ,color: Colors.white)
              ),
              onTap : () {

                Navigator.pushNamed(context,"/Bottom3");
              },
            ),

            const ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                size: 30,
                color: Colors.white,
              ),
              title: Text("Profile",
                  style: TextStyle(fontSize: 26, color: Colors.white)),
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ),
              title: const Text("Notification",
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              onTap: () {}
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
              title: const Text("Settings",
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_support,
                size: 30,
                color: Colors.white,
              ),
              title: const Text("Contact us",
                  style:  TextStyle(fontSize: 26, color: Colors.white)),
              onTap: () {
    }

            ),
            // SizedBox(
            //   height:200,
            // ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 30,
                color: Colors.white,
              ),
              title: const Text("logout",
                  style: TextStyle(fontSize: 26, color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ));
  }
}
