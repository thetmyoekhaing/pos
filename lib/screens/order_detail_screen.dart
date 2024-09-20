import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:p_o_s/models/order_model.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm a').format(
      DateTime.parse(order.createdDate),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(order.product.image),
            _Row(
              left: const Text("Order Id"),
              right: Text(
                order.id.toString(),
              ),
            ),
            _Row(
              left: const Text("Order Item"),
              right: Text(
                order.product.title,
              ),
            ),
            _Row(
              left: const Text("Order's Customer"),
              right: Text(
                order.customerName,
              ),
            ),
            _Row(
              left: const Text("Order Time"),
              right: Text(
                formattedDate,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final Widget left;
  final Widget right;
  const _Row({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [left, right],
    );
  }
}


// void sortDates(List<DateTime> dates) {
//   dates.sort((a, b) => a.compareTo(b)); 
// }