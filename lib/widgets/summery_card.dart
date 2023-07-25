import 'package:flutter/material.dart';

class SummeryCard extends StatelessWidget {
  const SummeryCard({
    super.key, required this.count, required this.title,
  });
  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Card(
        elevation: 4,
        color: Colors.blueGrey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(count,style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
              ),),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}