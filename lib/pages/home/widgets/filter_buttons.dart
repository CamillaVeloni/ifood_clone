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
                icon: Icon(Icons.keyboard_arrow_down_outlined,
                    color: Colors.grey.shade700, size: 18)),
            FilterButton(
                title: 'Pra retirar',
                onPressed: () {},
                icon: Icon(Icons.directions_walk,
                    color: Colors.grey.shade700, size: 18),
                alignment: IconAlignment.left),
            FilterButton(
              title: 'Entrega grátis',
              onPressed: () {},
              hasIcon: false,
            ),
            FilterButton(
              title: 'Vale-refeição',
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey.shade700, size: 18),
            ),
            FilterButton(
              title: 'Tipo de loja',
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey.shade700, size: 18),
            ),
            FilterButton(
              title: 'Distância',
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey.shade700, size: 18),
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
              icon: Icon(Icons.format_align_left_outlined,
                  color: Colors.grey.shade700, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
