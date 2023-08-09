import 'package:flutter/material.dart';

class SummeryCard extends StatelessWidget {
  const SummeryCard({
    super.key, required this.count, required this.title,
  });
  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 90,
      child: Card(
        elevation: 4,
        color: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(count,style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600
              ),),
              Text(title,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}