import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobstreet/Profile_Page/AppInfo/AppInfoPage.dart';
import 'package:jobstreet/Profile_Page/SettingPage/Setting.dart';
import 'package:jobstreet/Profile_Page/editPage/myProfile.dart';
import 'package:jobstreet/Profile_Page/user/user_data.dart';
import 'package:jobstreet/Profile_Page/widgets/display_image_widget.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 76, 153, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
        elevation: 0.0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                DisplayImage(
                  imagePath: user.image,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const myProfile()),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(color: Colors.grey),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width *
                          0.7, // 60% of screen width
                      MediaQuery.of(context).size.height *
                          0.07, // 6% of screen height
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const myProfile()),
                    );
                  },
                  child: const Text('Edit Profile'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width *
                          0.7, // 60% of screen width
                      MediaQuery.of(context).size.height *
                          0.07, // 6% of screen height
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );
                  },
                  child: const Text('App info'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width *
                          0.7, // 60% of screen width
                      MediaQuery.of(context).size.height *
                          0.07, // 6% of screen height
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                  child: const Text('Settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
