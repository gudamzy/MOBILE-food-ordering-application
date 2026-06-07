  import 'package:food_ordering_application/database_helper.dart';
  import 'package:flutter/material.dart';

  class MediaPage extends StatefulWidget {
    const MediaPage({super.key});

    @override
    State<MediaPage> createState() => _MediaPageState();
  }

  class _MediaPageState extends State<MediaPage> {

  double totalPrice = 0;

  Future<void> loadTotalPrice() async {
    final total = await DatabaseHelper.instance.getTotalPrice();

    setState(() {
      totalPrice = total;
    });
  }
       
@override
void initState() {
  super.initState();
  loadTotalPrice();
}

    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xFFF4FAFA),
          body: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your library...",
                    prefixIcon: const Icon(Icons.search, color: Colors.cyan),
                    filled: true,
                    fillColor: Colors.cyan.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Tab Bar
              const TabBar(
                labelColor: Colors.cyan,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.cyan,
                indicatorWeight: 3,
                tabs: [
                  Tab(text: "Your Food", icon: Icon(Icons.food_bank_sharp)),
                
                ],
              ),

              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    _buildCartList(Icons.photo_library_outlined, 'Food', '3.2 MB'),
                    _buildCartList(Icons.photo_library_outlined, 'Drinks', '128 MB'),
                    _buildCartList(Icons.photo_library_outlined, 'Dessert', '8.5 MB'),
                  ],
                ),
              ),
            ],
          ),

          // Bottom "Action Bar" — shows when items are selected
          bottomNavigationBar: _buildBottomBar(),
        ),
      );
    }

  Widget _buildCartList(IconData icon, String label, String size) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.instance.getCartItems(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final items = snapshot.data!;

        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 64,
                  color: Colors.cyan.withOpacity(0.3),
                ),
                const SizedBox(height: 12),
                Text(
                  "No $label items",
                  style: const TextStyle(
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
            String imagePath = 'assets/images/burger_1.png';

switch (item['foodName']) {
  case 'Burger Special':
    imagePath = 'assets/images/burger_1.png';
    break;
  case 'Laksa Utara':
    imagePath = 'assets/images/laksa.jpg';
    break;
  case 'Mee Kari':
    imagePath = 'assets/images/mee_kari.jpg';
    break;
  case 'Mee Hoon Sup':
    imagePath = 'assets/images/meehun.jpg';
    break;
  case 'Nasi Lemak':
    imagePath = 'assets/images/nasi_lemak.jpg';
    break;
  case 'Chicken Chop':
    imagePath = 'assets/images/chicken_chop.jpg';
    break;
  case 'Teh Ais':
    imagePath = 'assets/images/teh_ais.jpeg';
    break;
  case 'Milo Ais':
    imagePath = 'assets/images/milo_ais.jpeg';
    break;
  case 'Nescafe Ais':
    imagePath = 'assets/images/nescafe_ais.jpeg';
    break;
  case 'Sirap Bandung':
    imagePath = 'assets/images/bandung.jpg';
    break;
  case 'Orange Juice':
    imagePath = 'assets/images/orange_juice.jpg';
    break;
  case 'Mineral Water':
    imagePath = 'assets/images/mineral_water.jpg';
    break;
    case 'Cheesecake':
  imagePath = 'assets/images/cheesecake.jpg';
  break;

case 'Chocolate Cake':
  imagePath = 'assets/images/chocolate_cake.jpg';
  break;

case 'Brownies':
  imagePath = 'assets/images/brownies.jpg';
  break;

case 'Pudding':
  imagePath = 'assets/images/pudding.png';
  break;

case 'Donut':
  imagePath = 'assets/images/donut.jpg';
  break;

case 'Ice Cream':
  imagePath = 'assets/images/ice_cream.jpg';
  break;
}

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
                    Container(
  width: 60,
  height: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
  imagePath,
  fit: BoxFit.cover,
),
  ),
),
                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['foodName'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "RM ${item['price']} | Qty: ${item['quantity']}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

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

    Widget _buildBottomBar() {
  return Container(
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
          onPressed: () async {
  await DatabaseHelper.instance.clearCart();

  await loadTotalPrice();

  setState(() {});

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Payment Successful (Demo)"),
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
  );
}}
  