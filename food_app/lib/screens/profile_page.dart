import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/app_strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.profile)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ---- Account header ----
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFFFE4D9),
              child: Icon(Icons.person, size: 40, color: Color.fromRGBO(108, 31, 4, 1)),
              
            ),
            const SizedBox(height: 12),
            const Text(
              AppStrings.demoUserName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              AppStrings.demoEmail,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
            const SizedBox(height: 24),

            // ---- Quick stats row ----
            Row(
              children: [
                Expanded(child: _statCard(context, '4', AppStrings.ordersLabel)),
                const SizedBox(width: 12),
                Expanded(
                    child: _statCard(context, '10', AppStrings.wishlistLabel)),
                const SizedBox(width: 12),
                Expanded(
                    child: _statCard(context, '2', AppStrings.reviewsLabel)),
              ],
            ),
            const SizedBox(height: 24),

            const Text(AppStrings.settings,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 8),

            _menuTile(context, Icons.receipt_long_outlined,
                AppStrings.orderHistory),
            _menuTile(context, Icons.location_on_outlined,
                AppStrings.shippingAddress),
            _menuTile(
                context, Icons.payment_outlined, AppStrings.paymentMethods),
            _menuTile(context, Icons.notifications_none_rounded,
                AppStrings.notifications),
            _menuTile(context, Icons.help_outline_rounded,
                AppStrings.helpAndSupport),

            const SizedBox(height: 12),

            // ---- Log out button ----
            OutlinedButton(
              onPressed: () {
                // offAllNamed clears the whole navigation stack, so the
                // user can't press "back" into the app after logging out.
                Get.offAllNamed(AppRoutes.login);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                foregroundColor: const Color.fromRGBO(108, 31, 4, 1),
                side: const BorderSide(color: Color.fromRGBO(108, 31, 4, 1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(AppStrings.logOut),
            ),
          ],
        ),
      ),
    );
  }

  // Small card used for the Orders / Favorites / Reviews numbers.
  Widget _statCard(BuildContext context, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  // One row in the settings list (e.g. "Order History").
  Widget _menuTile(BuildContext context, IconData icon, String label) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {},
      ),
    );
  }
}
