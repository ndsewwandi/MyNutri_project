import 'package:flutter/material.dart';
import 'package:my_nutri/Models/top_recipes.dart';

class TopRecipesDetails extends StatelessWidget {
  const TopRecipesDetails({
    super.key,
    required this.topr,
  });
  final TopRecipes topr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Hero(
                    tag: topr.image,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(topr.image),
                        fit: BoxFit.cover,
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
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                topr.title,
                style: const TextStyle(
                    letterSpacing: 1.2,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(195, 18, 114, 167),),
                    
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Text(
                topr.description,
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
                        color:   Color.fromARGB(195, 18, 114, 167),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                topr.ing,
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
                        color:   Color.fromARGB(195, 18, 114, 167),),
                  ),
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                topr.steps,
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
