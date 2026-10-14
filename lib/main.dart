import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const IndiaDailyApp());
}

class IndiaDailyApp extends StatelessWidget {
  const IndiaDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'India Daily Live News',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F8),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE31E24)),
        fontFamily: 'Arial',
      ),
      home: const MainScreen(),
    );
  }
}

// ------------------------------------------------------------
// MAIN SCREEN
// ------------------------------------------------------------

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    SearchPage(),
    VideosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFFFE7E7),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline),
            selectedIcon: Icon(Icons.play_circle),
            label: 'Videos',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// HOME PAGE
// ------------------------------------------------------------

// ------------------------------------------------------------
// CATEGORY PAGE
// ------------------------------------------------------------

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      ('National', Icons.account_balance),
      ('Politics', Icons.gavel),
      ('Business', Icons.business_center),
      ('Technology', Icons.memory),
      ('Sports', Icons.sports_cricket),
      ('Entertainment', Icons.movie),
      ('World', Icons.public),
      ('Lifestyle', Icons.favorite),
    ];

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        categories[index].$2,
                        size: 34,
                        color: const Color(0xFFE31E24),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index].$1,
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                );
              }, childCount: categories.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// SEARCH PAGE
// ------------------------------------------------------------

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Search News',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search latest news...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Search for articles, topics and stories',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// VIDEOS PAGE
// ------------------------------------------------------------

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text(
              'Videos',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _videoItem('Latest News Video', Icons.play_circle_fill),
                _videoItem(
                  'India Daily Special Report',
                  Icons.play_circle_fill,
                ),
                _videoItem('Today In India', Icons.play_circle_fill),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _videoItem(String title, IconData icon) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF202020),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
            ),
            child: Icon(icon, color: Colors.white, size: 42),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
