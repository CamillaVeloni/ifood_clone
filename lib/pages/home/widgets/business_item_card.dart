import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifood_clone/core/widgets/circle_image.dart';

class BusinessItemCard extends StatelessWidget {
  final String name;
  final int rating;
  final String category;
  final String imageUrl;
  final Function()? onTap;

  const BusinessItemCard(
      {Key? key,
      required this.name,
      required this.rating,
      required this.category,
      required this.imageUrl,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CircleImage(
                      imageUrl: imageUrl,
                      height: 60,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text.rich(
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14),
                              children: [
                                TextSpan(
                                  text: '★ $rating ',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 226, 135, 67)),
                                ),
                                TextSpan(text: '• $category '),
                                const TextSpan(text: '• 2,9 km'),
                              ]),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '50-60 min • R\$ 5,90',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                icon: const Icon(CupertinoIcons.heart),
                onPressed: () {},
                color: Colors.grey.shade700),
          ],
        ),
      ),
    );
  }
}
