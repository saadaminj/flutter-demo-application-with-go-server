import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/blocs/title/title_event.dart';
import 'package:test/blocs/title/title_state.dart';

import '../blocs/title/title_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool loading = false;
  late TitleBloc _bloc;
  late String title = '';

  @override
  void initState() {
    _bloc = BlocProvider.of<TitleBloc>(context);
    _bloc.add(LoadTitle());
    super.initState();
  }

  void _incrementCounter() {
    _bloc.add(LoadTitle());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TitleBloc, TitleState>(
      listenWhen: (context, state) {
        return state is TitleLoaded || state is TitleLoading;
      },
      listener: (context, state) {
        if (state is TitleLoading) {
          setState(() {
            loading = true;
          });
        }
        if (state is TitleLoaded) {
          setState(() {
            loading = false;
            title = state.title;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              !loading
                  ? const Text(
                      'You have pushed the button this many times:',
                    )
                  : const CircularProgressIndicator(),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
