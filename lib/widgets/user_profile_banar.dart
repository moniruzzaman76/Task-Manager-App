import 'package:flutter/material.dart';
import 'package:task_manager/data/model/auth_utility.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

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
    );
  }
}