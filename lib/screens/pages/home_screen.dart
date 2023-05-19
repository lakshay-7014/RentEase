import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:minor/const/color_const.dart';
import 'package:minor/models/form_model.dart';
import 'package:minor/models/user_model.dart';
import 'package:minor/screens/pages/account_screen.dart';
import 'package:minor/screens/pages/category_list.dart';
import 'package:minor/screens/pages/my_ads.dart';
import 'package:minor/screens/pages/product_details.dart';
//import 'package:minor/screens/pages/user_detail_screen.dart';
import '../../views/widgets/category_filter.dart';
import 'category_screen.dart';
import 'chats_home.dart';

class HomeScreen extends StatefulWidget {
  static double height10 = 0.0;
  static double width10 = 0.0;
  final String category;

  const HomeScreen({super.key, required this.category});

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
  String? name = ' ';
  String? email = ' ';
  String? bio = ' ';
  String? profilePic = "assets/images/default_image1.png";
  String? phoneNumber = ' ';
  String? aadhar = ' ';

  Future<void> _getData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        name = data['name'];
        aadhar = data['aadhar'];
        bio = data['bio'];
        email = data['email'];
        profilePic = data['profilePic'];
        phoneNumber = data['phoneNumber'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  var currentIndex = 0;
  int _selectedPageIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  void _selectPage(int index) {
    if (index == 0) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen(
              category: "NULL",
            );
          },
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ChatHome(user: user!);
          },
        ),
      );
    } else if (index == 3) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MyAds(user: user!);
          },
        ),
      );
    } else if (index == 4) {
      // Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AccountScreen(
                email: email,
                profilePic: profilePic,
                aadhar: aadhar,
                phoneNumber: phoneNumber,
                bio: bio,
                name: name!);
          },
        ),
      );
    }
    // setState(() {
    //   _selectedPageIndex = index;
    // });
  }

  final List<String> imgList = [
    'assets/images/img17.png',
    'assets/images/img12.png',
    'assets/images/img15.png',
  ];

  @override
  Widget build(BuildContext context) {
    // final ap = Provider.of<AuthProvider>(context, listen: false);
    double displayWidth = MediaQuery.of(context).size.width;
// Stream<QuerySnapshot> _getStream(String s) {
//   if () {
//     return FirebaseFirestore.instance.collection("product").snapshots();
//   } else {
//     return FirebaseFirestore.instance.collection("product").where("category",isEqualTo: s).snapshots();
//   }
// }
    Stream<QuerySnapshot> fetchStream() {
      Stream<QuerySnapshot> stream;

      if (widget.category == "NULL") {
        stream = FirebaseFirestore.instance.collection("product").snapshots();
      } else {
        stream = FirebaseFirestore.instance
            .collection("product")
            .where("category", isEqualTo: widget.category)
            .snapshots();
      }

      return stream;
    }

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
          filter(context),
          //expend error
          // TODO:
          StreamBuilder(
            stream: fetchStream(),
            //FirebaseFirestore.instance.collection("product").snapshots(),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetails(
                                      firebaseuser: user!,
                                      formmodel: formmodel,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(20),
                              ),
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
                                        image: NetworkImage(
                                          formmodel.profilepic.toString(),
                                        ),
                                        // image: AssetImage(
                                        //     "assets/images/img11.png"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          formmodel.productName.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "₹ " +
                                              formmodel.price.toString() +
                                              " " +
                                              formmodel.duration.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              formmodel.location.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("No Product available",
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
