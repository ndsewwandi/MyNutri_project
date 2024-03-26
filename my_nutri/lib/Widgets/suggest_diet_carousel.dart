import 'package:flutter/material.dart';
import 'package:my_nutri/Data/suggest_diet_plans.dart';
import 'package:my_nutri/Models/suggest_diet_plans.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_diet_plans_all.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_diet_plans_details.dart';
import 'package:my_nutri/Widgets/Inner%20Widgets/suggest_diet.dart';

class SuggestDietCarousel extends StatelessWidget {
  const SuggestDietCarousel({super.key});

  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Suggest Diet Plans",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>  const SuggestDietPlanAll(),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                   
                    letterSpacing: 1.0,
                    color: Color.fromARGB(195, 18, 114, 167),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
             SuggestDietPlans suggestplan =suggestdietplan[index];
                 
                 return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SuggestDietPlansDetails(
                     suggestdp: suggestplan,
                    ),
                  ),
                ),
              
                
                child: SuggestDietPlanCarousalCard(splan: suggestplan,),
                 );
              
            },
            )
          ),
      ],
    );
  }
}
