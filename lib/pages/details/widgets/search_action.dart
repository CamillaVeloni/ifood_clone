import 'package:flutter/material.dart';

class SearchAction extends StatelessWidget {
  const SearchAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text('Pedido mínimo R\$ 20,00'),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black87)),
      ],
    );
  }
}
