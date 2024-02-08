import 'package:flutter/material.dart';
import 'package:jobstreet/Login_Page/screen/signin_screen.dart';
import 'package:jobstreet/Login_Page/screen/singup_screen.dart';
import '../../main_Controller.dart';

import '../../main_Controller.dart';
import '../../search_Page/searchWidget.dart';
import '../widget/customBackground.dart';
import '../widget/custom_button.dart';


class firstPage extends StatefulWidget{
  const firstPage({super.key});
  @override
  State<StatefulWidget> createState() => _firstPage();


}

class _firstPage extends State<firstPage>{

  final SizedBox spaceBetween = const SizedBox(height: 15,);

  Widget build(BuildContext context) {

    return  customBackgorund(
      child: Column(
        children: <Widget>[
          Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 0,
                ),
                child: Column(
                  children: [
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome Back!\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50.0,
                                color: Colors.white,
                              )
                            ),
                            TextSpan(
                              text: "Let Find Your Job",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )
                            )
                          ]
                        ),
                      ),
                    ),
                  ],
                ),

              )
          ),
           Flexible(
            flex: 1,
             child: Align(
               alignment: Alignment.bottomCenter,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   spaceBetween,
                   spaceBetween,
                   spaceBetween,
                   spaceBetween,
                   spaceBetween,
                   spaceBetween,
                   ButtonWidget(
                     buttonText: "Sign in",
                     color: Colors.white,
                     textcolor: const Color.fromRGBO(0, 51, 102, 1),
                     onTap: SignInScreen(),
                   ),
                   spaceBetween,
                   ButtonWidget(
                     buttonText: "Sign up",
                     color: const Color.fromRGBO(0, 51, 102, 1),
                     textcolor: Colors.white,
                     onTap: SignUpScreen(),
                   )


                 ],
               ),
             ),

          ),
        ],
      ),
    );

  }



}