import '../models/user_profile.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final UserProfile userProfile;
  final Function onTap;
  const ChatTile({super.key, required this.userProfile, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          onTap();
        },
        dense: false,
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: userProfile.pfpURL != null
              ? NetworkImage(userProfile.pfpURL!)
              : const AssetImage('assets/default_avatar.png') as ImageProvider,
        ), // NetworkImage
        title: Text(
          userProfile.name!,
        ));
  }
}
