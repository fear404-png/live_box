import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_box/bloc/livebox_bloc.dart';
import 'package:live_box/resources/app_colors.dart';
import 'package:live_box/views/components/app_buttons.dart';
import 'package:live_box/views/components/live_box.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text(
            "LIVE BOX",
            style: TextStyle(color: AppColors.accent),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<LiveboxBloc, LiveboxState>(builder: (context, state) {
          if (state is LiveboxInitial) {
            return Column(
              children: [
                Expanded(child: LiveBoxWidget()),
                Expanded(child: ButtonsWidget()),
              ],
            );
          }
          return Center(
              child: Text(
            "ERROR, STATE NOT FOUND",
            style: TextStyle(
              color: AppColors.accent,
            ),
          ));
        }));
  }
}
