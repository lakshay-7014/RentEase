import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minor/views/widgets/custom_appBar.dart';

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
      body: Center(child: Text("NO CHATS")),
    );
  }
}
//TODO:
