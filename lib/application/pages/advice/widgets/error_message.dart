import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.error, size: 40, color: Colors.redAccent),
        const SizedBox(height: 20),
        Text(
          message,
          style: themeData.textTheme.headlineLarge,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
