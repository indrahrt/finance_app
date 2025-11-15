import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/transaction.dart';
import '../widgets/atm_card.dart';
import '../widgets/grid_menu_item.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Deposit Giro', '-Rp1.500.000', 'Deposit'),
      TransactionModel('Asuransi Keluarga', '-Rp100.000', 'Asuransi'),
      TransactionModel('Donasi Tunai', '-Rp150.000', 'Donasi'),
      TransactionModel('Investasi Tanah', '-Rp2.000.000', 'Investasi'),
      TransactionModel('Pinjaman Darurat', '-Rp250.000', 'Pinjaman'),
      TransactionModel('Gaji', '+Rp10.000.000', 'Pendapatan'),
    ];

    final atmCards = [
      'assets/images/kartu2.png',
      'assets/images/kartu3.png',
      'assets/images/kartu4.png',
    ];

    final menuIcons = [
      'assets/images/menu1.png',
      'assets/images/menu2.png',
      'assets/images/menu3.png',
      'assets/images/menu4.png',
      'assets/images/menu5.png',
      'assets/images/menu6.png',
    ];

    final menuLabels = [
      'Deposit',
      'Asuransi',
      'Donasi',
      'Investasi',
      'Catatan Keuangan',
      'Pinjaman',
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),

      // ================= HEADER =================
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3A0CA3), // ungu elegan
                Color(0xFF4361EE), // biru modern
                Color(0xFF4CC9F0), // biru muda premium
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/header.png', // logo di header
              height: 36,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Text(
              "Dhuwit",
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.9), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.6),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/profil.jpg'),
              ),
            ),
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Cards
            Text(
              "KartuKu",
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // ATM Cards
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: atmCards.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, i) {
                  return AtmCard(image: atmCards[i]);
                },
              ),
            ),

            const SizedBox(height: 28),

            // Quick Menu
            Text(
              "Menu",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            GridView.builder(
              itemCount: menuIcons.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, i) {
                return GridMenuItem(image: menuIcons[i], label: menuLabels[i]);
              },
            ),

            const SizedBox(height: 32),

            // Transactions
            Text(
              'Transaksi Terbaru',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.separated(
                itemCount: transactions.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: Colors.grey),
                itemBuilder: (context, i) {
                  return TransactionItem(
                    transaction: transactions[i],
                    index: i,
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