import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order List"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Sort by date"),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final orderItem = orders[index];
              return ListTile(
                onTap: () {},
                title: Text(orderItem.name),
                subtitle: Text(orderItem.date),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text("Details"),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
