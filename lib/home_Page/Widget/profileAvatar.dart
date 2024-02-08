import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget{

  final String imageurl;
  final bool isActive;

  const ProfileAvatar({super.key, required this.imageurl, this.isActive = false});

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      radius: 20.0,
      backgroundColor: Colors.grey[200],
      backgroundImage: CachedNetworkImageProvider(imageurl),
    );

  }



}