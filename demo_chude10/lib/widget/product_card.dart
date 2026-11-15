
import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _liked = false;

  String get _tag => '[Card ${widget.product.id}]';

  // 1. Khởi tạo State
  @override
  void initState() {
    super.initState();
    debugPrint('$_tag initState');
  }

  // 2. Khi dependency thay đổi
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('$_tag didChangeDependencies');
  }

  // 3. Khi cấu hình widget thay đổi
  @override
  void didUpdateWidget(covariant ProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('$_tag didUpdateWidget');

    if (oldWidget.product.id != widget.product.id) {
      _liked = false;
    }
  }

  // 4. Khi Hot Reload (debug mode)
  @override
  void reassemble() {
    super.reassemble();
    debugPrint('$_tag reassemble (Hot Reload)');
  }

  // 5. Khi State bị gỡ khỏi cây widget
  @override
  void deactivate() {
    debugPrint('$_tag deactivate');
    super.deactivate();
  }

  // 6. Khi State bị hủy vĩnh viễn
  @override
  void dispose() {
    debugPrint('$_tag dispose');
    super.dispose();
  }

  // Thay đổi trạng thái yêu thích
  void _toggleLike() {
    setState(() {
      _liked = !_liked;
    });

    debugPrint('$_tag setState - liked: $_liked');
  }

  // 7. Xây dựng giao diện widget
  @override
  Widget build(BuildContext context) {
    debugPrint('$_tag build');

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: IconButton(
          tooltip: 'Thả tim',
          onPressed: _toggleLike,
          icon: Icon(
            _liked
                ? Icons.favorite
                : Icons.favorite_border,
            color: _liked ? Colors.red : null,
          ),
        ),
        title: Text(widget.product.name),
        subtitle: Text('${widget.product.price}k'),
        trailing: IconButton(
          tooltip: 'Thêm vào giỏ',
          onPressed: widget.onAddToCart,
          icon: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}
