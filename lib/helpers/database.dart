import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p_o_s/models/order_model.dart';
import 'package:p_o_s/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'orders.db');
    debugPrint("open called..");
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE orders (
            id TEXT PRIMARY KEY,
            customerName TEXT,
            productId TEXT,
            productTitle TEXT,
            productPrice TEXT,
            productDescription TEXT,
            productImage TEXT,
            createdDate TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertOrder(OrderModel order) async {
    final db = await database;

    try {
      await db.insert(
        'orders',
        order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      debugPrint('Error inserting order: $e');
    }
  }

  Future<List<OrderModel>> getOrders() async {
    final db = await database;

    try {
      final List<Map<String, dynamic>> maps = await db.query('orders');
      return List.generate(maps.length, (i) {
        final ProductModel product = ProductModel(
          id: maps[i]['productId'],
          title: maps[i]['productTitle'],
          price: maps[i]['productPrice'],
          description: maps[i]['productDescription'],
          image: maps[i]['productImage'],
        );
        return OrderModel(
          id: maps[i]['id'],
          customerName: maps[i]['customerName'],
          product: product,
          createdDate: DateTime.now().toString(),
        );
      });
    } catch (e) {
      debugPrint('Error getting orders: $e');
      return [];
    }
  }
}
