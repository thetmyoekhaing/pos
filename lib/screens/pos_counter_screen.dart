import 'package:flutter/material.dart';
import 'package:p_o_s/models/product_model.dart';

class PosCounterScreen extends StatelessWidget {
  const PosCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      const ProductModel(
        id: "0",
        title: "title",
        price: "price",
        description: "description",
        image: "image",
      ),
      const ProductModel(
        id: "0",
        title: "title",
        price: "price",
        description: "description",
        image: "image",
      ),
      const ProductModel(
        id: "0",
        title: "title",
        price: "price",
        description: "description",
        image: "image",
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Filter Category",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Image.network(product.image),
                      const SizedBox(height: 5),
                      Text(product.title),
                      const SizedBox(height: 5),
                      Text(product.price),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Make Order")),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
