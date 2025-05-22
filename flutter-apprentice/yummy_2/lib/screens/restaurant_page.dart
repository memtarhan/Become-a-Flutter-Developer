// 1
import 'package:flutter/material.dart';

import '../models/restaurant.dart';

// 2
class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;

  // 3
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

// 4
class _RestaurantPageState extends State<RestaurantPage> {
  // TODO: Add Desktop Threshold
  // TODO: Add Constraint Properties
  // TODO: Calculate Constrained Width
  // TODO: Add Calculate Column Count
  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildInfoSection(),
        SliverToBoxAdapter(
          child: Container(height: 300.0, color: Colors.green),
        ),
        // TODO: Add Menu Item Grid View Section
        SliverFillRemaining(child: Container(color: Colors.blue)),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar() {
    // 1
    return SliverAppBar(
      // 2
      pinned: true,
      // 3
      expandedHeight: 300.0,
      // 4
      flexibleSpace: FlexibleSpaceBar(
        // 5
        background: Center(
          // 6
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
            // 7
            child: Stack(
              children: [
                // 8
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    // 9
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // 10
                const Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.store, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1
  SliverToBoxAdapter _buildInfoSection() {
    // 2
    final textTheme = Theme
        .of(context)
        .textTheme;
    // 3
    final restaurant = widget.restaurant;
    // 4
    return SliverToBoxAdapter(
      // 5
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 6
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 7
            Text(restaurant.name, style:
            textTheme.headlineLarge,),
            Text(restaurant.address, style: textTheme.bodySmall,),
            Text(
              restaurant.getRatingAndDistance(),
              style: textTheme.bodySmall,),
            Text(restaurant.attributes, style:
            textTheme.labelSmall,),
          ],
        ),
      ),
    );
  }
  // TODO: Build Grid Item
  // TODO: Build Section Title
  // TODO: Build Grid View
  // TODO: Build Grid View Section
  // TODO: Replace build method
  @override
  Widget build(BuildContext context) {
    // 5
    return Scaffold(
      body: Center(
        // TODO: Replace with Custom Scroll View
        child:  _buildCustomScrollView(),
      ),
    );
  }
}
