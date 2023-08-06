import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              
              'Selamat Datang di Aplikasi BillJek',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,

            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RidePage()),
                );
              },
              child: Text('Pesan Ride'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodDeliveryPage()),
                );
              },
              child: Text('Pesan Makanan'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParcelDeliveryPage()),
                );
              },
              child: Text('Kirim Paket'),
            ),
          ],
        ),
      ),
    );
  }
}

class RidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Ride'),
      ),
      body: Center(
        child: Text('Halaman Pesan Ride'),
      ),
    );
  }
}

class FoodDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Makanan'),
      ),
      body: Center(
        child: Text('Halaman Pesan Makanan'),
      ),
    );
  }
}

class ParcelDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kirim Paket'),
      ),
      body: Center(
        child: Text('Halaman Kirim Paket'),
      ),
    );
  }
}
