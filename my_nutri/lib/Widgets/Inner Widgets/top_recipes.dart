import 'package:flutter/material.dart';
import 'package:my_nutri/Models/top_recipes.dart';

class TopRecipesCarousalCard extends StatelessWidget {
  const TopRecipesCarousalCard({super.key, required this.trecipes});

  final TopRecipes trecipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 250,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              color:  Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: trecipes.image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 180.0,
                      width: 250.0,
                      image: AssetImage(trecipes.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          trecipes.title,
                          style: const TextStyle(
                            letterSpacing: 1,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
