import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor/screens/details_screen.dart';
import 'package:minor/screens/pages/home_screen.dart';
import '../../const/color_const.dart';
import '../../const/image_const.dart';
import '../../const/stream_const.dart';
import '../../utils/app_sizes.dart';
import '../../views/widgets/custom_card_widgets/custom_card_widget_1.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
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
            Image.asset(
              ImageConst.appLogo,
              height: AppSizes.height10 * 9,
            ),
            Column(
              children: [
                const Text(
                  "RENTEASE",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: AppSizes.height10 * 1.5),
                Image.asset(
                  ImageConst.appLogo,
                  height: AppSizes.height10 * 2.7,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: AppSizes.horizontalPadding20,
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream1,
                    image: Image.asset(
                      StreamConst.streamImageConst(1),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream1,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream2,
                    image: Image.asset(
                      StreamConst.streamImageConst(2),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream2,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream3,
                    image: Image.asset(
                      StreamConst.streamImageConst(3),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream3,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream4,
                    image: Image.asset(
                      StreamConst.streamImageConst(4),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream4,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream5,
                    image: Image.asset(
                      StreamConst.streamImageConst(5),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream5,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream6,
                    image: Image.asset(
                      StreamConst.streamImageConst(6),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream6,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream7,
                    image: Image.asset(
                      StreamConst.streamImageConst(7),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream7,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream8,
                    image: Image.asset(
                      StreamConst.streamImageConst(8),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream8,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream9,
                    image: Image.asset(
                      StreamConst.streamImageConst(9),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream9,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomCardWidget1(
                    color: ColorConst.stream,
                    text: StreamConst.stream10,
                    image: Image.asset(
                      StreamConst.streamImageConst(10),
                      width: 80,
                      height: 80,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              category: StreamConst.stream10,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
