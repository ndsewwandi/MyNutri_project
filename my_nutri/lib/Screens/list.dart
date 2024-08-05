import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/backdrop_3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 130, bottom: 20),
                child: Text(
                  "Health Tips",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              _buildSection(
                context,
                title: 'Healthy Body',
                content:
                    'A healthy body is essential for overall well-being. It requires a combination of regular exercise, proper nutrition, adequate sleep, and stress management. Regular physical activity helps improve cardiovascular health, build muscle strength, and maintain a healthy weight. Eating a balanced diet rich in fruits, vegetables, lean proteins, and whole grains provides the necessary nutrients for optimal body function. Additionally, getting enough sleep and managing stress levels are crucial for maintaining a healthy body and mind.',
              ),
              _buildSection(
                context,
                title: 'Exercises',
                content:
                    'Regular exercise is key to maintaining a healthy body. It helps improve cardiovascular health, strengthen muscles, and boost mood. Different types of exercises offer various benefits. Aerobic exercises such as walking, running, and cycling improve endurance and cardiovascular fitness. Strength training exercises like weightlifting and bodyweight exercises increase muscle mass and strength. Flexibility exercises such as yoga and stretching improve flexibility and range of motion. Incorporating a combination of aerobic, strength, and flexibility exercises into your routine ensures overall fitness and well-being.',
              ),
              _buildSection(
                context,
                title: 'Healthy Food',
                content:
                    'Eating a healthy diet is essential for supporting overall health and well-being. A balanced diet rich in fruits, vegetables, lean proteins, and whole grains provides essential nutrients such as vitamins, minerals, and antioxidants. These nutrients help support immune function, promote healthy digestion, and reduce the risk of chronic diseases such as heart disease, diabetes, and cancer. Including a variety of foods from all food groups ensures that you get a wide range of nutrients to support optimal health. Additionally, staying hydrated by drinking plenty of water throughout the day is important for overall health.',
              ),
              _buildSection(
                context,
                title: 'Importance of Hydration',
                content:
                    'Staying hydrated is essential for maintaining good health. Water plays a vital role in various bodily functions, including regulating body temperature, lubricating joints, and transporting nutrients and waste products. Dehydration can lead to symptoms such as fatigue, headaches, dizziness, and decreased cognitive function. It is important to drink an adequate amount of water throughout the day to stay hydrated and support overall health.',
              ),
              _buildSection(
                context,
                title: 'Benefits of Sleep',
                content:
                    'Getting enough sleep is crucial for overall health and well-being. During sleep, the body repairs and regenerates tissues, consolidates memories, and regulates hormones. Adequate sleep is associated with better cognitive function, mood regulation, and immune function. Chronic sleep deprivation can lead to a variety of health problems, including increased risk of obesity, diabetes, cardiovascular disease, and mental health disorders. Establishing healthy sleep habits and prioritizing quality sleep is essential for optimal health.',
              ),
              _buildSection(
                context,
                title: 'Role of Stress Management',
                content:
                    'Stress management is important for maintaining both physical and mental health. Chronic stress can negatively impact the immune system, cardiovascular health, digestion, and sleep patterns. It can also contribute to mental health disorders such as anxiety and depression. Implementing stress-reduction techniques such as mindfulness meditation, deep breathing exercises, yoga, and spending time in nature can help lower stress levels and promote overall well-being. Finding healthy coping mechanisms and managing stress effectively is key to maintaining a balanced and healthy lifestyle.',
              ),
              _buildSection(
                context,
                title: 'Importance of Mental Health Awareness',
                content:
                    'Mental health awareness is crucial for promoting overall well-being. It involves understanding and recognizing the importance of mental health and acknowledging its impact on daily life. By raising awareness about mental health issues, destigmatizing mental illness, and providing support and resources, individuals can seek help when needed and access the necessary treatment and support services. Prioritizing mental health awareness contributes to creating a more supportive and understanding society.',
              ),
              _buildSection(
                context,
                title: 'Benefits of Regular Physical Activity',
                content:
                    'Regular physical activity offers numerous benefits for both physical and mental health. It helps maintain a healthy weight, improves cardiovascular health, and reduces the risk of chronic diseases such as heart disease, diabetes, and cancer. Additionally, exercise promotes better mood regulation, reduces stress and anxiety levels, and enhances cognitive function and memory. Incorporating regular physical activity into daily life can lead to improved overall well-being and quality of life.',
              ),
              _buildSection(
                context,
                title: 'Nutritional Guidelines for a Balanced Diet',
                content:
                    'Following nutritional guidelines for a balanced diet is essential for meeting nutrient needs and supporting overall health. A balanced diet includes a variety of foods from all food groups, such as fruits, vegetables, whole grains, lean proteins, and healthy fats. It is important to prioritize nutrient-dense foods and limit the intake of processed foods, sugary beverages, and excessive amounts of salt and saturated fats. By following nutritional guidelines, individuals can ensure they are getting the necessary nutrients to support optimal health and well-being.',
              ),
              _buildSection(
                context,
                title: 'Importance of Social Support Networks',
                content:
                    'Social support networks play a crucial role in promoting health and well-being. Having strong social connections and support systems can provide emotional support, encouragement, and a sense of belonging. Social support networks can help individuals cope with stress, navigate difficult situations, and improve overall mental health. Cultivating meaningful relationships, fostering social connections, and participating in social activities are important aspects of maintaining a healthy and fulfilling life.',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/logo.png",
                    width: 160,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required String content}) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 71, 71, 71),
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            content,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
