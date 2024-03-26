import 'package:flutter/material.dart';
import 'package:my_nutri/Data/trending_blogs.dart';
import 'package:my_nutri/Models/trending_blogs.dart';
import 'package:my_nutri/Screens/trending_blogs/trending_blogs_details.dart';
import 'package:my_nutri/Widgets/Inner%20Widgets/trending_blogs.dart';

class TrendingBlogsCarousel extends StatelessWidget {
  const TrendingBlogsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Trending Blogs",
                style: TextStyle(
                  color: Color.fromARGB(255, 96, 40, 40),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                TrendingBlogs trblogs = trendingblog[index];

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TrendingBlogsDetails(
                        trendingb: trblogs,
                      ),
                    ),
                  ),
                  child: TrendingBlogsCarousalCard(
                    trblog: trblogs,
                  ),
                );
              },
            )),
      ],
    );
  }
}
