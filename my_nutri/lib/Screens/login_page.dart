import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/sign_up.dart';
import 'package:my_nutri/main.dart';

final _firebase = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  var _enteredEmail = "";
  var _enteredPassword = "";
  var _isAuthenticating = false;
  bool isObsecured = true;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    setState(() {
      _isAuthenticating = true;
    });

    try {
      await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Signup faild"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    setState(() {
      _isAuthenticating = false;
    });
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
        child: SingleChildScrollView(
          child: Stack(children: [
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/02.png",
              ),
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
                            width: 180,
                          ),
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: const Color.fromARGB(255, 18, 73, 86),
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: screenSize.width * 0.9,
                              child: TextFormField(
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
                                keyboardType: TextInputType.emailAddress,
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
                            SizedBox(
                              width: screenSize.width * 0.9,
                              child: TextFormField(
                                obscureText: isObsecured,
                                style: const TextStyle(color: Colors.black),
                                textCapitalization: TextCapitalization.none,
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
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      width: 2,
                                    ),
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
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: const Color.fromARGB(
                                            255, 51, 154, 163),
                                        width: 3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onSaved: (value) {
                                  _enteredPassword = value!;
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      value.trim().length < 6) {
                                    return "Pleace enter valid password";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 18, 73, 86),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Column(
                        children: [
                          if (!_isAuthenticating)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 51, 154, 163),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          if (_isAuthenticating)
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 51, 154, 163),
                              ),
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have An Account?",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 81, 81, 81),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Signupscreen()),
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 51, 154, 163),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
