import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/menu_data.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import '../routes/app_routes.dart';
import '../utils/app_strings.dart';

/// Home page — shows a searchable, filterable grid of menu items.
///
/// StatefulWidget because the search text and the selected category
/// change while the user interacts with the page.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _query = '';
  String _selectedCategory = AppStrings.allCategory;

  // Builds the list of category names from the menu data, with
  // "All" always first.
  List<String> get _categories => [
        AppStrings.allCategory,
        ...{for (final item in menuItems) item.category},
      ];

  // Returns only the items that match the search text and the
  // selected category.
  List<MenuItem> get _filteredItems {
    return menuItems.where((item) {
      final matchesCategory = _selectedCategory == AppStrings.allCategory ||
          item.category == _selectedCategory;
      final matchesQuery =
          item.name.toLowerCase().contains(_query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void _onAddPressed(MenuItem item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppStrings.addedToCart(item.name)),
        duration: const Duration(milliseconds: 900),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.greeting,
                style: TextStyle(color: Colors.black54, fontSize: 13)),
            Text(AppStrings.findGreatDeals,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFFFE4D9),
              child: Icon(Icons.person, color: Color.fromRGBO(108, 31, 4, 1)),
            ),
            onPressed: () => Get.toNamed(AppRoutes.profile),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ---- Search field ----
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextField(
                onChanged: (value) => setState(() => _query = value),
                decoration: const InputDecoration(
                  hintText: AppStrings.searchHint,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // ---- Category chips ----
            SizedBox(
              height: 52,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                itemCount: _categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = category == _selectedCategory;
                  return ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) =>
                        setState(() => _selectedCategory = category),
                  );
                },
              ),
            ),

            // ---- Menu grid takes the remaining vertical space ----
            Expanded(
              child: _filteredItems.isEmpty
                  ? const Center(child: Text(AppStrings.noItemsFound))
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      itemCount: _filteredItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 0.68,
                      ),
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        return MenuItemCard(
                          item: item,
                          onAddPressed: () => _onAddPressed(item),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
