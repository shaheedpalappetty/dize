import 'dart:async';
import 'package:dize/presentation/bloc/dize/dize_bloc.dart';
import 'package:dize/utils/dize_colors.dart';
import 'package:dize/utils/dize_strings.dart';
import 'package:dize/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountDown extends StatefulWidget {
  const CountDown({
    super.key,
  });

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer _timer;
  int _seconds = 5;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _resetCountdown(false);
      }
    });
  }

  void _resetCountdown(bool buttonClicked) {
    CustomSnackBar.showCustomSnackBar(context, DizeStrings.reset);

    if (!buttonClicked) {
      context.read<DizeBloc>().add(ResetCountDownNotClickedEvent());
    }
    setState(() {
      _seconds = 5;
      buttonClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Transform.scale(
        scale: 3,
        child: BlocListener<DizeBloc, DizeState>(
          listener: (context, state) {
            if (state is ResetCountDownClickedState) {
              _resetCountdown(state.isClicked);
            }
          },
          child: CircularProgressIndicator(
            backgroundColor: DizeColors.backgroungColor,
            strokeCap: StrokeCap.round,
            value: _seconds / 5,
            color: DizeColors.indicatorColor,
            strokeWidth: 3,
          ),
        ),
      ),
      Text(
        "${DizeStrings.timer}$_seconds",
        style: const TextStyle(fontSize: 26, color: Colors.white),
      )
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
