import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../Theme/theme.dart';
import '../post_list.dart';

 bool a = true;

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(post: post),
          SizedBox(height: 8.0),
          Text(
            post.caption,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 8.0),
          _PostImage(path: post.path),
          SizedBox(height: 8.0),
          _PostStats(post: post),
        ],
      ),
    );
  }
}

class _PostStats extends StatefulWidget {
  final Post post;

  _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  _PostStatsState createState() => _PostStatsState();
}

class _PostStatsState extends State<_PostStats> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int operationCount = 0;

  Future<void> _updateFirestore(String field) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Fetch the current value of the field in Firestore
        DocumentSnapshot documentSnapshot =
            await _firestore.collection('post').doc(widget.post.documentId).get();

        int currentValue = documentSnapshot[field];

        // Toggle between incrementing and decrementing
        int newValue = operationCount % 2 == 0 ? currentValue + 1 : currentValue - 1;

        // Update the field
        await _firestore.collection('post').doc(widget.post.documentId).update({
          field: newValue,
        });

        // Increment the operation count
        setState(() {
          operationCount++;
        });
      }
    } catch (e) {
      print("Error updating Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: darkColorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${widget.post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(width: 4.0),
            Text(
              '${widget.post.applies} applies ',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 4.0),
            Text(
              '${widget.post.shares} Shares ',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
              ),
              label: 'Like',
              onTap: () {
                print("Like");
                _updateFirestore('likes');
              },
              postId: widget.post.documentId,
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.human,
                color: Colors.grey[600],
              ),
              label: 'Apply',
              onTap: () {
                print("Apply");
                _updateFirestore('applies');
              },
              postId: widget.post.documentId,
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
              ),
              label: 'Share',
              onTap: () {
                print("Share");
                _updateFirestore('shares');
              },
              postId: widget.post.documentId,
            ),
          ],
        )
      ],
    );
  }
}


class _ButtonColor {
  static const Color defaultColor = Colors.white;
  static const Color pressedColor = Colors.blue; // Change this to your desired pressed color
}

class _PostButton extends StatefulWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  final String postId;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.postId,
  }) : super(key: key);

  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<_PostButton> {
  Color buttonColor = _ButtonColor.defaultColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: buttonColor,
        child: InkWell(
          onTap: () {
            setState(() {
              buttonColor = buttonColor == _ButtonColor.defaultColor
                  ? _ButtonColor.pressedColor
                  : _ButtonColor.defaultColor;

              widget.onTap();
            });
          },
          child: Container(
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.icon,
                const SizedBox(width: 4.0),
                Text(widget.label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                post.User,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}

class _PostImage extends StatelessWidget {
  final String path;

  const _PostImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return path.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: path,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
        : Container();
  }
}



