import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/banner2_details.dart';

class Banner2 extends StatelessWidget {
  const Banner2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Vector 2.png"),
                  fit: BoxFit.cover,
                ),
                color: Color.fromARGB(255, 137, 213, 155),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    offset: Offset(0, -5),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 85, 85, 85),
                    offset: Offset(0, 5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/5141806_51154 1.png",
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Best Picks",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 27, 142, 52),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Text(
                            "The Pros and\nCons of Fast Food.",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 15, 79, 29),
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => Banner2Details(),
                                ),
                              );
                            },
                            child: Container(
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 27, 142, 52),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Read More...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 19.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
