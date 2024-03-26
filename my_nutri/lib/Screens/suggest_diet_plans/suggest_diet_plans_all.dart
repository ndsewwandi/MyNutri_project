import 'package:flutter/material.dart';
import 'package:my_nutri/Data/suggest_diet_plans.dart';
import 'package:my_nutri/Models/suggest_diet_plans.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_diet_plans_details.dart';

class SuggestDietPlanAll extends StatefulWidget {
  const SuggestDietPlanAll({super.key});

  @override
  State<SuggestDietPlanAll> createState() => _SuggestDietPlanAllState();
}

class _SuggestDietPlanAllState extends State<SuggestDietPlanAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/07.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 40, right: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.black,
                      ),
                      const Text(
                        "Suggest Diet Plans All",
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 23,
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
                  itemCount: suggestdietplan.length,
                  itemBuilder: (BuildContext context, int index) {
                    SuggestDietPlans suggestdietplans = suggestdietplan[index];
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
