import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        return sizingInformation.isMobile
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50.0,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'OptimaDecision Consulting',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text('Email: contact@example.com'),
                      Text('Phone: +1 123 456 7890'),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text('FAQ'),
                      Text('Terms and Conditions'),
                      Text('Privacy Policy'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Follow Us',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.facebook),
                            onPressed: () {
                              // Handle Facebook button pressed
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.abc_outlined),
                            onPressed: () {
                              // Handle Twitter button pressed
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.abc_outlined),
                            onPressed: () {
                              // Handle Instagram button pressed
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50.0,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'OptimaDecision Consulting',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
