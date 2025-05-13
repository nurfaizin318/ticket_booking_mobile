import 'package:billjek/Module/Home/viewModel.dart';
import 'package:billjek/Utils/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;



    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text("Nur Faizin",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        // Untuk menghilangkan leading secara default, jika tidak diperlukan:
        automaticallyImplyLeading: false,
       
        // Gunakan action untuk widget di sisi kanan (trailing)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    // Navigasi ke rchat atau aksi lainnya.
                  },
                  icon: const Icon(Icons.chat_outlined, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    // Navigasi ke notifikasi atau aksi lainnya.
                  },
                  icon: const Icon(Icons.notifications_none_outlined, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AccountCard(height),

            const SizedBox(height: 10),

            WalletMenu(),

            const SizedBox(height: 10),
            // Bus Ticket Search Card (ADD THIS in your Column, before Recent Transactions)
            Container(
  
              padding: const EdgeInsets.all(16),
              decoration: RoundedFixBox.getDecoration(radius: 20, color: Color.fromRGBO(225, 225, 225, 0.1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cari Tiket Bus",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Keberangkatan
                  _BusTicketField(
                    icon: Icons.location_on_outlined,
                    label: "Terminal Keberangkatan",
                    value: "Solo (Tirtonadi)",
                    onTap: (){controller.navigateToSelectCity();},
                  ),
                  const SizedBox(height: 12),

                  // Tujuan
                  _BusTicketField(
                    icon: Icons.flag_outlined,
                    label: "Terminal Tujuan",
                    value: "Jakarta (Pulogebang)",
                    onTap: (){controller.navigateToSelectCity();},
                  ),
                  const SizedBox(height: 12),

                  // Kelas Bus
                  _BusTicketField(
                    icon: Icons.event_seat_outlined,
                    label: "Kelas Bus",
                    value: "Executive",
                    onTap: (){print("test");},
                  ),
                  const SizedBox(height: 12),

                  // Tanggal
                  _BusTicketField(
                    icon: Icons.date_range_outlined,
                    label: "Tanggal Keberangkatan",
                    value: "20 Mei 2025",
                    onTap: (){print("test");},
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Cari Tiket",
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Recent Transactions",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("See All", style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              // leading: Image.asset('assets/bca_logo.png', width: 40), // Replace with real image
              title: const Text("OLIVIA GRACE BENNETT"),
              subtitle: const Text("17 Dec 2024 - 13:21"),
              trailing: const Text(
                "-\$20.75",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container WalletMenu() {
    return Container(
      decoration: RoundedFixBox.getDecoration(
          radius: 20, color: Color.fromRGBO(225, 225, 225, 0.2)),
      // color: Color.fromRGBO(225, 225, 225, 0.4),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ActionButton(icon: Icons.qr_code_scanner, label: "Scan"),
          _ActionButton(
              icon: Icons.account_balance_wallet_outlined, label: "Top Up"),
          _ActionButton(icon: Icons.send_outlined, label: "Transfer"),
          _ActionButton(icon: Icons.money_outlined, label: "widtrawal"),
        ],
      ),
    );
  }

  Container AccountCard(double height) {
    return Container(
      width: double.infinity,
      height: height * 0.22,
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Main Account",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 6),
          const Text("9083 2124 9021",
              style: TextStyle(color: Colors.white70, fontSize: 14)),
          const Spacer(),
          const Text("Rp 120.382",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: Colors.blue, size: 26),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}

class _BusTicketField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _BusTicketField({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(value,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

