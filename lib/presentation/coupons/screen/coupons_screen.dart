import 'package:flutter/material.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Coupons',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Unlock exclusive deals and rewards.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey[400],
                ),
              ),
              const Expanded(
                child: Center(
                  child: Icon(
                    Icons.local_offer_rounded,
                    size: 100,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
