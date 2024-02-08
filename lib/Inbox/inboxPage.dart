import 'package:flutter/material.dart';
import 'package:jobstreet/Inbox/inboxPageCTRL.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 76, 153, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
        elevation: 0.0,
        title: const Text(
          "Inbox",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ChatModel.dummyData.length,
          itemBuilder: (context, index) {
            ChatModel model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                const Divider(
                  height: 12.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        15.0), // Adjust the border radius here
                    border: Border.all(
                      color: Colors.white, // Adjust border color here
                      width: 1.0, // Adjust border width here
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24.0,
                      backgroundImage: NetworkImage(model.avatarUrl),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(model.name,
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          model.datetime,
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.white),
                        ),
                      ],
                    ),
                    subtitle: Text(model.message,
                        style: const TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 14.0, color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
