import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minor/const/color_const.dart';
import 'package:minor/screens/pages/category_list.dart';
import 'package:minor/screens/pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import '../../auth/auth_provider.dart';
import '../../const/image_const.dart';
import '../../utils/app_sizes.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static double height10 = 0.0;
  static double width10 = 0.0;

  static void mediaQueryHeightWidth(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    height10 = Get.mediaQuery.size.height * 0.0118;
    width10 = Get.mediaQuery.size.width * 0.0118 * 2.1;
    print(height10);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<String> imgList = [
    'assets/images/img12.png',
    'assets/images/img12.png',
    'assets/images/img12.png',
  ];

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 35,
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
            Image.asset(
              ImageConst.appLogo,
              height: AppSizes.height10 * 9,
            ),
            Column(
              children: [
                Text(
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
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        shrinkWrap: true,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: TextField(
          //     // keyboardType: keyboardType,
          //     // controller: controller,
          //     // inputFormatters: inputFormatters,
          //     // textCapitalization: TextCapitalization.sentences,
          //     // maxLines: maxLines,
          //     // validator: validator,
          //     // obscureText: obscureText,
          //     cursorColor: Colors.black12,
          //     decoration: InputDecoration(
          //       hoverColor: Colors.white,
          //       focusColor: Colors.white,
          //       fillColor: Colors.white,
          //       contentPadding: const EdgeInsets.all(12),
          //       hintText: "Search your product",
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           color: Colors.black38,
          //         ),
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //       border: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           color: Colors.white,
          //         ),
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ),
          //   ),
          // ),
          CarouselSlider(
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "CATEGORIES",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryList()),
                    );
                  },
                  child: Row(
                    children: [
                      Text("See All"),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
             width: 90,
            height: 90,
            child: ListView(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/img1.png',
                      ),
                      Text("Cars")
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Image.asset('assets/images/img2.png'),
                      Text("Home")
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 52,
                  height: 50,
                  child: Column(
                    children: [
                      Image.asset('assets/images/img3.png'),
                      Text("Mobiles")
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Image.asset('assets/images/img4.png'),
                      Text("Jobs")
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Image.asset('assets/images/img5.png'),
                      Text("Bikes")
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: Column(
                    children: [
                      Image.asset('assets/images/img6.png'),
                      Text("Electronics")
                    ],
                  ),
                ),
              ],
            ),
          ),
          //expend error
          Container(
            height: 140,
            width: 160,
            color: ColorConst.errorPageStatusBarColor,
          ),
          SizedBox(height: 5),
          Container(
            height: 140,
            width: 160,
            color: ColorConst.errorPageStatusBarColor,
          ),
          SizedBox(height: 5),
          Container(
            height: 140,
            width: 160,
            color: ColorConst.errorPageStatusBarColor,
          ),
          SizedBox(height: 5),
          Container(
            height: 140,
            width: 160,
            color: ColorConst.errorPageStatusBarColor,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 1.1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              //  borderRadius: BorderRadius.circular(20),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.black54,
              selectedItemColor: ColorConst.primaryColor,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Rent Now',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: 'My Ads',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: ColorConst.primaryColor,
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Rent',
          elevation: 4,
          child: Icon(Icons.add),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryScreen()),
            );
            // CategoryScreen());
          }),
        ),
      ),
    );
  }
}
