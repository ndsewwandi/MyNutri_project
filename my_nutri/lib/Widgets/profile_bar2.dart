import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileBar2 extends StatelessWidget {
  const ProfileBar2({
    super.key,
    required this.appName,
    required this.acctype,
    required this.username,
  });

  final String username;
  final String appName;
  final String acctype;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: screenSize.height * 0.17,
          width: screenSize.width * 0.91,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 51, 154, 163),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 107, 107, 107),
                offset: Offset(0, 3),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              //SizedBox(width: screenSize.width * 0.015),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: screenSize.height * 0.17,
                  width: screenSize.width * 0.28,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Image.asset(
                    "assets/logoFinal 1.png",
                  ),
                ),
              ),

              SizedBox(
                width: screenSize.width / 1.8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            acctype,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
