import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minor/const/color_const.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import '../views/dialogs/ui_help.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController countryController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    countryController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: countryController.text.length,
      ),
    );
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
              TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.phone,
                controller: countryController,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    countryController.text = value;
                  });
                },
                decoration: InputDecoration(
                  counterText: "",
                  hintText: " Enter phone number",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: countryController.text.length == 10
                      ? Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      : null,
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      UiHelper.showloadingDialog(context, "Loading");
                      sendPhoneNumber();
                    },
                    child: Text("Send the code")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = countryController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
//UiHelper.showloadingDialog(context, "Loading");
