import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor/models/user_model.dart';
import 'package:minor/screens/My_contract.dart';
import 'package:minor/screens/pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../../auth/auth_provider.dart';
import '../../const/color_const.dart';

class AccountScreen extends StatefulWidget {
  final String? name;
  final String? email;
  final String? bio;
  final String? profilePic;
  final String? phoneNumber;
  final String? aadhar;
  final String? uid;

  const AccountScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.bio,
      this.profilePic,
      this.phoneNumber,
      this.aadhar,
      this.uid});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    // _getData();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    final ap = Provider.of<AuthProvider>(context, listen: false);
    void showOption() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Other"),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyContract(
                            uid: widget.uid,
                          );
                        },
                      ),
                    );
                  },
                  title: const Text("My Contracts"),
                  leading: const Icon(Icons.photo_album_outlined),
                ),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      ap.userSignOut().then((value) => Navigator.of(context)
                          .pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (c) => WelcomeScreen()),
                              (route) => false));
                    },
                    title: const Text("Logout"),
                    leading: const Icon(Icons.logout))
              ]),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: ColorConst.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.primaryColor,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Column(
          children: const [
            Text(
              "PROFILE",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, size: 20),
            color: Color.fromARGB(255, 250, 255, 254),
            onPressed: () {
              showOption();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              // alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: 10),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.profilePic.toString()),
                  )),
            ),
            SizedBox(height: 8),
            Text(
              widget.name!,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            Text(
              "___________________________\n",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "E-mail",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      widget.email.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 23),
                    Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "Jaipur, Rajasthan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 23),
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      widget.bio.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 23),
                    Text(
                      "Mobile Number",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      widget.phoneNumber.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 23),
                    Text(
                      "Aaadhar Number",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      widget.aadhar.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 80),
            // submitField(context),
          ],
        ),
      ),
    );
  }

//   Widget submitField(BuildContext context) {
//     final ap = Provider.of<AuthProvider>(context, listen: false);
//     return Center(
//       child: SizedBox(
//         height: 50,
//         width: 200,
//         child: ElevatedButton(
//           onPressed: () {
//             ap.userSignOut().then((value) => Navigator.of(context)
//                 .pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (c) => WelcomeScreen()),
//                     (route) => false));
//           },
//           child: Text(
//             "Log-out",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             primary: Color(0xFF076E66),
//           ),
//         ),
//       ),
//     );
//   }
}
