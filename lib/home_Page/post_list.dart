// post_list.dart

import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference postsCollection =
    FirebaseFirestore.instance.collection('post');

class Post {
  final String documentId;
  final String User;
  final String caption;
  final String timeAgo;
  final String path;
  final int likes;
  final int applies;
  final int shares;

  const Post({
    required this.documentId,
    required this.User,
    required this.caption,
    required this.timeAgo,
    required this.path,
    required this.likes,
    required this.applies,
    required this.shares,
  });
}

Stream<List<Post>> streamPosts() {
  return postsCollection.snapshots().map((querySnapshot) {
    return querySnapshot.docs.map((doc) {
      String documentId = doc.id; // Get the document ID
      String user = doc['User'];
      String caption = doc['caption'];
      String timeAgo = doc['timeAgo'];
      String path = doc['path'];
      int likes = doc['likes'];
      int applies = doc['applies'];
      int shares = doc['shares'];

      return Post(
        documentId: documentId,
        User: user,
        caption: caption,
        timeAgo: timeAgo,
        path: path,
        likes: likes,
        applies: applies,
        shares: shares,
      );
    }).toList();
  });
}



