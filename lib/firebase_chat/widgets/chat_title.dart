import 'package:flutter_firebase_chatapp/firebase_chat/models/index.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final User userProfile;
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
          backgroundImage: userProfile.avatar != null
              ? NetworkImage(userProfile.avatar!)
              : const AssetImage('assets/default_avatar.png') as ImageProvider,
        ), // NetworkImage
        title: Text(
          userProfile.name!,
        ));
  }
}
