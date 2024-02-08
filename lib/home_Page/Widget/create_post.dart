import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

import '../../Theme/theme.dart';

class create_post extends StatelessWidget {
  final TextEditingController _postTextController = TextEditingController();

  // Function to add post to Firestore
  void _addPost(String text) {
  FirebaseFirestore.instance.collection('post').doc().set({
    'text': text,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: darkColorScheme.outlineVariant,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('images/12.png'),
              ),
              const SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  controller: _postTextController,
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Live',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Photo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () {
                    // Call the function to add the post to Firestore
                    _addPost(_postTextController.text);

                    // Clear the text field after posting
                    _postTextController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'Post',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
