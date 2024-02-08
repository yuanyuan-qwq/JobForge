import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobstreet/search_Page/searchWidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ChatBot_Page/ChatBotPage.dart';
import 'Inbox/inboxPage.dart';
import 'Profile_Page/ProfilePage.dart';
import 'home_Page/home.dart';


class main_controller extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>main_controller_state();


}
class main_controller_state extends State<main_controller>{

  int index = 0;

  final pages = [
    home_page(),
    search(),
    ChatBotPage(),
    InboxPage(),
    ProfilePage(),
  ];

  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.search, size: 30),
    Icon(Icons.live_help, size: 30),
    Icon(MdiIcons.facebookMessenger, size: 30),
    Icon(Icons.account_circle_rounded, size: 30),
  ];

  @override
  Widget build(BuildContext context) {

    return  Container(
      color: Color.fromRGBO(0, 51, 102, 1),
      // safeArea is for phone navigation type using scroll up or left right to quit
      child: SafeArea(
          top: false,
            child: Scaffold(
              extendBody: true,

              body: pages[index],
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: Colors.grey),
                ),

                child: CurvedNavigationBar(
                  color: Color.fromRGBO(0, 51, 102, 1),
                  buttonBackgroundColor: Color.fromRGBO(0, 51, 102, 1),
                  backgroundColor: Colors.transparent,
                  height: 60,
                  animationCurve: Curves.easeInOut,
                  animationDuration: Duration(milliseconds: 300),
                  items: items,
                  index: index,
                  onTap: (index) => setState(() {
                    this.index = index;
                  }),
                ),
              ),



            )
        ),
    );

  }

}