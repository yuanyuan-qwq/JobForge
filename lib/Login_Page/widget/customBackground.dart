import 'package:flutter/material.dart';



class customBackgorund extends StatelessWidget{

  const customBackgorund({super.key,  this.child});
  final Widget? child;


  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: <Widget>[
            Image.asset(
              'images/bg1.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
             SafeArea(
              child: child!,

            ),

          ],
        )


    );

  }



}