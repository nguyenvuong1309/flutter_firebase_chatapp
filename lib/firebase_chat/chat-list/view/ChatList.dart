// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
// import 'package:flutter_firebase_chatapp/l10n/l10n.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_firebase_chatapp/firebase_chat/services/index.dart';
import 'package:flutter_firebase_chatapp/firebase_chat/models/index.dart';
import 'package:flutter_firebase_chatapp/firebase_chat/widgets/index.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //        appBar:  AppBar(
  //         title: const Text("Chat list 2"),
  //       ),
  //       body: Container(child: Text("user"),)
  //   );
  // }
  @override
  State<ChatList> createState() => ChatListState();
}

class ChatListState extends State<ChatList> {
  final GetIt _getIt = GetIt.instance;

  late AuthService _authService;
  late NavigationService _navigationService;
  late AlertService _alertService;
  late DatabaseService _databaseService;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _alertService = _getIt.get<AlertService>();
    _databaseService = _getIt.get<DatabaseService>();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Color(0xFF2F7682),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        child: _chatsList(),
      ),
    );
  }

  Widget _chatsList() {
    return StreamBuilder(
        stream: _databaseService.getUserProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Unable to load data."),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            final users = snapshot.data!.docs;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index].data();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ChatTile(
                    userProfile: user,
                    onTap: () async {
                      final chatExists = await _databaseService.checkChatExists(
                        _authService.user!.uid,
                        user.uid!,
                      );
                      if (!chatExists) {
                        await _databaseService.createNewChat(
                          _authService.user!.uid,
                          user.uid!,
                        );
                      }
                      _navigationService.push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Container();
                            // return ChatPage(
                            //   chatUser: user,
                            // ); // ChatPage
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
