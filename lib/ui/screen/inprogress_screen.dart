import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
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
    return Scaffold(
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
            const ListTileTask(text: "In Progress",color:Colors.red),
          ],
        ),
      ),
    );
  }
}
