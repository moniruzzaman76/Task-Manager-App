import 'package:flutter/material.dart';
import '../../widgets/list_tile_task.dart';
import '../../widgets/user_profile_banar.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileBanner(),
            ListTileTask(text: "Complete",color: Colors.pink,),
          ],
        ),
      ),
    );
  }
}
