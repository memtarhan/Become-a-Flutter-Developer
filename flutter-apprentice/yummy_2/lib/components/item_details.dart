import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/cart_manager.dart';
import '../models/restaurant.dart';
import 'cart_control.dart';

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
      padding: const EdgeInsets.all(20.0),
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
              const SizedBox(height: 16.0),
              _mostLikedBadge(colorTheme),
              const SizedBox(height: 16.0),
              Text(widget.item.description),
              const SizedBox(height: 16.0),
              _itemImage(widget.item.imageUrl),
              const SizedBox(height: 16.0),
              _addToCartControl(widget.item),
            ],
          ),
        ],
      ),
    );
  }

  // 1
  Widget _mostLikedBadge(ColorScheme colorTheme) {
// 2
    return Align(
// 3
      alignment: Alignment.centerLeft,
// 4
      child: Container(
        padding: const EdgeInsets.all(4.0),
        color: colorTheme.onPrimary,
// 5
        child: const Text('#1 Most Liked'),
      ),
    );
  }

// 1
  Widget _itemImage(String imageUrl) {
// 2
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
// 3
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 1
  Widget _addToCartControl(Item item) {
// 2
    return CartControl(
// 3
      addToCart: (number) {
        const uuid = Uuid();
        final uniqueId = uuid.v4();
        final cartItem = CartItem(
          id: uniqueId,
          name: item.name,
          price: item.price,
          quantity: number,
        );
// 4
        setState(() {
          widget.cartManager.addItem(cartItem);
// 5
          widget.quantityUpdated();
        });
// 6
        Navigator.pop(context);
      },
    );
  }
}
