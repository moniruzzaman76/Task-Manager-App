import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      tileColor: Colors.green,
      leading:CircleAvatar(
        backgroundImage: NetworkImage(""),
        radius: 25,
      ),
      title: Text("User Name",style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),),
      subtitle: Text("Email",style: TextStyle(
        color: Colors.white,
        fontSize: 13,
      ),),
    );
  }
}