import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/color_const.dart';
import '../../const/stream_const.dart';
import '../../const/string_const.dart';
import '../../utils/app_sizes.dart';
import '../../views/widgets/custom_app_bars/custom_app_bar_2.dart';
import '../../views/widgets/custom_card_widgets/custom_card_widget_1.dart';
import '../../views/widgets/custom_titles/custome_title1.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
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
                      //onTap(1, context);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
