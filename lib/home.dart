import 'package:flutter/material.dart';
import 'package:food_ordering_application/database_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  double getPrice(String itemName) {
    switch (itemName) {
      // Food
      case 'Burger Special':
        return 12.90;
      case 'Laksa Utara':
        return 8.90;
      case 'Mee Kari':
        return 7.90;
      case 'Mee Hoon Sup':
        return 6.90;
      case 'Nasi Lemak':
        return 5.90;
      case 'Chicken Chop':
        return 15.90;

      // Drinks
      case 'Teh Ais':
        return 2.50;
      case 'Milo Ais':
        return 3.50;
      case 'Nescafe Ais':
        return 3.00;
      case 'Sirap Bandung':
        return 2.00;
      case 'Orange Juice':
        return 4.50;
      case 'Mineral Water':
        return 1.50;

      // Dessert
      case 'Chocolate Cake':
        return 8.90;
      case 'Cheesecake':
        return 9.90;
      case 'Brownies':
        return 6.90;
      case 'Pudding':
        return 5.90;
      case 'Donut':
        return 4.50;
      case 'Ice Cream':
        return 5.50;

      default:
        return 0.00;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search menu...",
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

            // Tab Bar
            const TabBar(
              labelColor: Colors.cyan,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.cyan,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "Food",
                  icon: Icon(Icons.food_bank_sharp),
                ),
                Tab(
                  text: "Drinks",
                  icon: Icon(Icons.local_drink_sharp),
                ),
                Tab(
                  text: "Dessert",
                  icon: Icon(Icons.cake),
                ),
              ],
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                children: [
                  _buildMediaGrid(
                    context,
                    "Food",
                  ),
                  _buildMediaGrid(
                    context,
                    "Drinks",
                  ),
                  _buildMediaGrid(
                    context,
                    "Dessert",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaGrid(
    BuildContext context,
    String label,
  ) {
    final List<String> menuNames = _getMenuNames(label);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.1,
      ),
      itemCount: menuNames.length,
      itemBuilder: (context, index) {
        final String itemName = menuNames[index];
        final String imagePath =
            _getImagePath(label, index);
        final String customDescription =
            _getDescription(itemName);
        final String customTime =
            _getTimeAdded(itemName);
        final double price =
            getPrice(itemName);

        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PhotoDetailPage(
                  title: itemName,
                  imagePath: imagePath,
                  description: customDescription,
                  timeAdded: customTime,
                  price: price,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan
                      .withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  itemName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "RM ${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<String> _getMenuNames(String label) {
    if (label == "Food") {
      return [
        "Burger Special",
        "Laksa Utara",
        "Mee Kari",
        "Mee Hoon Sup",
        "Nasi Lemak",
        "Chicken Chop",
      ];
    }

    if (label == "Drinks") {
      return [
        "Teh Ais",
        "Milo Ais",
        "Nescafe Ais",
        "Sirap Bandung",
        "Orange Juice",
        "Mineral Water",
      ];
    }

    return [
      "Chocolate Cake",
      "Cheesecake",
      "Brownies",
      "Pudding",
      "Donut",
      "Ice Cream",
    ];
  }

  String _getImagePath(
    String label,
    int index,
  ) {
    if (label == "Food") {
      switch (index) {
        case 0:
          return 'assets/images/burger_1.png';
        case 1:
          return 'assets/images/laksa.jpg';
        case 2:
          return 'assets/images/mee_kari.jpg';
        case 3:
          return 'assets/images/meehun.jpg';
        case 4:
          return 'assets/images/nasi_lemak.jpg';
        case 5:
          return 'assets/images/chicken_chop.jpg';
      }
    }

    if (label == "Drinks") {
      switch (index) {
        case 0:
          return 'assets/images/teh_ais.jpeg';
        case 1:
          return 'assets/images/milo_ais.jpeg';
        case 2:
          return 'assets/images/nescafe_ais.jpeg';
        case 3:
          return 'assets/images/bandung.jpg';
        case 4:
          return 'assets/images/orange_juice.jpg';
        case 5:
          return 'assets/images/mineral_water.jpg';
      }
    }

    if (label == "Dessert") {
      switch (index) {
        case 0:
          return 'assets/images/chocolate_cake.jpg';
        case 1:
          return 'assets/images/cheesecake.jpg';
        case 2:
          return 'assets/images/brownies.jpg';
        case 3:
          return 'assets/images/pudding.png';
        case 4:
          return 'assets/images/donut.jpg';
        case 5:
          return 'assets/images/ice_cream.jpg';
      }
    }

    return 'assets/images/burger_1.png';
  }

  String _getDescription(String itemName) {
    switch (itemName) {
      case "Nasi Lemak":
        return "Traditional Malaysian coconut rice served with sambal, fried chicken, egg, peanuts and cucumber.";

      case "Burger Special":
        return "Juicy beef burger layered with fresh lettuce, tomatoes, cheese and our signature sauce.";

      case "Laksa Utara":
        return "Authentic northern-style laksa served with rich fish broth and fresh vegetables.";

      case "Mee Kari":
        return "Spicy and creamy curry noodles topped with chicken, tofu puffs and fresh herbs.";

      case "Mee Hoon Sup":
        return "Light and comforting rice vermicelli soup served with tender chicken slices.";

      case "Chicken Chop":
        return "Crispy chicken chop served with fries, salad and black pepper sauce.";

      case "Teh Ais":
        return "Refreshing iced milk tea prepared fresh and served chilled.";

      case "Milo Ais":
        return "Classic Malaysian chocolate malt drink served over ice.";

      case "Nescafe Ais":
        return "Smooth iced coffee made with premium Nescafe blend.";

      case "Sirap Bandung":
        return "Sweet rose syrup drink mixed with milk and served cold.";

      case "Orange Juice":
        return "Fresh orange juice packed with natural vitamins and refreshing flavour.";

      case "Mineral Water":
        return "Pure bottled drinking water for a healthy and refreshing choice.";

      case "Chocolate Cake":
        return "Rich and moist chocolate cake topped with smooth chocolate frosting.";

      case "Cheesecake":
        return "Creamy cheesecake with a buttery biscuit base and smooth texture.";

      case "Brownies":
        return "Soft and fudgy chocolate brownies baked fresh daily.";

      case "Pudding":
        return "Smooth caramel pudding with a rich and sweet flavour.";

      case "Donut":
        return "Freshly baked donut topped with colourful sprinkles and sweet glaze.";

      case "Ice Cream":
        return "Creamy vanilla ice cream served as a refreshing dessert.";

      default:
        return "Freshly prepared menu item.";
    }
  }

  String _getTimeAdded(String itemName) {
    switch (itemName) {
      case "Nasi Lemak":
        return "Added yesterday · 12:45 PM";

      case "Burger Special":
        return "Added today · 10:15 AM";

      case "Laksa Utara":
        return "Added today · 9:30 AM";

      default:
        return "Available now";
    }
  }
}

class PhotoDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final String timeAdded;
  final double price;

  const PhotoDetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.timeAdded,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin:
                    const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Container(
            width: double.infinity,
            decoration:
                const BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            padding:
                const EdgeInsets.fromLTRB(
              24,
              32,
              24,
              40,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  timeAdded,
                  style: TextStyle(
                    fontSize: 13,
                    color:
                        Colors.grey.shade600,
                    fontWeight:
                        FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 16),

                Divider(
                  color:
                      Colors.grey.shade200,
                  thickness: 1,
                ),

                const SizedBox(height: 16),

                const Text(
                  "Item Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  description,
                  style:
                      const TextStyle(
                    fontSize: 15,
                    color:
                        Colors.black54,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Price: RM ${price.toStringAsFixed(2)}",
                  style:
                      const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await DatabaseHelper
                          .instance
                          .addToCart(
                        title,
                        price,
                        1,
                      );

                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger
                          .of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            '$title added to cart',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.add_shopping_cart,
                    ),
                    label: const Text(
                      'Add To Cart',
                    ),
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.cyan,
                      foregroundColor:
                          Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
