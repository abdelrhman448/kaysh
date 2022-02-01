import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayish/shared/component/styles.dart';

class DealsBidsItem extends StatelessWidget {
  String? lastPrice;
  String? time;
  String?date;
  DealsBidsItem({
    required this.lastPrice,
    required this.time,
    required this.date,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lastPrice!,
          textAlign: TextAlign.center,
          style: bidsTextStyle,
        ),
        Spacer(),
        Center(
          child: Text(
            time!,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: bidsTextStyle,
          ),
        ),
        const SizedBox(width: 4,),
       Center(
         child:  Center(
           child: Text(
            '|',
             textAlign: TextAlign.center,
             style: bidsTextStyle,
           ),
         ),
       ),
        const SizedBox(width: 4,),
        Center(
          child: Text(
            date!,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: bidsTextStyle,
          ),
        ),

      ],
    );
  }
}
