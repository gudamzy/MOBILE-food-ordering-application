import 'package:flutter/material.dart';
import 'package:food_ordering_application/home.dart';
import 'package:food_ordering_application/cart.dart';
import 'package:food_ordering_application/profile.dart';

class ColumnPage extends StatefulWidget {
  final bool isGuest;

  const ColumnPage({
    super.key,
    required this.isGuest,
  });

  @override
  State<ColumnPage> createState() => _ColumnPageState(); // must when use stateful
}

class _ColumnPageState extends State<ColumnPage> {
    int currentIndex = 0; //on which page are we

 final List<Widget> pages = [
     const HomePage(),
     const MediaPage(),
     const ProfilePage(),  //nak panggil daripada file lain
  ];

/*Container(
      color: Colors.cyanAccent,
      child: const Center(
        child: Text("Welcome"),
      ),
    ),
    Container(
      color: Colors.amberAccent,
      child: const Center(
        child: Text("Media Page"),
      ),
    ),
    Container(
      color: Colors.lightGreenAccent,
      child: const Center(
        child: Text("Profile Page"),
      ),
    ), */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniKL Bistro'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentIndex = 0; // Tukar screen pegi HomePage
                  }
                );
              },
            ),

            ListTile(
  leading: const Icon(Icons.trolley),
  title: const Text('Cart'),
  onTap: () {

    if (widget.isGuest) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please login to access Cart",
          ),
        ),
      );
      return;
    }

    Navigator.pop(context);

    setState(() {
      currentIndex = 1;
    });
  },
),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentIndex = 2; // Tukar screen pegi HomePage
                  }
                );
              },
            ),
          ],
        ),
      ),
      body: pages[currentIndex],    //based on index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,     //which page
        onTap: (index) {

  if (widget.isGuest && index == 1) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Guest users cannot access Cart. Please login.",
        ),
      ),
    );
    return;
  }

  setState(() {
    currentIndex = index;
  });
},
        items: const [        //button
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trolley),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Column Page'),
        centerTitle: true,
      ),

      drawer: Drawer(  //sidebar from library
              child: ListView( //a menu can have many items, so scrolling is needed

                children: [  //a menu can have many items, so scrolling is needed
                  const DrawerHeader( //set for sidebar heafer -24
                    decoration:
                      BoxDecoration(
                        color:
                        Colors.redAccent,
                      ),
                    child: Text('UniKL Bistro',
                      style: TextStyle(
                        color:
                      Colors.white,
                        fontSize: 24,
                      ),
                    ),  
                  ),

                  ListTile( //createclickable menu in list
                    leading: const
                    Icon(Icons.home),
                    title: const
                    Text('Menu'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  ListTile( //createclickable menu in list
                    leading: const
                    Icon(Icons.trolley),
                    title: const
                    Text('Cart'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  ListTile( //createclickable menu in list
                    leading: const
                    Icon(Icons.person),
                    title: const
                    Text('Profile'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
          ),
      );
    
  }


// --- CLASS UNTUK PAGE BARU (TASK 2) ---
class NewPage extends StatelessWidget {
  final String title; // kalau kau letak kt listtile nama dia setting, then kt new page pon akan stay nama setting tu
  const NewPage({super.key, required this.title}); // sama jugak, automatik nama text appbar tu ikut apa nama tajuk listtile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('This is the $title page')),
    );
  }
}