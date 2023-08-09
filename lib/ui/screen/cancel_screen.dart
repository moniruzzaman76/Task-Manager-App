import 'package:flutter/material.dart';
import '../../widgets/user_profile_banar.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({Key? key}) : super(key: key);

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),

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
