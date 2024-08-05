import 'package:flutter/material.dart';

class ViewRecipeScreen extends StatelessWidget {
  const ViewRecipeScreen({
    super.key,
    required this.imgPath,
    required this.description,
    required this.ingredents,
    required this.steps,
    required this.title,
  });

  final String imgPath;
  final String title;
  final String description;
  final String ingredents;
  final String steps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Hero(
                    tag: imgPath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(195, 18, 114, 167),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Text(
                description,
                style: const TextStyle(
                    letterSpacing: 1.2, fontSize: 15.5, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(195, 18, 114, 167),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                ingredents,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Method",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(195, 18, 114, 167),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                steps,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/logo.png",
                width: 160,
              ),
            )
          ],
        ),
      ),
    );
  }
}
