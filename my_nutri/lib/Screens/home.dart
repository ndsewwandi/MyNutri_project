import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_nutri/Screens/diet_plan.dart';
import 'package:my_nutri/Screens/list.dart';
import 'package:my_nutri/Screens/profile_screen.dart';
import 'package:my_nutri/Screens/pros_and_cons_screen.dart';
import 'package:my_nutri/Widgets/top_recipes_carousel.dart';
import 'package:my_nutri/Widgets/trending_blogs_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  Widget? currentContent;
  var _isGetUserData = false;
  var userName = "";

  void _navigateToPage(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  void getuserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (!_isGetUserData) {
      setState(() {
        userName = userData.data()!["first-name"];
      });
      _isGetUserData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getuserData();
    currentContent = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "Hello $userName!",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 103, 203, 106),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 240, 225),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Trending",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 193, 52, 41),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const Text(
                                "The Pros and\nCons of Fast Food.",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 86, 41, 25),
                                  letterSpacing: 0.2,
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ReadMoreDetails(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 45,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 195, 95, 79),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: Text(
                                      "Read More...",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 19.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/06.png",
                            width: 130,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
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
                        color: const Color.fromARGB(195, 51, 154, 163),
                        borderRadius: BorderRadius.circular(20),
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
                                      color: Color.fromARGB(195, 18, 114, 167),
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
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 71, 71, 71)),
              ),
            ),
            const TopRecipesCarousel(),
            const TrendingBlogsCarousel(),
          ],
        ),
      ),
    );

    if (_currentTab == 1) {
      currentContent = const ListScreen();
    } else if (_currentTab == 2) {
      currentContent = const ProfileScreen();
    }
    return Scaffold(
      body: currentContent,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          selectedItemColor: const Color.fromARGB(195, 14, 192, 106),
          onTap: _navigateToPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                size: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
