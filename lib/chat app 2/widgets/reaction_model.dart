import 'package:flutter/material.dart';

class ReactionModel extends StatelessWidget {
  final String messageText;

  const ReactionModel({super.key, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Chọn hành động"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            child: const Text("Tùy chọn 1"),
            onPressed: () {
              Navigator.of(context).pop();
              _showDetailDialog(
                  context, "Tùy chọn 1", "Bạn đã chọn tùy chọn 1.");
            },
          ),
          TextButton(
            child: const Text("Tùy chọn 2"),
            onPressed: () {
              Navigator.of(context).pop();
              _showDetailDialog(
                  context, "Tùy chọn 2", "Bạn đã chọn tùy chọn 2.");
            },
          ),
          TextButton(
            child: const Text("Tùy chọn 3"),
            onPressed: () {
              Navigator.of(context).pop();
              _showDetailDialog(
                  context, "Tùy chọn 3", "Bạn đã chọn tùy chọn 3.");
            },
          ),
        ],
      ),
    );
  }

  void _showDetailDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text("Đóng"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TripleDialog extends StatelessWidget {
  final String messageText;

  const TripleDialog({super.key, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildDialog(context, "Tùy chọn 1", "Bạn đã chọn tùy chọn 1."),
          const SizedBox(height: 10), // Khoảng cách 10 pixel
          _buildDialog(context, messageText.toString(), ""),
          const SizedBox(height: 10), // Khoảng cách 10 pixel
          _buildDialog(context, "Tùy chọn 3", "Bạn đã chọn tùy chọn 3."),
        ],
      ),
    );
  }

  Widget _buildDialog(BuildContext context, String title, String content) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(content),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: const Text("Đóng"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
