import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Section'),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The "Create a Diet Plan" feature allows you to generate a personalized diet plan based on your body type and food habits.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'How to Use:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Select your body type from the dropdown menu (e.g., Slim, Muscular, Curvy).',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '2. Choose your food habits from the dropdown menu (e.g., Balanced Diet, Meal Planning, Mindful Eating).',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '3. Enter your current body weight and your weight goal in the provided fields.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '4. Click on the "Make Diet Plan" button to generate your personalized diet plan.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Troubleshooting Tips:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'If you encounter any issues or errors while creating your diet plan, please double-check the information you entered and ensure that all fields are filled out correctly.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Support:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'If you need further assistance or have any questions, please contact our support team at support@example.com.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'We appreciate your feedback!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your feedback helps us improve our app. If you have any suggestions or ideas for enhancing the "Create a Diet Plan" feature, please let us know by filling out the feedback form in the app.',
              style: TextStyle(fontSize: 16),
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
    );
  }
}
