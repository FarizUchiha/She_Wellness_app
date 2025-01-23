import 'package:flutter/material.dart';
import 'payment.dart';

class BookingScreen extends StatelessWidget {
  final String sessionName;
  final double price;

  BookingScreen({required this.sessionName, required this.price});

  @override
  Widget build(BuildContext context) {
    TextEditingController durationController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();

    double totalPrice = 0;

    // Session descriptions
    Map<String, String> sessionDescriptions = {
      'Pilates': "Sophia's Pilates classes are designed to strengthen your core, improve your posture, and enhance your flexibility.",
      'Yoga': "Experience tranquility and improve your flexibility with our Yoga sessions, suitable for all levels.",
      'Eating Healthy': "Learn how to prepare healthy meals and maintain a balanced diet with our Eating Healthy program.",
      'Mental Health': "Join our Mental Health sessions to build resilience, manage stress, and promote emotional well-being.",
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('$sessionName Booking'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                )

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
                sessionDescriptions[sessionName] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Duration (Months):',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter number of months',
                ),
                onChanged: (value) {
                  int months = int.tryParse(value) ?? 0;
                  totalPrice = months * price;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Start Date:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: startDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'DD/MM/YYYY',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'End Date:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: endDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'DD/MM/YYYY',
                ),
              ),
             
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          sessionName: sessionName,
                          totalPrice: totalPrice,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Book',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}