import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.only(right: 0),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 202,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(171, 241, 196, 141),
                  Color(0xFFf1c48d),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromARGB(171, 118, 142, 163),
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(size: 30, Icons.file_upload),
                  ),
                ),
                const Text(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                  ),
                  "User",
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Edit User Profile",
                      style: TextStyle(color: Colors.purple)),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          buildListTile(
            "Notifications",
            Icons.notification_add_outlined,
          ),
          buildListTile(
            "DishTrack",
            Icons.flatware,
          ),
          buildListTile(
            "FridgeTrack",
            Icons.calendar_today,
          ),
          buildListTile(
            "GroceryTrack",
            Icons.local_grocery_store,
          ),
          buildListTile(
            "Report",
            Icons.warning,
          ),
        ],
      ),
    );
  }
}
