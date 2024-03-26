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
  var _enteredFirstName = "";
  var _enteredLastName = "";
  var _userName = "";
  var _enteredEmail = "";
  var _password = "";
  var errorMsg = "";
  var _isAuthenticaing = false;

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
          email: _enteredEmail, password: _password);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({
        "first-name": _enteredFirstName,
        "last-name": _enteredLastName,
        "user-name": _userName,
        "email": _enteredEmail,
      });

      _form.currentState!.reset();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        errorMsg = "Email adderss is already in use";
      } else if (error.code == "invalid-email") {
        errorMsg = "Email adderss is not valid";
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
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

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Image.asset("assets/02.png"),
            ),
            Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 19.8,
                            ),
                            Image.asset(
                              "assets/logo.png",
                              width: 160,
                            ),
                          ],
                        ),
                        Form(
                          key: _form,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(195, 51, 154, 163),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "First Name",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onSaved: (value) {
                                      _enteredFirstName = value!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Enter a valid name";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(195, 51, 154, 163),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onSaved: (value) {
                                      _enteredLastName = value!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Enter a valid name";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(195, 51, 154, 163),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "User Name",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onSaved: (value) {
                                      _userName = value!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value.trim().length < 6) {
                                        return "Enter a valid user name";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(195, 51, 154, 163),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onSaved: (value) {
                                      _enteredEmail = value!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          !value.contains("@")) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(195, 51, 154, 163),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onSaved: (value) {
                                      _password = value!;
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty ||
                                          value.trim().length < 6) {
                                        return "Password should be at least 6 characters";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(195, 51, 154, 163),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return "Password not match";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 62,
                        ),
                        if (!_isAuthenticaing)
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(195, 51, 154, 163),
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
                              elevation: 0,
                              padding: const EdgeInsets.all(17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(195, 51, 154, 163),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 97, 96, 96)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Log in",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 63, 170, 72)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
