import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minor/screens/pages/chat_screen.dart';
import 'package:minor/views/widgets/custom_appBar.dart';

import '../../const/color_const.dart';
import '../../controller/getmodelcontroller.dart';
import '../../models/chatroom.dart';
import '../../models/user_model.dart';

class ChatHome extends StatefulWidget {
  final User user;

  const ChatHome({super.key, required this.user});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(name: "CHATS"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chatrooms")
            .where("participants.${widget.user.uid}", isEqualTo: true)
            .snapshots(),
        //   TODO: Sort user according to last message
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              QuerySnapshot datasnapshot = snapshot.data as QuerySnapshot;
              if (datasnapshot.docs.length > 0) {
                return ListView.builder(
                  itemCount: datasnapshot.docs.length,
                  itemBuilder: (context, index) {
                    ChatRoomModel chatroomodel = ChatRoomModel.fromMap(
                        datasnapshot.docs[index].data()
                            as Map<String, dynamic>);
                    Map<String, dynamic> participantsmap =
                        chatroomodel.participants!;
                    List<String> participantKey = participantsmap.keys.toList();
                    participantKey.remove(widget.user.uid);
                    return FutureBuilder(
                      future: GetUserModel.getusermodelById(participantKey[0]),
                      builder: (context, userdata) {
                        if (userdata.connectionState == ConnectionState.done) {
                          UserModel targetuser = userdata.data as UserModel;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFCCE5E0),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.symmetric(vertical: 1),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ChatScreen(
                                            firebaseuser: widget.user,
                                            targetuser: targetuser,
                                            chatroom: chatroomodel);
                                      },
                                    ),
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(targetuser.profilePic),
                                ),
                                title: Text(
                                  targetuser.name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(chatroomodel.lastmessage!),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No Chat's available",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                );
              }
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text(snapshot.error.toString());
            } else {
              return const Text("No Chats");
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
    );
  }
}
//TODO:
