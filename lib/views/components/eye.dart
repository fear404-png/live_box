import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_box/bloc/livebox_bloc.dart';
import 'package:live_box/resources/app_colors.dart';

class EyeWidget extends StatelessWidget {
  const EyeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: context.select((LiveboxBloc bloc) => bloc.state.size),
      height: context.select((LiveboxBloc bloc) => bloc.state.size),
      color: AppColors.background,
      curve: Curves.linearToEaseOut,
      duration: Duration(milliseconds: 100),
    );
  }
}
