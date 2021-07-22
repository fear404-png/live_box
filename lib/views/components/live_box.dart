import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_box/bloc/livebox_bloc.dart';
import 'package:live_box/resources/app_colors.dart';
import 'package:live_box/views/components/eyes.dart';
import 'package:live_box/views/components/mouth.dart';

class LiveBoxWidget extends StatelessWidget {
  const LiveBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              color: AppColors.accent,
            ),
            AnimatedPositioned(
              top: context.select((LiveboxBloc bloc) => bloc.state.positionY),
              right: context.select((LiveboxBloc bloc) => bloc.state.positionX)
                  as double,
              duration: Duration(milliseconds: 300),
              child: EyesWidget(),
              curve: Curves.linearToEaseOut,
            ),
            AnimatedPositioned(
              bottom: 20,
              right: context
                  .select((LiveboxBloc bloc) => bloc.state.mouthPosition),
              child: MouthWidget(),
              duration: Duration(milliseconds: 250),
              curve: Curves.linearToEaseOut,
            )
          ],
        ),
      ),
    );
  }
}
