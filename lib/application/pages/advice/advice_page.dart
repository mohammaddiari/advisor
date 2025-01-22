import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';
import 'cubit/advisor_cubit.dart';
import 'widgets/advice_field.dart';
import 'widgets/custom_button.dart';
import 'widgets/error_message.dart';

class AdvisorPageWrapperProvider extends StatelessWidget {
  const AdvisorPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdvisorCubit>(
      create: (BuildContext context) => AdvisorCubit(),
      child: const AdvisorPage(),
    );
  }
}

class AdvisorPage extends StatelessWidget {
  const AdvisorPage({super.key});

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
        actions: <Widget>[
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: BlocBuilder<AdvisorCubit, AdvisorCubitState>(
                  builder: (BuildContext context, AdvisorCubitState state) {
                    if (state is AdvisorInitial) {
                      return Text(
                        'Your advice is waiting for you!',
                        style: themeData.textTheme.headlineLarge,
                      );
                    } else if (state is AdvisorStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdvisorStateLoaded) {
                      return AdviceField(advice: state.advice);
                    } else if (state is AdvisorStateError) {
                      return Text(state.message);
                    } else {
                      return const ErrorMessage(
                        message: 'Ooops something went wrong!',
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
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
