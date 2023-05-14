import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minor/screens/pages/home_screen.dart';
import '../const/color_const.dart';
import '../const/string_const.dart';
import '../utils/app_sizes.dart';
import '../utils/no_leading_space_formatter.dart';
import '../utils/no_leading_trailing_space_formatter.dart';
import '../views/widgets/custom_app_bars/custom_app_bar_2.dart';
import '../views/widgets/custom_text_form_fields/custom_text_form_field_1.dart';
import '../views/widgets/custom_titles/custome_title1.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  //final _controller = Get.put(CreateProfileController());
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _streamController = TextEditingController();

  void onTap2() {
    FocusManager.instance.primaryFocus!.unfocus();
    //  Get.to(() => AvatarChoosePage());
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: appBar2,
      body: SingleChildScrollView(
     
        child: Padding(
          padding: AppSizes.horizontalPadding20,
          child: Column(
            children: [
              SizedBox(height: AppSizes.height10),
              const CustomTitle1(text: StringConst.createProfile),
              SizedBox(height: AppSizes.height10 * 2),

              SizedBox(height: AppSizes.height10 * 2),
              Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    CustomTextFormField1(
                      controller: _nameController,
                      maxLines: 1,
                      hintText: StringConst.chooseUserName,
                      validator: (val) {
                        if (GetUtils.isUsername(val!)) {
                          return null;
                        } else {
                          return StringConst.chooseValidUserName;
                        }
                      },
                      keyboardType: TextInputType.name,
                      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField1(
                      controller: _descriptionController,
                      maxLines: 5,
                      hintText: StringConst.writeAboutYourself,
                      validator: (val) {
                        if (GetUtils.isLengthGreaterOrEqual(val, 20)) {
                          return null;
                        } else {
                          return StringConst.chooseValidDescription20;
                        }
                      },
                      keyboardType: TextInputType.text,
                      inputFormatters: [NoLeadingSpaceFormatter()],
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField1(
                      controller: _streamController,
                      maxLines: 1,
                      hintText: StringConst.chooseYourStream,
                      validator: (val) {
                        if (GetUtils.isUsername(val!)) {
                          return null;
                        } else {
                          return StringConst.chooseValidUserName;
                        }
                      },
                      keyboardType: TextInputType.name,
                      inputFormatters: [NoLeadingTrailingSpaceFormatter()],
                      obscureText: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  //onTap(context);
                },
              ),
              // CustomButton1(
              //   text: StringConst.continueButtonString,
              //   buttonColor: ColorConst.primaryColor,
              //   textColor: ColorConst.whiteColor,
              //   //onTap: onTap,
              // ),
              SizedBox(height: AppSizes.height10 * 2),
            ],
          ),
        ),
      ),
    );
  }
}
