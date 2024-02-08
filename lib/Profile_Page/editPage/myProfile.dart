import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobstreet/Profile_Page/editPage/edit_resume.dart';

import '../user/user.dart';
import '../user/user_data.dart';
import '../widgets/display_image_widget.dart';

import 'edit_email.dart';
import 'edit_image.dart';
import 'edit_name.dart';
import 'edit_phone.dart';

class myProfile extends StatefulWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<myProfile> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 76, 153, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
        elevation: 0.0,
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                navigateSecondPage(const EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              ),
            ),
            buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
            buildUserInfoDisplay(
              user.phone,
              'Phone',
              const EditPhoneFormPage(),
            ),
            buildUserInfoDisplay(
              user.email,
              'Email',
              const EditEmailFormPage(),
            ),
            buildUpdateResumeButton(), // New button for updating resume
          ],
        ),
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
            width: 350,
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      navigateSecondPage(editPage);
                    },
                    child: Text(
                      getValue,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUpdateResumeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 330,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              navigateSecondPage(const EditResumePage());
            },
            child: const Text(
              'Update Resume',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
