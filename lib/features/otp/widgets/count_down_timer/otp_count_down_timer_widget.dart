import 'package:burgankuwait/core/reusable_widgets/count_down_timer/circular_count_down_timer.dart';
import 'package:burgankuwait/core/reusable_widgets/count_down_timer/count_down_timer_text_format.dart';
import 'package:burgankuwait/core/util/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class OtpCountDownTimerWidget extends StatelessWidget {
  final int durationInSeconds;

  const OtpCountDownTimerWidget({Key? key, required this.durationInSeconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: durationInSeconds,
      controller: CountDownController(),
      width: 232,
      height: 232,
      ringColor: const Color(0xFFF7F7F7),
      fillColor: const Color(0xFF0069AA),
      strokeWidth: 8.0,
      textStyle: const TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold),
      textFormat: CountdownTimerTextFormat.MM_SS,
      isTimerTextShown: true,
      isReverse: true,
      autoStart: true,
      onComplete: () {
        // TODO: Implement timeout logics
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    ).paddingVertical(16);
  }
}
