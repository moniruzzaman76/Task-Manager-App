import 'package:flutter/material.dart';
import '../../widgets/list_tile_task.dart';
import '../../widgets/user_profile_banar.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileBanner(),
            ListTileTask(),
          ],
        ),
      ),
    );
  }
}
