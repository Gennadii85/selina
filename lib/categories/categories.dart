import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String image;
  final String name;
  final Function coolbackCategories;

  const Categories({
    Key? key,
    required this.name,
    required this.coolbackCategories,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.amber.shade100,
      semanticContainer: true,
      child: InkResponse(
        onTap: () => coolbackCategories(),
        containedInkWell: true,
        highlightShape: BoxShape.rectangle,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Ink.image(
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            Expanded(
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
