import 'package:flutter/material.dart';
import 'package:food_ordering_application/database_helper.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    loadTotalPrice();
  }

  Future<void> loadTotalPrice() async {
    final total = await DatabaseHelper.instance.getTotalPrice();

    if (!mounted) return;

    setState(() {
      totalPrice = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFA),

      appBar: AppBar(
        title: const Text(
          "Your Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search cart...",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.cyan,
                ),
                filled: true,
                fillColor: Colors.cyan.withOpacity(0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Cart List
          Expanded(
            child: _buildCartList(),
          ),
        ],
      ),

      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCartList() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.instance.getCartItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Unable to load cart.",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          );
        }

        final items = snapshot.data ?? [];

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 70,
                  color: Colors.cyan.withOpacity(0.3),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Your cart is empty",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index];

            final String imagePath =
                _getImagePath(item['foodName'].toString());

            final double price =
                (item['price'] as num).toDouble();

            final int quantity =
                (item['quantity'] as num).toInt();

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    // Food Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 14),

                    // Food Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['foodName'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "RM ${price.toStringAsFixed(2)}  |  Qty: $quantity",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Delete Button
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                      onPressed: () async {
                        await DatabaseHelper.instance.deleteCartItem(
                          item['id'],
                        );

                        await loadTotalPrice();

                        if (!mounted) return;

                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _getImagePath(String foodName) {
    switch (foodName) {
      case 'Burger Special':
        return 'assets/images/burger_1.png';

      case 'Laksa Utara':
        return 'assets/images/laksa.jpg';

      case 'Mee Kari':
        return 'assets/images/mee_kari.jpg';

      case 'Mee Hoon Sup':
        return 'assets/images/meehun.jpg';

      case 'Nasi Lemak':
        return 'assets/images/nasi_lemak.jpg';

      case 'Chicken Chop':
        return 'assets/images/chicken_chop.jpg';

      case 'Teh Ais':
        return 'assets/images/teh_ais.jpeg';

      case 'Milo Ais':
        return 'assets/images/milo_ais.jpeg';

      case 'Nescafe Ais':
        return 'assets/images/nescafe_ais.jpeg';

      case 'Sirap Bandung':
        return 'assets/images/bandung.jpg';

      case 'Orange Juice':
        return 'assets/images/orange_juice.jpg';

      case 'Mineral Water':
        return 'assets/images/mineral_water.jpg';

      case 'Cheesecake':
        return 'assets/images/cheesecake.jpg';

      case 'Chocolate Cake':
        return 'assets/images/chocolate_cake.jpg';

      case 'Brownies':
        return 'assets/images/brownies.jpg';

      case 'Pudding':
        return 'assets/images/pudding.png';

      case 'Donut':
        return 'assets/images/donut.jpg';

      case 'Ice Cream':
        return 'assets/images/ice_cream.jpg';

      default:
        return 'assets/images/burger_1.png';
    }
  }

  Widget _buildBottomBar() {
    return SafeArea(
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.cyan.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Total: RM ${totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            ElevatedButton.icon(
              onPressed: totalPrice <= 0
                  ? null
                  : () async {
                      await DatabaseHelper.instance.clearCart();

                      await loadTotalPrice();

                      if (!mounted) return;

                      setState(() {});

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Payment Successful (Demo)",
                          ),
                        ),
                      );
                    },
              icon: const Icon(Icons.payment),
              label: const Text("Payment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
