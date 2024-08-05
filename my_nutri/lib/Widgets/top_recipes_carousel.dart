import 'package:flutter/material.dart';
import 'package:my_nutri/Data/top_recipes.dart';
import 'package:my_nutri/Models/top_recipes.dart';
import 'package:my_nutri/Screens/all_recipes.dart';
import 'package:my_nutri/Screens/top_recipes/top_recipes_details.dart';
import 'package:my_nutri/Widgets/Inner%20Widgets/top_recipes.dart';

class TopRecipesCarousel extends StatelessWidget {
  const TopRecipesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Recipes",
                    style: TextStyle(
                      color: Color.fromARGB(255, 18, 73, 86),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AllRecipesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 18, 73, 86),
                  ),
                  child: const Center(
                    child: Text(
                      "See more",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                TopRecipes recipes = toprecipe[index];

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TopRecipesDetails(
                        topr: recipes,
                      ),
                    ),
                  ),
                  child: TopRecipesCarousalCard(
                    trecipes: recipes,
                  ),
                );
              },
            )),
      ],
    );
  }
}
