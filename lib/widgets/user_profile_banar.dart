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
        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",scale:1),
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