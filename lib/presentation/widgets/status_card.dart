import 'package:dize/domain/model/data_model.dart';
import 'package:dize/utils/dize_colors.dart';
import 'package:dize/utils/dize_strings.dart';
import 'package:dize/utils/text_style.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final bool isMatched;
  final DataModel? dataModel;
  const StatusCard({
    super.key,
    required this.isMatched,
    this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    final dheight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: dheight * .16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isMatched ? DizeColors.success : DizeColors.failure,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isMatched ? DizeStrings.success : DizeStrings.failure,
            style: DizeTextStyle.alertHeading,
          ),
          Divider(
            thickness: .5,
            color: DizeColors.white,
          ),
          Text(
              isMatched
                  ? "${DizeStrings.score} ${dataModel?.successCount}/${dataModel?.attempts}"
                  : '${DizeStrings.attempt} : ${dataModel?.failureCount ?? 0}/${dataModel?.attempts ?? 0}',
              style: DizeTextStyle.score)
        ],
      ),
    );
  }
}
