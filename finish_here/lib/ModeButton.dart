import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  const ModeButton(
      {Key? key, required this.title, this.onPressed, this.isSelected = false})
      : super(key: key);

  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    isSelected ? Colors.black : Colors.black.withOpacity(0.7)),
          ),
          SizedBox(height: 4),
          Visibility(visible: isSelected, child: Icon(Icons.circle, size: 6))
        ],
      ),
    );
  }
}
