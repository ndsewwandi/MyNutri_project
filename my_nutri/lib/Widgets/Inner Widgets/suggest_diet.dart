import 'package:flutter/material.dart';
import 'package:my_nutri/Models/suggest_diet_plans.dart';

class SuggestDietPlanCarousalCard extends StatelessWidget {
  const SuggestDietPlanCarousalCard({super.key, required this.splan});

  final SuggestDietPlans splan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 250,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 35.0,
            child: Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      splan.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        letterSpacing: 1.2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
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
                  tag:splan.image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 180.0,
                      width: 250.0,
                      image: AssetImage(splan.image),
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
                          splan.title,
                          style: const TextStyle(
                            letterSpacing: 1,
                            fontSize: 20,
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
