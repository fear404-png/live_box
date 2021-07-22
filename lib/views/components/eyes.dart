import 'package:flutter/material.dart';

import 'package:live_box/views/components/eye.dart';

class EyesWidget extends StatelessWidget {
  const EyesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 8,
        ),
        EyeWidget(),
        SizedBox(
          width: 15,
        ),
        EyeWidget(),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
