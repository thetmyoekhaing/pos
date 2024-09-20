import 'package:flutter/material.dart';
import 'package:p_o_s/helpers/context_ext.dart';
import 'package:p_o_s/widgets/cus_container.dart';

class CusGrid extends StatelessWidget {
  final List<Map> screenList;
  final bool shrinkWrap;
  const CusGrid({super.key, required this.screenList, this.shrinkWrap = false});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: shrinkWrap,
      children: screenList.map((screen) {
        return GestureDetector(
          onTap: () {
            context.push(screen.values.first);
          },
          child: CusContainer(title: screen.keys.first),
        );
      }).toList(),
    );
  }
}
