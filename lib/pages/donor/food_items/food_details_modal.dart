import 'package:flutter/material.dart';

class FoodItemDetailsDialog extends StatelessWidget {
  final String img;
  final String name;
  final double price;
  final String date;
  final String preference;
  final int availableQuantity;
  final void Function()? updateOnPressed;
  final void Function()? deleteOnPressed;

  const FoodItemDetailsDialog({super.key, 
    required this.img,
    required this.name,
    required this.price,
    required this.date,
    required this.preference,
    required this.availableQuantity,
    required this.deleteOnPressed,
    required this.updateOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Image.network(
                img,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Price: RS. $price",
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Expiry Date: $date",
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Preference: $preference",
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Available Quantity: $availableQuantity",
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green,),
                  onPressed: updateOnPressed,
                  child: const Text('Update'),
                ),
                ElevatedButton(
                  onPressed: deleteOnPressed,
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
