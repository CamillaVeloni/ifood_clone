import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ElevatedButton(onPressed: () {}, child: const Text('Ordenar')),
            TextButton(onPressed: () {}, child: const Text('Pra retirar')),
            TextButton(onPressed: () {}, child: const Text('Entrega grátis')),
            TextButton(onPressed: () {}, child: const Text('Vale-refeição')),
            TextButton(onPressed: () {}, child: const Text('Tipo de loja')),
            TextButton(onPressed: () {}, child: const Text('Distância')),
            TextButton(onPressed: () {}, child: const Text('Entrega Parceira')),
            TextButton(onPressed: () {}, child: const Text('Super-Restaurantes')),
            TextButton(onPressed: () {}, child: const Text('Filtros')),
          ],
        ),
      ),
    );
  }
}
