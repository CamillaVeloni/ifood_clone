import 'package:flutter/material.dart';

import '../../../core/widgets/filter_button.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 40,
        margin: const EdgeInsets.all(6),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FilterButton(
                title: 'Ordenar',
                onPressed: () {},
                icon: Icons.keyboard_arrow_down_outlined),
            FilterButton(
                title: 'Pra retirar',
                onPressed: () {},
                icon: Icons.directions_walk, alignment: IconAlignment.left),
            FilterButton(
              title: 'Entrega grátis',
              onPressed: () {},
              hasIcon: false,
            ),
            FilterButton(
              title: 'Vale-refeição',
              onPressed: () {},
              icon: Icons.keyboard_arrow_down_outlined,
            ),
            FilterButton(
              title: 'Tipo de loja',
              onPressed: () {},
              icon: Icons.keyboard_arrow_down_outlined,
            ),
            FilterButton(
              title: 'Distância',
              onPressed: () {},
              icon: Icons.keyboard_arrow_down_outlined,
            ),
            FilterButton(
              title: 'Entrega Parceira',
              onPressed: () {},
              hasIcon: false,
            ),
            FilterButton(
              title: 'Super-Restaurantes',
              onPressed: () {},
              hasIcon: false,
            ),
            FilterButton(
              title: 'Filtros',
              onPressed: () {},
              icon: Icons.format_align_left_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
