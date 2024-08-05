import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/pros_and_cons_screen.dart';

class Banner1 extends StatelessWidget {
  const Banner1({super.key});

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
                  image: AssetImage("assets/Vector 3.png"),
                  fit: BoxFit.cover,
                ),
                color: const Color.fromARGB(255, 255, 240, 225),
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
            ),
            Positioned(
              left: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Trending",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 193, 52, 41),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Text(
                      "The Pros and\nCons of Fast Food.",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 86, 41, 25),
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReadMoreDetails(),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 195, 95, 79),
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
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                "assets/06.png",
                width: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}
