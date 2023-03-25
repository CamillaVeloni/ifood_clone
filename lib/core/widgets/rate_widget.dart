import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final int rate;
  final String rateText;
  final String reviewCount;

  const RateWidget(
      {Key? key,
      required this.rate,
      required this.rateText,
      required this.reviewCount})
      : super(key: key);

  Color _colorIcon(int index) =>
      rate > index ? Colors.yellow.shade700 : Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            Text(rateText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            const SizedBox(width: 4),
            Row(
              children: List.generate(
                  5, (index) => Icon(Icons.star, color: _colorIcon(index), size: 18,)),
            ),
          ],
        ),
        Text(
          '$reviewCount avaliações',
          style: const TextStyle(color: Colors.black87),
        ),
      ],
    );
  }
}
