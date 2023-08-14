import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../information_model.dart';

class TimerBar extends StatefulWidget {
  final List<InformationModel> data;
  final List<double> percentage;
  const TimerBar({
    Key? key,
    required this.data,
    required this.percentage,
  }) : super(key: key);

  @override
  State<TimerBar> createState() => _TimerBarState();
}

class _TimerBarState extends State<TimerBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.data.length; i++)
          Expanded(
            child: LinearPercentIndicator(
              progressColor: Colors.white,
              backgroundColor: Colors.white.withOpacity(0.5),
              lineHeight: 5,
              percent: widget.percentage[i],
              barRadius: const Radius.circular(50.0),
            ),
          )
      ],
    );
  }
}
