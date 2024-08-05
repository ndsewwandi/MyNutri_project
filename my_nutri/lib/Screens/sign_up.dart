import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/login_page.dart';

final _firebase = FirebaseAuth.instance;

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _form = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String age = "";
  int weight = 0;
  String bodyType = "";
  String email = "";
  String password = "";
  var errorMsg = "";
  var _isAuthenticaing = false;
  bool isObsecured = true;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    setState(() {
      _isAuthenticaing = true;
    });

    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({
        "first-name": firstName,
        "last-name": lastName,
        "age": age,
        "weight": weight,
        "body-type": bodyType,
        "email": email,
      });
    } catch (error) {
      errorMsg = "Database error. Please try again!";

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
      setState(() {
        _isAuthenticaing = false;
      });
      return;
    }
    FirebaseAuth.instance.signOut();

    setState(() {
      _isAuthenticaing = false;
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginPage();
        },
      ),
      (r) {
        return false;
      },
    );

    // print(firstName);
    // print(lastName);
    // print(age);
    // print(weight);
    // print(bodyType);
    // print(email);
    // print(password);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/backdrop_3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Positioned(
              //   bottom: 100,
              //   left: 0,
              //   right: 0,
              //   child: Image.asset("assets/02.png"),
              // ),
              Container(
                width: size.width,
                height: size.height,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          width: 160,
                        ),
                        Form(
                          key: _form,
                          child: Column(
                            children: [
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  firstName = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter a valid name";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  lastName = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter a valid name";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Age",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  age = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter a valid age";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.none,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Weight",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  weight = int.parse(value!);
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Enter a valid body weight";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                items: [
                                  DropdownMenuItem(
                                    value: 'thin',
                                    child: Text(
                                      'Thin',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'average',
                                    child: Text(
                                      'Average',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'fat',
                                    child: Text(
                                      'Fat',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  bodyType = value!;
                                },
                                decoration: InputDecoration(
                                  labelText: "Body type",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value == null) {
                                    return "Select a body type";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.none,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  email = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.trim().contains("@")) {
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.none,
                                obscureText: isObsecured,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () => setState(() {
                                      isObsecured = !isObsecured;
                                    }),
                                    child: Icon(
                                      isObsecured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  password = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      value.trim().length < 5) {
                                    return "Enter a password with 6 characters";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 56,
                        ),
                        if (!_isAuthenticaing)
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 51, 154, 163),
                            ),
                            child: const Center(
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        if (_isAuthenticaing)
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),

                              backgroundColor:
                                  const Color.fromARGB(255, 51, 154, 163),
                            ),
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 81, 81, 81),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Log in",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 51, 154, 163),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
