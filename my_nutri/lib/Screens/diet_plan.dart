import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/help_screen.dart';
import 'package:my_nutri/Screens/suggest_diet_plans/suggest_plan.dart';

class DietPlanPage extends StatefulWidget {
  const DietPlanPage({super.key});

  @override
  State<DietPlanPage> createState() => _DietPlanPageState();
}

class _DietPlanPageState extends State<DietPlanPage> {
  final _form = GlobalKey<FormState>();

  var selectedBodyWeight = "";
  var selectedWeightGoad = "";

  String? selectedBodyType;
  String? selectedFoodHabit;
  var _isAuthenticating = false;

  void _submit() {
    print("....................................start");

    if (selectedBodyType == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecte Body type"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    } else if (selectedFoodHabit == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecte Food habbit"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    FocusScope.of(context).unfocus();

    setState(() {
      _isAuthenticating = true;
    });

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const SuggestDietPlan(),
      ),
    );

    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Your Own Diet Plan"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              right: 16,
              bottom: 120,
              child: Image.asset(
                "assets/07.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 36, right: 36),
              child: Form(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(195, 18, 114, 167),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 6,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: selectedBodyType,
                              dropdownColor:
                                  const Color.fromARGB(195, 18, 114, 167),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedBodyType = newValue;
                                });
                              },
                              items: <String>[
                                'Slim',
                                'Muscular',
                                'Curvy'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                              hint: const Text(
                                "Body Type",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onSaved: (value) {
                                selectedBodyType = value;
                              },
                              validator: (value) {
                                if (selectedBodyType == null) {
                                  return "Select body type";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(195, 18, 114, 167),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Current Body Weight",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onSaved: (value) {
                              selectedBodyWeight = value!;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter body weight";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(195, 18, 114, 167),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Weight Goal",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onSaved: (value) {
                              selectedWeightGoad = value!;
                            },
                            validator: (value) {
                              if (selectedFoodHabit == null) {
                                return "Enter your weight goal";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(195, 18, 114, 167),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 6,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: selectedFoodHabit,
                              dropdownColor:
                                  const Color.fromARGB(195, 18, 114, 167),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedFoodHabit = newValue;
                                });
                              },
                              items: <String>[
                                'Balanced Diet',
                                'Meal Planning',
                                'Mindful Eating',
                                'Fiber-rich Foods',
                                'Healthy Snacking',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                              hint: const Text(
                                "Food Habits",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onSaved: (value) {
                                selectedFoodHabit = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Select a food habbit";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 320,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.all(17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor:
                                const Color.fromARGB(195, 18, 114, 167),
                          ),
                          child: const Center(
                            child: Text(
                              "Make Diet Plan ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Need Help?",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 97, 96, 96)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Help Section",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 63, 170, 72)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
