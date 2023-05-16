import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minor/const/color_const.dart';
import 'package:minor/models/form_model.dart';
import 'package:minor/screens/pages/category_list.dart';
import 'package:minor/screens/pages/my_ads.dart';
import 'package:minor/screens/pages/welcome_screen.dart';
// import 'package:provider/provider.dart';
// import '../../auth/auth_provider.dart';

import '../../utils/app_sizes.dart';
import '../../views/widgets/category_filter.dart';
import 'category_screen.dart';
import 'chats_home.dart';

class HomeScreen extends StatefulWidget {
  static double height10 = 0.0;
  static double width10 = 0.0;

  const HomeScreen({
    super.key,
  });

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
  User? user = FirebaseAuth.instance.currentUser;
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
    // final ap = Provider.of<AuthProvider>(context, listen: false);
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       ap.userSignOut().then(
        //             (value) => Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => const WelcomeScreen(),
        //               ),
        //             ),
        //           );
        //     },
        //     icon: const Icon(Icons.exit_to_app),
        //   ),
        // ],
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
                //SizedBox(height: AppSizes.height10 * 1.5),
                // Image.asset(
                //   ImageConst.appLogo,
                //   height: AppSizes.height10 * 2.7,
                // ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        //shrinkWrap: true,
        children: [
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
          filter(),
          //expend error
          // TODO:

          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("product").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot datasnapshot = snapshot.data as QuerySnapshot;
                  if (datasnapshot.docs.length > 0) {
                    print(datasnapshot.docs.length.toString());
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: datasnapshot.docs.length,
                      itemBuilder: (context, index) {
                        FormModel formmodel = FormModel.fromMap(
                            datasnapshot.docs[index].data()
                                as Map<String, dynamic>);
                        //print(index.toString());
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            color: Color.fromARGB(255, 229, 238, 238),
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(formmodel
                                              .profilepic
                                              .toString()))),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      formmodel.productName.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "₹" +
                                          formmodel.price.toString() +
                                          " " +
                                          formmodel.duration.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("📍" + formmodel.location.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("NO Add's Uploaded",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300)),
                    );
                  }
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text("check your internet connection"));
                } else {
                  return const Center(
                    child: Text("No Product available"),
                  );
                }
              } else {
                return const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator.adaptive(
                      value: 40,
                    ));
              }
            },
          )
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
            decoration: const BoxDecoration(
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
                  icon: GestureDetector(
                    onTap: () {
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChatHome(user: user!);
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.chat_bubble)),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Rent Now',
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onTap: () {
                       Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyAds(user: user!);
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.favorite_border,
                    ),
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
              MaterialPageRoute(
                  builder: (context) => CategoryScreen(firebaseuser: user!)),
            );
            // CategoryScreen());
          }),
        ),
      ),
    );
  }
}
