import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/home.dart';

final user = FirebaseAuth.instance;

class GetUserDataScreen extends StatefulWidget {
  const GetUserDataScreen({super.key});

  @override
  State<GetUserDataScreen> createState() => _GetUserDataScreenState();
}

class _GetUserDataScreenState extends State<GetUserDataScreen> {
  String userEmail = 'Loading...';
  String firstName = "Loding...";
  String lastName = "Loding...";
  String email = "Loding...";
  String bodyType = "Loding...";
  String age = "Loding...";
  int weight = 0;
  int height = 0;

  bool _isGetUserData = false;
  bool isGettingUserData = false;

  Future<void> getUserData() async {
      setState(() {
        isGettingUserData = true;
      });
      print("Strting..........................................................");
      final userData = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.currentUser!.uid)
          .get();
    print("Done1..........................................................");
      // if (!_isGetUserData) {
      //   firstName = userData["first-name"];
      //   lastName = userData["last-name"];
      //   age = userData["age"];
      //   weight = userData["weight"];
      //   height = userData["height"];
      //   email = userData["email"];
      //   setState(() {
      //     _isGetUserData = true;
      //   });
      //   loginSuccess();
      //   return;
      // }
      loginSuccess();

    setState(() {
      isGettingUserData = false;
    });
  }

  void loginSuccess() {
    if (_isGetUserData) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(
            // firstName: firstName,
            // lastName: lastName,
            // age: age,
            // height: height,
            // weight: weight,
            // email: email,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 150,
            ),
            const SizedBox(
              height: 16,
            ),
            if (isGettingUserData)
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: const Color.fromARGB(255, 51, 154, 163),
                  ),
                ),
              ),
            if (_isGetUserData)
              Icon(
                Icons.done_outline_rounded,
                color: Colors.green,
                size: 40,
              ),
            if (isGettingUserData)
              Text(
                "Getting user information",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 18, 73, 86),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            if (_isGetUserData)
              Text(
                "Done!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 18, 73, 86),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              )
          ],
        ),
      ),
    );
  }
}
