import 'package:flutter/material.dart';
import 'package:food_forward/models/CartItem.dart';

class CartCard extends StatelessWidget {
  final CartItem item;
  final Function(int) onIncrement;
  final Function() onDelete;

  CartCard({
    required this.item,
    required this.onIncrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.food.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: ${item.food.price}'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (item.noOfItems > 1) {
                      onIncrement(-1);
                    }
                  },
                ),
                Text('${item.noOfItems}', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    onIncrement(1);
                  },
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red,),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
