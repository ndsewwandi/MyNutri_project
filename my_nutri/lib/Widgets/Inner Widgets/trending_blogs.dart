import 'package:flutter/material.dart';
import 'package:my_nutri/Models/trending_blogs.dart';

class TrendingBlogsCarousalCard extends StatelessWidget {
  const TrendingBlogsCarousalCard({super.key, required this.trblog});

  final TrendingBlogs trblog;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 250,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
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
                  tag: trblog.image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 180.0,
                      width: 250.0,
                      image: AssetImage(trblog.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 45, 45, 45),
                          Color.fromARGB(194, 96, 96, 96),
                          Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(0, 255, 255, 255),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
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
                          trblog.title,
                          style: const TextStyle(
                            letterSpacing: 1,
                            fontSize: 22,
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
