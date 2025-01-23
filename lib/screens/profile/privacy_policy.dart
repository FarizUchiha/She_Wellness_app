import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: January 1, 2025',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'She Wellness Club is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your information when you use our application.',
            ),
            SizedBox(height: 16),
            Text(
              'Information We Collect',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. **Personal Information:** Name, email address, phone number, and other identifiable information you provide during registration or while using the app.\n'
              '2. **Session Data:** History of sessions booked, reviews given, and ratings.\n'
              '3. **Device Information:** Information about the device you use to access the app, such as IP address and operating system.',
            ),
            SizedBox(height: 16),
            Text(
              'How We Use Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. To provide and manage your access to the She Wellness Club application.\n'
              '2. To improve the app by analyzing user activity and feedback.\n'
              '3. To communicate updates, promotions, or other relevant information.\n'
              '4. To ensure the security and integrity of our services.',
            ),
            SizedBox(height: 16),
            Text(
              'Sharing Your Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We do not sell, trade, or rent your personal information to others. However, we may share your data with third-party service providers for the following purposes:\n'
              '- Payment processing\n'
              '- App performance analysis\n'
              '- Customer support',
            ),
            SizedBox(height: 16),
            Text(
              'Your Rights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. **Access Your Data:** You have the right to access the information we hold about you.\n'
              '2. **Update Your Data:** Update your personal details in the app settings.\n'
              '3. **Delete Your Data:** Request the deletion of your data by contacting our support team.',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have questions about this Privacy Policy, you can contact us at:',
            ),
            SizedBox(height: 8),
            Text(
              'Email: support@shewellnessclub.com',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Phone: +60-186-156-046',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Updates to This Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update this Privacy Policy from time to time. Any changes will be posted on this page with the updated effective date.',
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for trusting She Wellness Club!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: PrivacyPolicyPage()));
}
