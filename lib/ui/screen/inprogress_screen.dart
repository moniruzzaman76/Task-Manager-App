import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
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
            Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return const SizedBox();
                    // return  ListTileTask(data: ,color: Colors.green,);
                  },
                  separatorBuilder: (context,index){
                    return const Divider(
                      height: 4,
                      thickness: 1,
                    );
                  },

                )
            )
          ],
        ),
      ),
    );
  }
}
