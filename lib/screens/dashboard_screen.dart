import 'package:flutter/material.dart';
import 'package:p_o_s/screens/order_list_screen.dart';
import 'package:p_o_s/screens/pos_counter_screen.dart';
import 'package:p_o_s/widgets/cus_grid.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      {
        "Point of sale counter": const PosCounterScreen(),
      },
      {
        "Order List": const OrderListScreen(),
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              const Text("Total Sale Amount 999\$"),
              Expanded(
                child: CusGrid(screenList: screens),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
