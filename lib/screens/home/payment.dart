import 'package:flutter/material.dart';
import 'package:she_wellness_app/screens/profile/history.dart';

class PaymentScreen extends StatelessWidget {
  final String sessionName;
  final double totalPrice;

  PaymentScreen({required this.sessionName, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
'assets/${sessionName.toLowerCase().replaceAll(' ', '-')}.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              sessionName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Price: RM ${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Methods:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Radio(value: true, groupValue: true, onChanged: (_) {}),
              title: const Text('Online Banking'),
            ),
            ListTile(
              leading: Radio(value: false, groupValue: true, onChanged: (_) {}),
              title: const Text('Credit / Debit Card'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Pass session data to HistoryPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(
                        newSession: {
                          'date': 'Today',
                          'session': sessionName,
                          'duration': '1 month',
                          'price': 'RM ${totalPrice.toStringAsFixed(2)}',
                          'review': '',
                          'image':
                              'assets/${sessionName.toLowerCase().replaceAll(' ', '-')}.jpg',
                          'rating': 0,
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Pay',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
