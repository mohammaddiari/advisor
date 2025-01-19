import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';
import 'widgets/custom_button.dart';
import 'widgets/error_message.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advisor',
          style: themeData.textTheme.headlineLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: ErrorMessage(message: 'Ooops something went wrong!'),
                // child: AdviceField(advice: 'example advice - your day will be good!'),
                // child: CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // ),
                // Text(
                //   'Your Advice is waiting for you!',
                //   style: themeData.textTheme.headlineLarge,
                // ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
