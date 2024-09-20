import 'package:flutter/material.dart';
import 'package:p_o_s/screens/dashboard_screen.dart';
import 'package:p_o_s/screens/order_list_screen.dart';
import 'package:p_o_s/screens/pos_counter_screen.dart';
import 'package:p_o_s/widgets/cus_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      {"Dashboard": const DashboardScreen()},
      {"Point of sale counter": const PosCounterScreen()},
      {"Order List": const OrderListScreen()},
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: CusGrid(screenList: screens),
    );
  }
}
