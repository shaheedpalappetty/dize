import 'package:dize/utils/dize_colors.dart';
import 'package:dize/utils/text_style.dart';
import 'package:flutter/material.dart';

class NumberTile extends StatelessWidget {
  const NumberTile({
    super.key,
    required this.title,
    required this.number,
  });
  final String title;
  final int number;
  @override
  Widget build(BuildContext context) {
    final dheight = MediaQuery.sizeOf(context).height;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DizeColors.cardBackground,
        ),
        height: dheight / 7.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title, style: DizeTextStyle.numberTitle),
            const Divider(
              thickness: .5,
            ),
            Text(
              number.toString(),
              style: DizeTextStyle.number,
            )
          ],
        ),
      ),
    );
  }
}
