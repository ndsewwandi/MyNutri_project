import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_nutri/Data/suggest_diet_plans.dart';
import 'package:my_nutri/Models/suggest_diet_plans.dart';
import 'package:my_nutri/Screens/all_recipes.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_diet_plans_all.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_diet_plans_details.dart';

final randomizor = Random();

class SuggestDietPlan extends StatefulWidget {
  const SuggestDietPlan({super.key});

  @override
  State<SuggestDietPlan> createState() => _SuggestDietPlanState();
}

class _SuggestDietPlanState extends State<SuggestDietPlan> {
  final List<SuggestDietPlans> shuffledPlans = getShuffledList();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/backdrop_3.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: screenSize.height,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 40, right: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.black,
                      ),
                      const Text(
                        "Suggest Diet Plans",
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: randomizor.nextInt(5) + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < suggestdietplan.length) {
                      SuggestDietPlans suggestdietplans = shuffledPlans[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SuggestDietPlansDetails(
                              suggestdp: suggestdietplans,
                            ),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    width: 150,
                                    image: AssetImage(suggestdietplans.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        suggestdietplans.title,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        suggestdietplans.description,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("No any diet plans sugessted!"),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllRecipesScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "See all Diet Plans",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(195, 18, 114, 167),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
