import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  final String message;

  const NotFoundWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
