import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../services/alert_service.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../services/navigation_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        ), // Text
        actions: [
          IconButton(
            onPressed: () async {
              bool result = await _authService.logout();
              print(result);
              if (result) {
                _alertService.showToast(
                  text: "Successfully logged out!",
                  icon: Icons.check,
                );
                _navigationService.pushReplacementNamed("/login");
              }
            },
            color: Color(0xFF2F7682),
            icon: const Icon(
              Icons.logout,
            ), // Icon
          ), // IconButton
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
        ), // EdgeInsets.symmetric
        child: _chatsList(),
      ), // Padding
    ); // SafeArea
  }

  Widget _chatsList() {
    return StreamBuilder(
        stream: _databaseService.getUserProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Unable to load data."),
            ); // Center
          }
          print("snapshot.data ${snapshot.data}");
          if (snapshot.hasData && snapshot.data != null) {
            return ListView();
          }
          return const Center(
            child: CircularProgressIndicator(),
          ); // Center
        }); // StreamBuilder)}
  }
}
