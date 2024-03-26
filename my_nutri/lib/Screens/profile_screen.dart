import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String _userName = 'User123';
  var firstName = "Loding...";
  var userEmail = "Loding...";
  var lastName = "Loding...";
  var _isGetUserData = false;

  void getuserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (!_isGetUserData) {
      setState(() {
        firstName = userData.data()!["first-name"];
        lastName = userData.data()!["last-name"];
        userEmail = userData.data()!["email"];
      });
      _isGetUserData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getuserData();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 20),
            child: Text(
              "User Profile",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 103, 203, 106),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 10,
                      color: Color.fromARGB(100, 0, 0, 0),
                      spreadRadius: -20,
                    ),
                  ],
                ),
                child: Card(
                  color: const Color.fromARGB(255, 103, 203, 106),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 25, 110, 27),
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8, top: 5),
                                  child: Text(
                                    "First Name:",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  firstName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 25, 110, 27),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8, top: 5),
                                child: Text(
                                  "Last Name:",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                lastName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 25, 110, 27),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8, top: 5),
                                child: Text(
                                  "Email:",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                userEmail,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                right: 50,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -5),
                        blurRadius: 10,
                        color: Color.fromARGB(80, 0, 0, 0),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/02.png"),
                    backgroundColor: Color.fromARGB(255, 217, 217, 217),
                    radius: 110,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(195, 218, 37, 37),
                ),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                width: double.infinity,
                child: Center(
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Outfit-Regular",
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
