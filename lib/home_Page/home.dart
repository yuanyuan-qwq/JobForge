import 'package:flutter/material.dart';
import 'package:jobstreet/home_Page/pic_list.dart';

import '../Login_Page/screen/first_screen.dart';
import 'Widget/create_post.dart';
import 'Widget/middle_widget.dart';
import 'Widget/new.dart';
import 'Widget/post_widget.dart';
import 'Widget/top_widget.dart';
import 'Widget/upper_widget.dart';


class home_page extends StatefulWidget{
  const home_page({super.key});

  @override
  State<StatefulWidget> createState() => _home_page();

}

class _home_page extends State<home_page>{


  Widget build(BuildContext context) {



    return Scaffold(

        extendBodyBehindAppBar: true,
      backgroundColor:Color.fromRGBO(0, 76, 153,1),
      body: topper(
        child: Upper(),
        middleChild: Middle(),
        postChild: create_post(),

      )


    );

  }

}