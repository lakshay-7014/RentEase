import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor/models/user_model.dart';
import 'package:minor/views/widgets/custom_appBar.dart';
import '../../const/color_const.dart';
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
      //  appBar: appbar(name: "chats"),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFCCE5E0),
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: Color(0xFFCCE5E0),
          //statusBarColor: Colors.transparent,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.targetuser.profilePic),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.targetuser.name.toString(),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                true
                    ? Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 1),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Active Now",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        DateTime.now().toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam, size: 20),
            color: Color(0xFF177767),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, size: 20),
            color: Color(0xFF177767),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, size: 20),
            color: Color(0xFF177767),
            onPressed: () {},
          ),
        ],
      ),
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
                                  Flexible(
                                    child: IntrinsicWidth(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 7, horizontal: 10),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        decoration: BoxDecoration(
                                            borderRadius: currentmessage.sender ==
                                                    widget.firebaseuser.uid
                                                ? BorderRadius.only(
                                                    topLeft: Radius.circular(12),
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12))
                                                : BorderRadius.only(
                                                    topRight: Radius.circular(12),
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12)),
                                            color: currentmessage.sender ==
                                                    widget.firebaseuser.uid
                                                ? Color(0xFF66BEB8)
                                                : Color(0xFFCCD0DC)),
                                        child: Center(
                                          child: Wrap(
                                            children: [
                                              Text(
                                                  currentmessage.text
                                                      .toString()
                                                      .trim(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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
                      return Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            //  backgroundColor: Colors.red,
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                ColorConst.primaryColor),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            TextField(
              controller: messagecontroller,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "enter the message",
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    sendmessage();
                    messagecontroller.clear();
                  },
                  icon: Icon(Icons.send),
                ),
              ),
            ),
            // Container(
            //   color: Colors.grey[400],
            //   height: 80,
            //   child: Row(
            //     children: [
            //       Flexible(
            //           child: Padding(
            //         padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
            //         child: TextField(
            //           style: const TextStyle(
            //             fontSize: 20,
            //           ),
            //           maxLines: null,
            //           controller: messagecontroller,
            //           decoration: const InputDecoration(
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       )),
            //       IconButton(
            //         onPressed: () {
            //           sendmessage();
            //           messagecontroller.clear();
            //         },
            //         icon: const Icon(
            //           Icons.send,
            //           color: Colors.blue,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
