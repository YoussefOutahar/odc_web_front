import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.date,
      required this.description});

  final String imageUrl;
  final String title;
  final DateTime date;
  final String description;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 340,
      width: 540,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 170,
              width: 540,
              child: Image.asset(
                "assets/images/OpenSourceImages/img3.png",
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(widget.date.toString()),
                    const SizedBox(height: 20),
                    Text(widget.description),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
