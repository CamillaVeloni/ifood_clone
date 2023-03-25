import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/filter_button.dart';

class DeliveryActions extends StatelessWidget {
  const DeliveryActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FilterButton(
            title: 'Entrega',
            onPressed: () {},
            textStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
              size: 18,
            ),
            buttonStyle:  OutlinedButton.styleFrom(
                backgroundColor: Colors.white54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                )
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: FilterButton(
            title: 'Hoje, 50 - 60 min${Utils.bullet} R\$5,90',
            onPressed: () {},
            textStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.red,
              size: 18,
            ),
            buttonStyle:  OutlinedButton.styleFrom(
                backgroundColor: Colors.white54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                )
            ),
          ),
        ),
      ],
    );
  }
}
