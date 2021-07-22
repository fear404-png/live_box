import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_box/bloc/livebox_bloc.dart';
import 'package:live_box/resources/app_colors.dart';

class MouthWidget extends StatelessWidget {
  const MouthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: context.select((LiveboxBloc bloc) => bloc.state.mouthWidthSize),
      height: 10,
      color: AppColors.background,
      curve: Curves.linearToEaseOut,
      duration: Duration(milliseconds: 250),
    );
  }
}
