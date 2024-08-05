import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri/Widgets/profile_bar2.dart';
import 'package:my_nutri/Widgets/profiletextholder2.dart';
import 'package:my_nutri/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.weight,
    required this.bmi,
  });

  final String firstname;
  final String lastname;
  final String age;
  final int weight;
  final String bmi;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backdrop_3.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.00,
                  horizontal: screenSize.width * 0.04,
                ),
                child: Column(
                  children: [
                    ProfileBar2(
                      appName: "MyNutri",
                      acctype: "Lite Account",
                      username: "${widget.firstname} ${widget.lastname}",
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "User Profile",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 18, 73, 86),
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.002),
                        Container(
                          height: 2.5,
                          width: screenSize.width * 0.95,
                          color: const Color.fromARGB(255, 18, 73, 86),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Container(
                      // height: screenSize.height * 0.45,
                      width: screenSize.width * 0.92,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 107, 107, 107),
                            offset: Offset(0, 3),
                            blurRadius: 10,
                          ),
                        ],
                        color: const Color.fromARGB(255, 51, 154, 163),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProfileTextHolder2(
                                feildName: "First Name",
                                username: widget.firstname),
                            SizedBox(height: screenSize.height * 0.015),
                            ProfileTextHolder2(
                                feildName: "Last Name",
                                username: widget.lastname),
                            SizedBox(height: screenSize.height * 0.015),
                            ProfileTextHolder2(
                                feildName: "Age", username: widget.age),
                            SizedBox(height: screenSize.height * 0.015),
                            ProfileTextHolder2(
                                feildName: "Weight", username: "${widget.weight}"),
                            SizedBox(height: screenSize.height * 0.015),
                            ProfileTextHolder2(
                                feildName: "Current BMI value",
                                username: widget.bmi),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    SizedBox(
                      height: screenSize.height * 0.055,
                      width: screenSize.width * 0.4,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          padding: EdgeInsets.all(screenSize.width * 0.025),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 250, 94, 94),
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MyApp();
                              },
                            ),
                            (r) {
                              return false;
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            "LOG OUT",
                            style: TextStyle(
                              letterSpacing: 1.7,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Image.asset(
                      "assets/logo.png",
                      width: screenSize.width * 0.5,
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                  ],
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
