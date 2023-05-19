import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../const/color_const.dart';
import '../../controller/getmodelcontroller.dart';
import '../../main.dart';
import '../../models/chatroom.dart';
import '../../models/form_model.dart';
import '../../models/user_model.dart';
import '../../views/dialogs/ui_help.dart';
import 'chat_screen.dart';

class ProductDetails extends StatefulWidget {
  final User firebaseuser;
  final FormModel formmodel;
  const ProductDetails(
      {super.key, required this.firebaseuser, required this.formmodel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future<ChatRoomModel> getChatroom(UserModel targetuser) async {
    ChatRoomModel finalchatroom;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .where("participants.${widget.firebaseuser.uid}", isEqualTo: true)
        .where("participants.${targetuser.uid}", isEqualTo: true)
        .get();

    if (snapshot.docs.length > 0) {
      var data = snapshot.docs[0].data();
      ChatRoomModel existingchatroom =
          ChatRoomModel.fromMap(data as Map<String, dynamic>);
      finalchatroom = existingchatroom;
    } else {
      ChatRoomModel newchatroommodel = ChatRoomModel(
          chatroomid: uuid.v1(),
          lastmessage: " ",
          lastaccessed: DateTime.now(),
          participants: {
            widget.firebaseuser.uid.toString(): true,
            targetuser.uid.toString(): true
          });
      finalchatroom = newchatroommodel;
      await FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(newchatroommodel.chatroomid)
          .set(newchatroommodel.toMap());
    }

    return finalchatroom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 45,
        backgroundColor: ColorConst.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.primaryColor,
          //statusBarColor: Colors.transparent,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(9 * 3),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  "Product Name",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageProfile(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Container(
                // height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFE3ECEB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.formmodel.productName.toString(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(" starting from"),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            size: 18,
                            color: Colors.green,
                            weight: 8,
                          ),
                          Text(
                            widget.formmodel.price.toString() +
                                widget.formmodel.duration.toString(),
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      aboutTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      // priceTextField(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // durationfield(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Locationfield(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            widget.formmodel.location.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            chatbutton(),
          ],
        ),
      ),
    );
  }

  Widget chatbutton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              UiHelper.showloadingDialog(context, "Loading");
              UserModel searchuser =
                  await GetUserModel.getusermodelById(widget.formmodel.uid!);
              ChatRoomModel? chatroom = await getChatroom(searchuser);
              if (chatroom != null) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatScreen(
                        firebaseuser: widget.firebaseuser,
                        chatroom: chatroom,
                        targetuser: searchuser,
                      );
                    },
                  ),
                );
              }
            },
            child: Text(
              "Chat Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              primary: ColorConst.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.formmodel.profilepic.toString())
                    as ImageProvider)),
      ),
    );
  }

  Widget Locationfield() {
    return Text(
      "Location",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        // height: 1,
        // letterSpacing: 2,
      ),
    );
  }

  Widget nameTextField() {
    return Text(
      "PRODUCT_NAME",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        height: 1,
        letterSpacing: 2,
      ),
    );
  }

  Widget durationfield() {
    return Text(
      "Duration",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        height: 1,
        letterSpacing: 2,
      ),
    );
  }

  Widget priceTextField() {
    return Text(
      "Price",
      //textWidthBasis: TextWidthBasis.longestLine,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        height: 1,
        letterSpacing: 2,
      ),
    );
  }

  Widget aboutTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          //textWidthBasis: TextWidthBasis.longestLine,
          textAlign: TextAlign.left,
          style: TextStyle(
            //color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            // height: 1,
            // letterSpacing: 2,
          ),
        ),
        Text(
          widget.formmodel.description.toString(),
          textWidthBasis: TextWidthBasis.longestLine,
          style: TextStyle(
            //color: Colors.black,
            //fontWeight: FontWeight.bold,
            fontSize: 15,
            height: 1,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
