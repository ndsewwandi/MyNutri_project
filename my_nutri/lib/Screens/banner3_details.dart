import 'package:flutter/material.dart';

class Banner3Details extends StatelessWidget {
  const Banner3Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pros and Cons of Fast Food',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color.fromARGB(255, 0, 67, 81),
      ),
      body: Container(
        color: Color.fromARGB(255, 2, 140, 170),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                  'assets/8355389_3891046.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pros of Fast Food:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Convenience: Fast food is easily accessible and saves time, especially for busy individuals.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                '2. Affordability: Fast food is often cheaper compared to dining at restaurants, making it budget-friendly.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                '3. Variety: Fast food chains offer a wide range of menu options to choose from, catering to different tastes and preferences.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Cons of Fast Food:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Lack of Nutrition: Fast food is often high in calories, fat, sugar, and sodium, and lacks essential nutrients.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                '2. Health Risks: Regular consumption of fast food is associated with various health issues such as obesity, heart disease, and diabetes.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                '3. Environmental Impact: Fast food production and packaging contribute to environmental pollution and waste.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Conclusion:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'While fast food offers convenience and affordability, it comes with health and environmental drawbacks. It is essential to consume fast food in moderation and prioritize balanced nutrition.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 110),
                child: Image.asset(
                  "assets/logo.png",
                  width: 160,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}