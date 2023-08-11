import 'package:flutter/material.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/ui/auth/login_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../ui/assets_utils/assets_utils.dart';

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
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          child: Image.asset(AssetUtils.profilePic,fit: BoxFit.cover,),
        ),
      ),

      title: Text(
        "${AuthUtility.userInfo.data?.firstName ?? ""} ${AuthUtility.userInfo.data?.lastName ?? ""}",
        style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
            fontWeight: FontWeight.w500
      ),),
      subtitle:  Text(AuthUtility.userInfo.data?.email ?? "",style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: .5
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