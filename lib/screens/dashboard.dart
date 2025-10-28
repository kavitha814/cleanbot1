// screens/dashboard_screen.dart
import 'package:flutter/material.dart';

class DashboardScreen1 extends StatefulWidget {
  const DashboardScreen1({Key? key}) : super(key: key);

  @override
  State<DashboardScreen1> createState() => _DashboardScreenState1();
}

class _DashboardScreenState1 extends State<DashboardScreen1> {
  String _currentLocation = 'Living Room';
  int _garbageLevel = 87;
  int _batteryStatus = 80;
  double _distanceCovered = 3.82;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Smart Cleaning Bot',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCard(
                    icon: Icons.location_on,
                    iconColor: const Color(0xFFE91E63),
                    title: 'Location',
                    value: _currentLocation,
                  ),
                  _buildCard(
                    icon: Icons.delete_outline,
                    iconColor: const Color(0xFF9E9E9E),
                    title: 'Garbage Level',
                    value: '$_garbageLevel%',
                  ),
                  _buildCard(
                    icon: Icons.battery_charging_full,
                    iconColor: const Color(0xFF4CAF50),
                    title: 'Battery',
                    value: '$_batteryStatus%',
                  ),
                  _buildCard(
                    icon: Icons.straighten,
                    iconColor: const Color(0xFF2196F3),
                    title: 'Distance',
                    value: '$_distanceCovered m',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}