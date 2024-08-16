import 'package:flutter/material.dart';

class TripleDialog extends StatelessWidget {
  final String messageText;
  final Function(String) onActionSelected;

  const TripleDialog(
      {super.key, required this.messageText, required this.onActionSelected});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildDialog1(context),
          const SizedBox(height: 10),
          _buildDialog2(context, messageText.toString()),
          const SizedBox(height: 10),
          _buildDialog3(context),
        ],
      ),
    );
  }

  Widget _buildDialog1(BuildContext context) {
    List<String> emojis = [
      // "😀",
      // "😃",
      // "😄",
      // "😁",
      // "😆",
      // "😅",
      // "😂",
      "❤️",
      "👍",
      "🤣",
      "😊",
      "😇"
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: WrapAlignment.center,
        children: emojis
            .map((emoji) => GestureDetector(
                  onTap: () {
                    onActionSelected(emoji);
                  },
                  child: Text(
                    emoji,
                    style: const TextStyle(
                      fontSize: 39.5,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildDialog2(BuildContext context, String title) {
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
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDialog3(BuildContext context) {
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
          GestureDetector(
            onTap: () {
              onActionSelected('reply');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Trả lời", style: TextStyle(fontSize: 20)),
                Icon(Icons.reply, color: Colors.blue),
              ],
            ),
          ),
          const Divider(color: Colors.brown, thickness: 2),
          GestureDetector(
            onTap: () {
              onActionSelected('edit');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Chỉnh sửa", style: TextStyle(fontSize: 20)),
                Icon(Icons.edit, color: Colors.blue),
              ],
            ),
          ),
          const Divider(color: Colors.brown, thickness: 2),
          GestureDetector(
            onTap: () {
              onActionSelected('delete');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Xóa", style: TextStyle(fontSize: 20)),
                Icon(Icons.delete, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
