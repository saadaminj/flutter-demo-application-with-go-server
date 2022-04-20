import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/app.dart';
import 'package:test/blocs/title/title_bloc.dart';
import 'package:test/blocs/title/title_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/services/title_service.dart';

Widget appProvider() {
  return MultiRepositoryProvider(
      providers: repositoryProviders(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider<TitleBloc>(
              create: (context) {
                final titleService =
                    RepositoryProvider.of<TitleService>(context);
                return TitleBloc(titleService);
              },
            ),
          ],
          child: BlocBuilder<TitleBloc, TitleState>(
            builder: (context, state) {
              // if (state is TitleLoading) {
              //   const CircularProgressIndicator();
              // }
              // if (state is TitleLoaded) {
              //   return const App();
              // }

              return const App();
            },
          )));
}

List<RepositoryProvider> repositoryProviders() {
  return [
    RepositoryProvider<TitleService>(
      create: (context) {
        return DummyTitleService();
      },
    ),
  ];
}
