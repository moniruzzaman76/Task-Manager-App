import 'package:flutter/material.dart';
import '../../widgets/list_tile_task.dart';
import '../../widgets/summery_card.dart';
import '../../widgets/user_profile_banar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileBanner(),
            Row(
              children: [
                SummeryCard(
                  count: '4',
                  title: "New Task",
                ),
                SummeryCard(
                  count: '4',
                  title: "In Progress",
                ),
                SummeryCard(
                  count: '4',
                  title: "Completed",
                ),
                SummeryCard(
                  count: '4',
                  title: "Cancel",
                ),
              ],
            ),
            ListTileTask(),
          ],
        ),
      ),
    );
  }
}




