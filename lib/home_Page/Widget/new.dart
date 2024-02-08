import 'package:flutter/material.dart';



class news extends StatelessWidget {

  const news({Key? key, this.image}) : super(key: key);
  final Image? image;

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 300,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: image!,
      ),

    );

  }

}
