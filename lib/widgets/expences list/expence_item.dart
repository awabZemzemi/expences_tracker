import 'package:expences_tracker/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.item, {super.key});
  final Expence item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(item.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${item.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[item.category]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.formatedDate,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
