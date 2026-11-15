
import 'package:flutter/material.dart';

import '../model/product.dart';
import '../widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Product> _products = [
    Product(id: 1, name: 'Áo thun basic', price: 150),
    Product(id: 2, name: 'Quần jean', price: 350),
    Product(id: 3, name: 'Giày sneaker', price: 800),
    Product(id: 4, name: 'Balo laptop', price: 450),
    Product(id: 5, name: 'Mũ lưỡi trai', price: 90),
  ];

  int _cartCount = 0;
  bool _showList = true;

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }

  void _toggleList() {
    setState(() {
      _showList = !_showList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cửa hàng'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Badge(
              label: Text('$_cartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.amber.shade100,
            padding: const EdgeInsets.all(12),
            child: Text(
              'Số sản phẩm trong giỏ hàng: $_cartCount',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _showList
                ? ListView(
                    padding: const EdgeInsets.only(bottom: 88),
                    children: [
                      for (final product in _products)
                        ProductCard(
                          product: product,
                          onAddToCart: _addToCart,
                        ),
                    ],
                  )
                : const Center(
                    child: Text(
                      'Danh sách sản phẩm đã được ẩn.\n'
                      'Các State của thẻ đã bị dispose.',
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleList,
        icon: Icon(
          _showList ? Icons.visibility_off : Icons.visibility,
        ),
        label: Text(
          _showList ? 'Gỡ danh sách' : 'Hiện danh sách',
        ),
      ),
    );
  }
}
