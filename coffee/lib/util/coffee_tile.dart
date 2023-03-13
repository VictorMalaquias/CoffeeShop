import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImage;
  final String coffeeName;
  final String coffeePrice;
  const CoffeeTile(
      {required this.coffeeImage,
      required this.coffeeName,
      required this.coffeePrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 25),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 120,
                  width: 180,
                  child: Image.asset(
                    coffeeImage,
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Café Ribeirão Bonito',
                    style: TextStyle(color: Colors.grey[700]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$$coffeePrice'),
                  Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.add))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
