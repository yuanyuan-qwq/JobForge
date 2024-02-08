import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jobstreet/Login_Page/screen/first_screen.dart';
import 'package:jobstreet/Profile_Page/editPage/edit_email.dart';
import 'package:jobstreet/Profile_Page/editPage/edit_phone.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue);

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool Mode = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color activeSwitchColor = theme.colorScheme.primary;
    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Common",
                    style: headingStyle,
                  ),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.language),
                title: Text("Language"),
                subtitle: Text("English"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.cloud),
                title: Text("Data and Storage"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.message),
                title: Text("Notifications and Sounds"),
                subtitle: Text(""),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Account", style: headingStyle),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPhoneFormPage()),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Phone Number"),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditEmailFormPage()),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.mail),
                  title: Text("Email"),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => firstPage()),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign Out"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Security", style: headingStyle),
                ],
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePWD()),
                  );
                  */
                },
                child: ListTile(
                  leading: Icon(Icons.security_rounded),
                  title: Text("Change Password"),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phonelink_lock_outlined),
                title: const Text("Lock app in background"),
                trailing: Switch(
                  value: lockAppSwitchVal,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setState(() {
                      lockAppSwitchVal = val;
                    });
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.fingerprint),
                title: const Text("Use fingerprint"),
                trailing: Switch(
                  value: fingerprintSwitchVal,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setState(() {
                      fingerprintSwitchVal = val;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Misc", style: headingStyle),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.phonelink_lock_outlined),
                title: const Text("Dark / Light Mode"),
                trailing: Switch(
                  value: Mode,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    setState(() {
                      Mode = val;
                    });
                  },
                ),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.file_open_outlined),
                title: Text("Terms of Service"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.file_copy_outlined),
                title: Text("Open Source and Licences"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
