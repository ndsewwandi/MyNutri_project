import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri/Models/get_started.dart';
import 'package:my_nutri/Screens/diet_plan.dart';
import 'package:my_nutri/Screens/get_started.dart';
import 'package:my_nutri/Screens/list.dart';
import 'package:my_nutri/Screens/profile_screen.dart';
import 'package:my_nutri/Screens/pros_and_cons_screen.dart';
import 'package:my_nutri/Widgets/banner1.dart';
import 'package:my_nutri/Widgets/banner2.dart';
import 'package:my_nutri/Widgets/banner3.dart';
import 'package:my_nutri/Widgets/top_recipes_carousel.dart';
import 'package:my_nutri/Widgets/trending_blogs_carousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  Widget? currentContent;
  bool _isGetUserData = false;
  String firstName = "";
  String lastName = "";
  String email = "";
  int weight = 0;
  int height = 0;
  String age = "";

  final PageController _controller = PageController();

  void _navigateToPage(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  Future<void> getuserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();
    print(userData.data());
    if (!_isGetUserData) {
      setState(() {
        firstName = userData.data()!["first-name"];
        lastName = userData.data()!["last-name"];
        email = userData.data()!["email"];
        age = userData.data()!["age"];
        weight = userData.data()!["weight"];
        _isGetUserData = true;
      });
      print(firstName);
      print(lastName);
      print(age);
      print(email);
      print(weight);
      print(height);
    }
  }

  @override
  void initState() {
    super.initState();
    getuserData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    currentContent = Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/backdrop_3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Hello $firstName!",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 51, 154, 163),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 1),
                child: Text(
                  "Find, track and eat healthy food.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 95, 95, 95),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView(
                      controller: _controller,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Banner1(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Banner2(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Banner3(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 12,
                        dotHeight: 12,
                        activeDotColor: Color.fromARGB(255, 18, 73, 86),
                        dotColor: Color.fromARGB(255, 51, 154, 163),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 51, 154, 163),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 85, 85, 85),
                              offset: Offset(0, 5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Get Your\nOwn Diet Plan",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DietPlanPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    "Create Plan",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(195, 18, 114, 167),
                                        fontSize: 19.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Text(
                  "An ounce of prevention is worth a pound of cure. \n- Benjamin Franklin -",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 71, 71, 71)),
                ),
              ),
              const TopRecipesCarousel(),
              const TrendingBlogsCarousel(),
            ],
          ),
        ),
      ),
    );

    if (_currentTab == 1) {
      currentContent = const ListScreen();
    } else if (_currentTab == 2) {
      currentContent = ProfileScreen(
        firstname: firstName,
        lastname: lastName,
        age: age,
        weight: weight,
        bmi: "20.43",
      );
    }
    return Scaffold(
      body: currentContent,
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromARGB(255, 51, 154, 163),
        height: 55,
        elevation: 3,
        shadowColor: Colors.black87,
        color: Colors.white,
        onTap: _navigateToPage,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.menu_book_sharp, title: 'Blog'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
    );
  }
}
