import 'package:flutter/material.dart';
import 'package:minor/const/color_const.dart';
import 'package:minor/screens/otp_screen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img12.png',
                width: 350,
                height: 350,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "PHONE AUTHENTICATION",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your number",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorConst.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen()),
                      );
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
