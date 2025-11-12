import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/feature_item.dart';
import '../widgets/action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFD4AF37),
                  Color(0xFF6B4226),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: FloatingActionButton(
              elevation: 6,
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: const Icon(Icons.qr_code, color: Colors.white, size: 30),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "QRIS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  blurRadius: 3,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFD4AF37),
              Color(0xFFFDF6E3),
              Color(0xFF6B4226),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hi, Neni Mulyani 👋",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black26,
                                    offset: Offset(1, 1),
                                    blurRadius: 2,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Selamat siang ☀️",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.brown.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(2, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications,
                            color: Color(0xFF6B4226)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AtmCard(),
                      const SizedBox(height: 12),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Cari fitur seperti Transfer, PDAM...',
                            prefixIcon:
                                Icon(Icons.search, color: Color(0xFF6B4226)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 110,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            const SizedBox(width: 8),
                            FeatureItem(icon: Icons.send, title: 'Transfer', onTap: () {}),
                            const SizedBox(width: 12),
                            FeatureItem(icon: Icons.payment, title: 'Bayar', onTap: () {}),
                            const SizedBox(width: 12),
                            FeatureItem(icon: Icons.account_balance, title: 'Akun', onTap: () {}),
                            const SizedBox(width: 12),
                            FeatureItem(icon: Icons.water_drop, title: 'PDAM', onTap: () {}),
                            const SizedBox(width: 12),
                            FeatureItem(icon: Icons.local_atm, title: 'ATM', onTap: () {}),
                            const SizedBox(width: 12),
                            FeatureItem(icon: Icons.credit_card, title: 'Gesek', onTap: () {}),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Center(
                        child: Text(
                          'Layanan Keuangan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      Center(
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.center,
                              children: _getDisplayedButtons(),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showAll = !showAll;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  showAll
                                      ? 'Lihat Lebih Sedikit'
                                      : 'Lihat Selengkapnya',
                                  style: const TextStyle(
                                    color: Color(0xFF6B4226),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Daftar Transaksi Terakhir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // 🔹 Daftar transaksi (ikon selaras, angka dinamis)
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFDF6E3),
                              Color(0xFFFFF8E1),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.25),
                              blurRadius: 8,
                              offset: const Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _buildTransactionItem(
                              icon: Icons.arrow_upward,
                              title: 'Transfer ke Andi',
                              date: '11 November 2025',
                              amount: '-Rp 250.000',
                            ),
                            const Divider(height: 1, color: Color(0xFFBCA37F)),
                            _buildTransactionItem(
                              icon: Icons.water_drop,
                              title: 'PDAM Kota',
                              date: '10 November 2025',
                              amount: '-Rp 75.000',
                            ),
                            const Divider(height: 1, color: Color(0xFFBCA37F)),
                            _buildTransactionItem(
                              icon: Icons.add_card,
                              title: 'Top Up Saldo',
                              date: '9 November 2025',
                              amount: '+Rp 500.000',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF6B4226),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildNavItem(Icons.home, "Home"),
                  const SizedBox(width: 16),
                  _buildNavItem(Icons.history, "Mutasi"),
                ],
              ),
              const SizedBox(width: 40),
              Row(
                children: [
                  _buildNavItem(Icons.favorite, "Favorit"),
                  const SizedBox(width: 16),
                  _buildNavItem(Icons.person, "Akun"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  List<Widget> _getDisplayedButtons() {
    final allButtons = [
      {'title': 'Top Up', 'icon': Icons.add_card},
      {'title': 'Setor & Tarik', 'icon': Icons.account_balance_wallet},
      {'title': 'Pulsa', 'icon': Icons.phone_android},
      {'title': 'Catatan Keuangan', 'icon': Icons.note_alt},
      {'title': 'Pinjaman', 'icon': Icons.request_quote},
      {'title': 'Tagihan', 'icon': Icons.receipt_long},
      {'title': 'Asuransi', 'icon': Icons.verified_user},
      {'title': 'Donasi', 'icon': Icons.volunteer_activism},
      {'title': 'PLN', 'icon': Icons.bolt},
    ];

    final displayed = showAll ? allButtons : allButtons.take(6).toList();

    return displayed
        .map(
          (btn) => SizedBox(
            width: 90,
            child: ActionButton(
              title: btn['title'] as String,
              icon: btn['icon'] as IconData,
            ),
          ),
        )
        .toList();
  }

  // 🔹 Item transaksi (ikon senada, nominal warna dinamis)
  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String date,
    required String amount,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFFD4AF37),
              Color(0xFF6B4226),
            ],
          ),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF4E342E),
        ),
      ),
      subtitle: Text(
        date,
        style: const TextStyle(color: Color(0xFF8D6E63)),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: amount.startsWith('-')
              ? Colors.redAccent
              : const Color(0xFF2E7D32),
        ),
      ),
    );
  }
}
