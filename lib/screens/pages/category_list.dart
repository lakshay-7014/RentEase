import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/color_const.dart';

import '../../utils/app_sizes.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(9 * 3),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   ImageConst.appLogo,
            //   height: AppSizes.height10 * 9,
            // ),
            Column(
              children: [
                Text(
                  "RENTEASE",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                // SizedBox(height: AppSizes.height10 * 1.5),
                // Image.asset(
                //   ImageConst.appLogo,
                //   height: AppSizes.height10 * 2.7,
                // ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img1.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Cars",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img2.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img3.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Mobiles",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img4.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Jobs",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img5.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Bikes",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img6.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Electronics",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img7.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Furnitures",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img8.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Clothes",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img9.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Books",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img10.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Sports",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img10.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Cars",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img10.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Cars",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img10.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Cars",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(
              'assets/images/img10.png',
              height: 60,
              width: 60,
            ),
            title: Text(
              "Cars",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}
