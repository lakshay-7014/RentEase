import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minor/models/contract_model.dart';
import 'package:minor/views/widgets/custom_appBar.dart';

import '../const/color_const.dart';

class MyContract extends StatefulWidget {
  final String? uid;

  const MyContract({super.key, this.uid});

  @override
  State<MyContract> createState() => _MyContractState();
}

class _MyContractState extends State<MyContract> {
  @override
  Widget build(BuildContext context) {
    print(widget.uid.toString());
    return Scaffold(
      appBar: appbar(name: "MY CONTRACT"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("contract")
            .where("participants.${widget.uid.toString()}", isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              QuerySnapshot datasnapshot = snapshot.data as QuerySnapshot;
              if (datasnapshot.docs.length > 0) {
                return ListView.builder(
                  itemCount: datasnapshot.docs.length,
                  itemBuilder: (context, index) {
                    ContractModel contractmodel = ContractModel.fromMap(
                        datasnapshot.docs[index].data()
                            as Map<String, dynamic>);

                    // Map<String, dynamic> participantsmap =
                    //     contractmodel.participants!;
                    // List<String> participantKey = participantsmap.keys.toList();
                    // participantKey.remove(widget.user.uid);
                    return CupertinoButton(
                      onPressed: () {},
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(contractmodel.contractpic!)
                                // imageFile != null
                                //     ? FileImage(imageFile!)
                                //     : AssetImage('assets/images/default_image1.png')
                                //         as ImageProvider

                                )),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No Contract available",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                );
              }
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text(snapshot.error.toString());
            } else {
              return const Text("No Contract");
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
