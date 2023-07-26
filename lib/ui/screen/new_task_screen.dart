import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/create_task_Screen.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
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
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>const UpdateProfileScreen()));
              } ,
              child: const UserProfileBanner(),
            ),
            const Row(
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
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>const CreateNewTaskScreen()));
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}




