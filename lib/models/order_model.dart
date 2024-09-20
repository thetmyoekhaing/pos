import 'package:p_o_s/models/product_model.dart';

class OrderModel {
  final String? id;
  final String customerName;
  final ProductModel product;
  final String createdDate;

  const OrderModel({
    this.id,
    required this.customerName,
    required this.product,
    required this.createdDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerName': customerName,
      'productId': product.id,
      'productTitle': product.title,
      'productPrice': product.price,
      'productDescription': product.description,
      'productImage': product.image,
      'createdDate': createdDate,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      customerName: map['customerName'] as String,
      product: ProductModel.fromMap({
        'id': map['productId'],
        'title': map['productTitle'],
        'price': map['productPrice'],
        'description': map['productDescription'],
        'image': map['productImage'],
      }),
      createdDate: map['createdDate'] as String,
    );
  }
}
