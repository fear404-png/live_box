import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_box/bloc/livebox_bloc.dart';

import 'views/main_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LiveboxBloc>(
        create: (context) => LiveboxBloc()..add(InitialLiveBox()),
        child: MaterialApp(
          title: "live box",
          routes: {
            "/main_screen": (context) => MainScreen(),
          },
          initialRoute: "/main_screen",
        ));
  }
}
