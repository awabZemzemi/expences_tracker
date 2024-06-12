import 'package:expences_tracker/models/expence.dart';
import 'package:expences_tracker/widgets/expences%20list/expence_item.dart';
import 'package:flutter/widgets.dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList({super.key, required this.expencesList});
  final List<Expence> expencesList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expencesList.length,
      itemBuilder: (ctx, index) => ExpenceItem(
        expencesList[index],
      ),
    );
  }
}
