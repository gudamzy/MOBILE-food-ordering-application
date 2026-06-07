import 'package:food_ordering_application/database_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

double getPrice(String itemName) {
  switch (itemName) {
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
    default:
      return 10.00;
  }
}

  @override
  Widget build(BuildContext context) {
    // DefaultTabController manages the state of the tabs automatically
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // Removing the internal AppBar to prevent the "Double Header" look 
        // since your main wrapper likely already has an AppBar.
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // 1. Search Bar - Matching your Home Page's clean look
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

            // 2. Tab Bar - To switch between content types
            const TabBar(
              labelColor: Colors.cyan,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.cyan,
              indicatorWeight: 3,
              tabs: [
                Tab(text: "Food", icon: Icon(Icons.food_bank_sharp)),
                Tab(text: "Drinks", icon: Icon(Icons.local_drink_sharp)),
                Tab(text: "Dessert", icon: Icon(Icons.cake)),
              ],
            ),

            // 3. TabBarView - Displays content based on the selected Tab
            Expanded(
              child: TabBarView(
                children: [
                  _buildMediaGrid(Icons.photo_library_outlined, "Food"),
                  _buildMediaGrid(Icons.photo_library_outlined, "Drinks"),
                  _buildMediaGrid(Icons.photo_library_outlined, "Dessert"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a consistent Grid UI for each tab
  Widget _buildMediaGrid(IconData icon, String label) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.1, // Adjusts the height/width of cards
      ),
      itemCount: 6, // Example count
      itemBuilder: (context, index) {
    List<String> menuNames = [];

if (label == "Food") {
  menuNames = [
    "Burger Special",
    "Laksa Utara",
    "Mee Kari",
    "Mee Hoon Sup",
    "Nasi Lemak",
    "Chicken Chop",
  ];
}

if (label == "Drinks") {
  menuNames = [
    "Teh Ais",
    "Milo Ais",
    "Nescafe Ais",
    "Sirap Bandung",
    "Orange Juice",
    "Mineral Water",
  ];
}

if (label == "Dessert") {
  menuNames = [
    "Chocolate Cake",
    "Cheesecake",
    "Brownies",
    "Pudding",
    "Donut",
    "Ice Cream",
  ];
}

final itemName = menuNames[index];

      String imagePath = 'assets/images/burger_1.png';



if (label == "Food") {
  switch (index) {
    case 0:
      imagePath = 'assets/images/burger_1.png';
      break;
    case 1:
      imagePath = 'assets/images/laksa.jpg';
      break;
    case 2:
      imagePath = 'assets/images/mee_kari.jpg';
      break;
    case 3:
      imagePath = 'assets/images/meehun.jpg';
      break;
    case 4:
      imagePath = 'assets/images/nasi_lemak.jpg';
      break;
    case 5:
      imagePath = 'assets/images/chicken_chop.jpg';
      break;
  }
}

if (label == "Drinks") {
  switch (index) {
    case 0:
      imagePath = 'assets/images/teh_ais.jpeg';
      break;
    case 1:
      imagePath = 'assets/images/milo_ais.jpeg';
      break;
    case 2:
      imagePath = 'assets/images/nescafe_ais.jpeg';
      break;
    case 3:
      imagePath = 'assets/images/bandung.jpg';
      break;
    case 4:
      imagePath = 'assets/images/orange_juice.jpeg';
      break;
    case 5:
      imagePath = 'assets/images/mineral_water.jpg';
      break;
  }
}

if (label == "Dessert") {
  switch (index) {
    case 0:
      imagePath = 'assets/images/chocholate_cake.jpg';
      break;
    case 1:
      imagePath = 'assets/images/cheesecake.jpg';
      break;
    case 2:
      imagePath = 'assets/images/brownies.jpg';
      break;
    case 3:
      imagePath = 'assets/images/pudding.png';
      break;
    case 4:
      imagePath = 'assets/images/donut.jpg';
      break;
    case 5:
      imagePath = 'assets/images/ice_cream.jpg';
      break;
  }
}

      // 1. Create variables to hold our custom details
        String customDescription = "";
        String customTime = "Added yesterday";

        // 2. Set different details based on the Tab Label
        if (label == "Food") {
          customDescription = "A freshly prepared, hot savory dish made with premium local ingredients. Served with your choice of side condiments.";
          customTime = "Added yesterday · 12:45 PM";
        } else if (label == "Drinks") {
          customDescription = "An ice-cold, refreshing beverage perfectly sweetened to quench your thirst. Made fresh at the UniKL Bistro bar station.";
          customTime = "Added 2 hours ago";
        } else if (label == "Dessert") {
          customDescription = "A sweet, decadent pastry treats baked fresh this morning. The perfect finish to your UniKL Bistro dining experience.";
          customTime = "Added yesterday · 9:15 AM";
        }

       return InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetailPage(
          title: itemName,
          icon: icon,
          description: customDescription,
          timeAdded: customTime,
          price: getPrice(itemName),
        ),
      ),
    );
  },
  borderRadius: BorderRadius.circular(20),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.cyan.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(
          itemName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Added yesterday",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
      },
    );
  }
}

// --- FULL SCREEN FOOD DETAIL PAGE & DESCRIPTION INFO ---
class PhotoDetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final String timeAdded;
  final double price;

  const PhotoDetailPage({
  super.key,
  required this.title,
  required this.icon,
  required this.description,
  required this.timeAdded,
  required this.price,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark cinematic style background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 1. Section Makanan: Takes up available space to display the big picture safely
          Expanded(
            child: Center(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4.0,
                child: Icon(
                  icon,
                  size: 220,
                  color: Colors.cyan,
                ),
              ),
            ),
          ),

          // 2. Section Detail Makanan: A clean details card panel area
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30), // Gives it a modern rounded look at the top
              ),
            ),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Ensures card wraps snugly around content text
              children: [
                // Item Name Header
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 6),
                
                // Timestamp info
                Text(
                  timeAdded,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Thin aesthetic horizontal separator line
                Divider(color: Colors.grey.shade200, thickness: 1),
                const SizedBox(height: 16),
                
                // Description Section Title
                const Text(
                  "Item Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 15),

                Text(
  description,
  style: const TextStyle(
    fontSize: 15,
    color: Colors.black54,
    height: 1.5,
  ),
),

Text(
  "Price: RM ${price.toStringAsFixed(2)}",
  style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  ),
),

const SizedBox(height: 20),
                
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () async {
      await DatabaseHelper.instance.addToCart(
  title,
  price,
  1,
);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title added to cart'),
        ),
      );
    },
    child: const Text('Add To Cart'),
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