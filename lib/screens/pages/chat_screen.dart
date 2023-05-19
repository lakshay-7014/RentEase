import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minor/models/user_model.dart';
import 'package:minor/views/widgets/custom_appBar.dart';
import '../../main.dart';
import '../../models/chatroom.dart';
import '../../models/messagemodel.dart';

class ChatScreen extends StatefulWidget {
  final User firebaseuser;
  final UserModel targetuser;
  final ChatRoomModel chatroom;
  const ChatScreen(
      {super.key,
      required this.firebaseuser,
      required this.targetuser,
      required this.chatroom});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void sendmessage() {
    String message = messagecontroller.text;

    if (message != "") {
      MessageModel messagemodel = MessageModel(
          messageid: uuid.v1(),
          createdon: DateTime.now(),
          seen: false,
          sender: widget.firebaseuser.uid,
          text: message);
      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom.chatroomid)
          .collection("messages")
          .doc(messagemodel.messageid)
          .set(messagemodel.tomap());
      widget.chatroom.lastmessage = message;
      widget.chatroom.lastaccessed = DateTime.now();
      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom.chatroomid)
          .set(widget.chatroom.toMap());
    }
  }

  TextEditingController messagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(name: "chats"),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chatrooms")
                      .doc(widget.chatroom.chatroomid)
                      .collection("messages")
                      .orderBy('createdon', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        QuerySnapshot datasnapshot =
                            snapshot.data as QuerySnapshot;
                        if (datasnapshot.docs.length > 0) {
                          return ListView.builder(
                            reverse: true,
                            itemCount: datasnapshot.docs.length,
                            itemBuilder: (context, index) {
                              MessageModel currentmessage =
                                  MessageModel.fromMap(datasnapshot.docs[index]
                                      .data() as Map<String, dynamic>);

                              return Row(
                                mainAxisAlignment: currentmessage.sender ==
                                        widget.firebaseuser.uid
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 10),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: currentmessage.sender ==
                                                widget.firebaseuser.uid
                                            ? Colors.teal
                                            : Colors.grey),
                                    child: Text(currentmessage.text.toString(),
                                        style: const TextStyle(fontSize: 22)),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("Say Hiii to Your new Friend",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300)),
                          );
                        }
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text("check your internet connection"));
                      } else {
                        return const Center(
                          child: Text("Say Hiii to Your new Friend"),
                        );
                      }
                    } else {
                      return const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator.adaptive(
                            value: 40,
                          ));
                    }
                  },
                ),
              ),
            ),
            Container(
              color: Colors.grey[400],
              height: 80,
              child: Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: null,
                      controller: messagecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                  IconButton(
                    onPressed: () {
                      sendmessage();
                      messagecontroller.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
