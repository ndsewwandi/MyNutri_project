import 'package:flutter/material.dart';
import 'package:my_nutri/Data/top_recipes.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_diet_plans_details.dart';
import 'package:my_nutri/Widgets/view_recipe.dart';

class AllRecipesScreen extends StatefulWidget {
  const AllRecipesScreen({super.key});

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  List<bool> isSelected = [true, false, false];
  int currnetIndex = 0;
  String currentFilter = "";
  @override
  Widget build(BuildContext context) {
    if (currnetIndex == 0) {
      currentFilter = "all";
    } else if (currnetIndex == 1) {
      currentFilter = "veg";
    } else if (currnetIndex == 2) {
      currentFilter = "non-veg";
    }
    print(currentFilter);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                        iconSize: 30,
                        color: Color.fromARGB(255, 18, 73, 86),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/logoFinal.png",
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Top Recipes",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 99, 44, 44),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        isSelected: isSelected,
                        selectedColor: Color.fromARGB(255, 255, 255, 255),
                        color: Color.fromARGB(255, 99, 44, 44),
                        fillColor: Color.fromARGB(255, 99, 44, 44),
                        renderBorder: true,
                        borderRadius: BorderRadius.circular(100),
                        borderWidth: 2,
                        children: [
                          Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'All',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Veggi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 125,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Non-Veggi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        onPressed: (int newIndex) {
                          setState(() {
                            currnetIndex = newIndex;
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected[index] = true;
                              } else {
                                isSelected[index] = false;
                              }
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (currentFilter != "all")
                      for (var items in toprecipe)
                        if (items.type == currentFilter)
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => ViewRecipeScreen(
                                    imgPath: items.image,
                                    description: items.description,
                                    ingredents: items.ing,
                                    steps: items.steps,
                                    title: items.title,
                                  ),
                                ),
                              );
                            },
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
                                      child: SizedBox(
                                        width: 150,
                                        child: Image(
                                          image: AssetImage(items.image),
                                          fit: BoxFit.contain,
                                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            items.title,
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
                                            items.description,
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
                          ),
                    if (currentFilter == "all")
                      for (var items in toprecipe)
                        GestureDetector(
                          onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => ViewRecipeScreen(
                                    imgPath: items.image,
                                    description: items.description,
                                    ingredents: items.ing,
                                    steps: items.steps,
                                    title: items.title,
                                  ),
                                ),
                              );
                            },
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
                                    child: SizedBox(
                                      width: 150,
                                      child: Image(
                                        image: AssetImage(items.image),
                                        fit: BoxFit.contain,
                                      ),
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
                                          items.title,
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
                                          items.description,
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
                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
