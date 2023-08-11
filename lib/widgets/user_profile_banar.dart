import 'package:flutter/material.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/ui/auth/login_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      // using CachedNetworkImage package
      leading: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: AuthUtility.userInfo.data?.photo ?? "",
        errorWidget: (context, url, error) => const Icon(Icons.person,size: 45,),
      ),

      title: Text(
        "${AuthUtility.userInfo.data?.firstName ?? ""} ${AuthUtility.userInfo.data?.lastName ?? ""}",
        style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
            fontWeight: FontWeight.w500
      ),),
      subtitle:  Text(AuthUtility.userInfo.data?.email ?? "",style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
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