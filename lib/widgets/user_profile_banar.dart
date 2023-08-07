import 'package:flutter/material.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/ui/screen/login_screen.dart';

class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return  ListTile(

      tileColor: Colors.green,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(AuthUtility.userInfo.data?.photo ?? "",scale:1),
        radius: 25,
        onBackgroundImageError: (object, stackTrace){
           const Icon(Icons.image);
        },
      ),
      title: Text(
        "${AuthUtility.userInfo.data?.firstName ?? ""} ${AuthUtility.userInfo.data?.lastName ?? ""}",
        style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),),
      subtitle:  Text(AuthUtility.userInfo.data?.email ?? "",style: const TextStyle(
        color: Colors.white,
        fontSize: 13,
      ),),
      trailing: IconButton(onPressed: () async {
        await AuthUtility.clearUserInfo();
        if(mounted){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
        }
      }, icon: const Icon(Icons.login_outlined,color: Colors.white,)),
    );
  }
}