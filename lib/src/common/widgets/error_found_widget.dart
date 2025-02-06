import 'package:flutter/material.dart';

class ErrorFoundWidget extends StatelessWidget {
  final String error;

  const ErrorFoundWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("An error ---> $error"),
    );
  }
}
