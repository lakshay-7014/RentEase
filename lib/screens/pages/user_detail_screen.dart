import 'package:flutter/material.dart';

import '../../views/widgets/custom_appBar.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);
  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(name: "User Details"),
    );
  }
}
