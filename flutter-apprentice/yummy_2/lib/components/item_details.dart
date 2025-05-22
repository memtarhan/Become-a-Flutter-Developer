import 'package:flutter/material.dart';

import '../models/cart_manager.dart';
import '../models/restaurant.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  final CartManager cartManager;
  final void Function() quantityUpdated;

  // 1
  const ItemDetails({
    super.key,
    required this.item,
    required this.cartManager,
    required this.quantityUpdated,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
// 2
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
// 3
    final colorTheme = Theme.of(context).colorScheme;
// 4
    return Padding(
      padding: const EdgeInsets.all(32.0),
// 5
      child: Wrap(
        children: [
// 6
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: textTheme.headlineMedium,
              ),
// TODO: Add Liked Badge
              Text(widget.item.description),
// TODO: Add Item Image
// TODO: Add Cart Control
            ],
          ),
        ],
      ),
    );
  }
// TODO: Create Most Liked Badge
// TODO: Create Item Image
// TODO: Create Cart Control
}
