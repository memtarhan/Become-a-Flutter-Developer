// 1
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/cart_manager.dart';
import '../models/order_manager.dart';

class CheckoutPage extends StatefulWidget {
// 2
// 3
// 4
  final CartManager cartManager;
  final Function() didUpdate;
  final Function(Order) onSubmit;

  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
// 5
// 1
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text('Delivery'),
    1: Text('Self Pick-Up'),
  };

// 2
// 3
  Set<int> selectedSegment = {0};
  TimeOfDay? selectedTime;

  // 4
  DateTime? selectedDate;

// 5
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);

// 6
  final TextEditingController _nameController = TextEditingController();

  // 1
  String formatDate(DateTime? dateTime) {
// 2
    if (dateTime == null) {
      return 'Select Date';
    }
// 3
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

// 1
  String formatTimeOfDay(TimeOfDay? timeOfDay) {
// 2
    if (timeOfDay == null) {
      return 'Select Time';
    }
// 3
    final hour = timeOfDay.hour.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void onSegmentSelected(Set<int> segmentIndex) {
    setState(() {
      selectedSegment = segmentIndex;
    });
  }

  Widget _buildOrderSegmentedType() {
// 1
    return SegmentedButton(
// 2
      showSelectedIcon: false,
// 3
      segments: const [
        ButtonSegment(
          value: 0,
          label: Text('Delivery'),
          icon: Icon(Icons.pedal_bike),
        ),
        ButtonSegment(
          value: 1,
          label: Text('Pickup'),
          icon: Icon(Icons.local_mall),
        ),
      ],
// 4
// 5
      selected: selectedSegment,
      onSelectionChanged: onSegmentSelected,
    );
  }

  Widget _buildTextField() {
// 1
    return TextField(
// 2
      controller: _nameController,
// 3
      decoration: const InputDecoration(
        labelText: 'Contact Name',
      ),
    );
  }

  // 1
  void _selectDate(BuildContext context) async {
// 2
    final picked = await showDatePicker(
// 3
      context: context,
// 4
      initialDate: selectedDate ?? DateTime.now(),
// 5
      firstDate: _firstDate,
      lastDate: _lastDate,
    );
// 6
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // 1
  void _selectTime(BuildContext context) async {
// 2
    final picked = await showTimePicker(
// 3
      context: context,
// 4
      initialEntryMode: TimePickerEntryMode.input,
// 5
      initialTime: selectedTime ?? TimeOfDay.now(),
// 6
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
// 7
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Widget _buildOrderSummary(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Expanded(
      child: ListView.builder(
        itemCount: widget.cartManager.items.length,
        itemBuilder: (context, index) {
          final item = widget.cartManager.itemAt(index);

          // TODO: Wrap in a Dismissible Widget
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(),
            secondaryBackground: const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete),
                ],
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                widget.cartManager.removeItem(item.id);
              });
              widget.didUpdate();
            },
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                    color: colorTheme.primary,
                    width: 2.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Text('x${item.quantity}'),
                ),
              ),
              title: Text(item.name),
              subtitle: Text('Price: \$${item.price}'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
// 1
    return ElevatedButton(
// 2
      onPressed: widget.cartManager.isEmpty
          ? null
// 3
          : () {
              final selectedSegment = this.selectedSegment;
              final selectedTime = this.selectedTime;
              final selectedDate = this.selectedDate;
              final name = _nameController.text;
              final items = widget.cartManager.items;
// 4
              final order = Order(
                selectedSegment: selectedSegment,
                selectedTime: selectedTime,
                selectedDate: selectedDate,
                name: name,
                items: items,
              );
              // 5
              widget.cartManager.resetCart();
// 6
              widget.onSubmit(order);
            },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
// 7
        child: Text(
            '''Submit Order - \$${widget.cartManager.totalCost.toStringAsFixed(2)}'''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
// 6
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
// 7
    return Scaffold(
// 8
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
// 9
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Details',
              style: textTheme.headlineSmall,
            ),

            const SizedBox(height: 16.0),
            _buildOrderSegmentedType(),

            const SizedBox(height: 16.0),
            _buildTextField(),

            // 1
            const SizedBox(height: 16.0),
// 2
            Row(
              children: [
                TextButton(
// 3
                  child: Text(formatDate(selectedDate)),
// 4
                  onPressed: () => _selectDate(context),
                ),
                TextButton(
// 5
// 6
                  child: Text(formatTimeOfDay(selectedTime)),
                  onPressed: () => _selectTime(context),
                ),
              ],
            ),
// 7
            const SizedBox(height: 16.0),

            const Text('Order Summary'),
            _buildOrderSummary(context),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }
}
