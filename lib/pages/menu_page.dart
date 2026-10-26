
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_text.dart';
import 'detail_page.dart';
import 'add_menu_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Map<String, dynamic>> menuList = [
    {
      'name': 'Nasi Goreng',
      'price': 15000,
      'description': 'Nasi goreng spesial dengan telur dan bumbu pilihan.',
    },
    {
      'name': 'Mie Ayam',
      'price': 12000,
      'description': 'Mie ayam dengan topping ayam kecap yang lezat.',
    },
    {
      'name': 'Bakso',
      'price': 13000,
      'description': 'Bakso sapi dengan kuah gurih dan segar.',
    },
    {
      'name': 'Soto Ayam',
      'price': 18000,
      'description': 'Soto ayam dengan kuah rempah khas Indonesia.',
    },
    {
      'name': 'Es Teh',
      'price': 5000,
      'description': 'Minuman teh manis dingin yang menyegarkan.',
    },
  ];

  String formatRupiah(int price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(price);
  }

  void addMenu(Map<String, dynamic> newMenu) {
    setState(() {
      menuList.add(newMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const CustomText(
          text: 'Daftar Menu',
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const CustomText(
              text: 'Menu Kantin',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: menuList.length,
              itemBuilder: (context, index) {
                final menu = menuList[index];

                return Card(
                  elevation: 2,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant_menu,
                      color: Colors.green,
                      size: 28,
                    ),

                    title: CustomText(
                      text: menu['name'],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    subtitle: CustomText(
                      text: formatRupiah(menu['price']),
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),

                    onTap: () {
                      Get.to(
                        () => DetailPage(
                          name: menu['name'],
                          price: menu['price'],
                          description: menu['description'],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        tooltip: 'Tambah Menu',
        onPressed: () async {
          final newMenu = await Get.to<Map<String, dynamic>>(
            () => const AddMenuPage(),
          );

          if (newMenu != null) {
            addMenu(newMenu);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
