import 'package:flutter/material.dart';

import '/core/models/category.dart';

final CATEGORIES_DATA = <Category>[
  Category(id: 1, name: 'Restaurante', photoUrl: 'restaurant.png'),
  Category(id: 2, name: 'Mercado', photoUrl: 'supermarket.png'),
  Category(id: 3, name: 'Farmácia', photoUrl: 'pharmacy.png'),
  Category(id: 4, name: 'Pet', photoUrl: 'pet.png'),
  Category(id: 5, name: 'Clube Ifood', photoUrl: 'club_ifood.png'),
  Category(id: 6, name: 'Shopping', photoUrl: 'shopping.png'),
  Category(id: 7, name: 'Gourmet', photoUrl: 'gourmet.png'),
];

final SUBCATEGORIES_DATA = <Category>[
  Category(id: 1, name: 'Mercado', photoUrl: 'mercado.png', color: Colors.green),
  Category(id: 2, name: 'Lanches', photoUrl: 'lanches.png', color: Colors.pinkAccent),
  Category(id: 3, name: 'Pizza', photoUrl: 'pizza.png', color: Colors.pinkAccent),
  Category(id: 4, name: 'Promoções', photoUrl: 'promocoes.png', color: Colors.pinkAccent),
  Category(id: 5, name: 'Açai', photoUrl: 'acai.png', color: Colors.purple),
  Category(id: 6, name: 'Japonesa', photoUrl: 'japonesa.png', color: Colors.green),
  Category(id: 7, name: 'Salgados', photoUrl: 'salgados.png', color: Colors.yellow),
  Category(id: 9, name: 'Pastel', photoUrl: 'pastel.png', color: Colors.pinkAccent),
  Category(id: 8, name: 'Brasileira', photoUrl: 'brasileira.png', color: Colors.yellow),
  Category(id: 10, name: 'Conveniência', photoUrl: 'conveniencia.png', color: Colors.yellow),
  Category(id: 11, name: 'Bebidas', photoUrl: 'bebidas.png', color: Colors.purple),
  Category(id: 13, name: 'Árabe', photoUrl: 'arabe.png', color: Colors.pinkAccent),
  Category(id: 12, name: 'Doces & Bolos', photoUrl: 'doces_e_bolos.png', color: Colors.pinkAccent),
  Category(id: 14, name: 'Vegetariana', photoUrl: 'vegetariana.png', color: Colors.green),
  Category(id: 15, name: 'Sorvetes', photoUrl: 'sorvetes.png', color: Colors.purple),
];