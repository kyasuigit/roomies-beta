import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../providers/app_user.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback goToScreen) {
    return ListTile(
      minLeadingWidth: 30,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.black,
          ),
        ],
      ),
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: 'Gotham',
          fontSize: 14,
          letterSpacing: 0.5,
        ),
      ),
      onTap: goToScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(171, 66, 121, 168),
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(size: 30, Icons.file_upload),
                  ),
                ),
                const SizedBox(height: 4),
                Consumer<AppUser>(
                  builder: (
                    _,
                    userName,
                    __,
                  ) =>
                      Text(
                    style: Theme.of(context).textTheme.titleMedium,
                    userName.getDisplayName,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit User Profile",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.0),
          //MY HOUSE FEATURES
          buildListTile(
            "My Houses",
            Icons.home,
            () {},
          ),
          buildListTile(
            "Notifications",
            Icons.notifications_none,
            () {},
          ),
          const Divider(thickness: 1.0),
          //FEATURES SECTION
          buildListTile(
            "DishTrack",
            Icons.flatware,
            () {},
          ),
          buildListTile(
            "FridgeTrack",
            Icons.calendar_today,
            () {},
          ),
          buildListTile(
            "GroceryTrack",
            Icons.local_grocery_store,
            () {},
          ),
          buildListTile(
            "Report",
            Icons.warning,
            () {},
          ),
          //HELPER SECTION
          const Divider(thickness: 1.0),
          buildListTile(
            "Your Account Settings",
            Icons.settings,
            () {},
          ),
          buildListTile(
            "Help",
            Icons.help,
            () {},
          ),
          buildListTile(
            "Logout",
            Icons.exit_to_app,
            ([mounted = true]) async {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
              await FirebaseAuth.instance.signOut();

              if (!mounted) return;
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
