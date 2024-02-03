import 'package:dize/presentation/bloc/dize/dize_bloc.dart';
import 'package:dize/presentation/widgets/countdown.dart';
import 'package:dize/presentation/widgets/number_widget.dart';
import 'package:dize/presentation/widgets/status_card.dart';
import 'package:dize/utils/dize_strings.dart';
import 'package:dize/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dwidth = MediaQuery.sizeOf(context).width;
    final dheight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: Text(DizeStrings.appName, style: DizeTextStyle.appTitle),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<DizeBloc, DizeState>(
              builder: (context, state) {
                if (state is ValueGeneratedState) {
                  return Row(
                    children: [
                      NumberTile(
                          number: state.datamodel.currentSecond,
                          title: DizeStrings.currentSecond),
                      const SizedBox(
                        width: 10,
                      ),
                      NumberTile(
                          number: state.datamodel.randomNumber,
                          title: DizeStrings.randomNumber),
                    ],
                  );
                }
                return Row(
                  children: [
                    NumberTile(number: 0, title: DizeStrings.currentSecond),
                    const SizedBox(
                      width: 10,
                    ),
                    NumberTile(number: 0, title: DizeStrings.randomNumber),
                  ],
                );
              },
            ),
            SizedBox(
              height: dheight * .05,
            ),
            BlocBuilder<DizeBloc, DizeState>(
              buildWhen: (previous, current) =>
                  current is! ResetCountDownClickedState,
              builder: (context, state) {
                if (state is ValueGeneratedState) {
                  return StatusCard(
                    dataModel: state.datamodel,
                    isMatched: state.ismatched,
                  );
                }
                return const StatusCard(isMatched: false);
              },
            ),
            SizedBox(
              height: dheight * .1,
            ),
            const CountDown(),
            SizedBox(
              height: dheight * .1,
            ),
            BlocListener<DizeBloc, DizeState>(
              listener: (context, state) {},
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(dwidth, 52)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF7958FE))),
                  onPressed: () {
                    context.read<DizeBloc>().add(ButtonClickedEvent());
                  },
                  child: Text(DizeStrings.click)),
            )
          ],
        ),
      ),
    );
  }
}
