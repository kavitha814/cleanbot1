// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _objectDetectionAlerts = true;
  bool _fallDetectionAlerts = true;
  bool _lowBatteryAlerts = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Device Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSettingsTile(
          Icons.wifi,
          'Wi-Fi Connection',
          'Connected to Home Network',
          () {
            _showDialog(context, 'Wi-Fi Connection', 'Wi-Fi settings would open here');
          },
        ),
        _buildSettingsTile(
          Icons.map,
          'Manage Maps',
          'Edit and customize cleaning maps',
          () {
            _showDialog(context, 'Manage Maps', 'Map management screen would open here');
          },
        ),
        _buildSettingsTile(
          Icons.power_settings_new,
          'Power Settings',
          'Configure power and charging',
          () {
            _showDialog(context, 'Power Settings', 'Power configuration would open here');
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSwitchTile(
          Icons.notifications,
          'Enable Notifications',
          _notificationsEnabled,
          (value) {
            setState(() {
              _notificationsEnabled = value;
            });
          },
        ),
        _buildSwitchTile(
          Icons.remove_red_eye,
          'Object Detection Alerts',
          _objectDetectionAlerts,
          (value) {
            setState(() {
              _objectDetectionAlerts = value;
            });
          },
        ),
        _buildSwitchTile(
          Icons.warning,
          'Fall Detection Alerts',
          _fallDetectionAlerts,
          (value) {
            setState(() {
              _fallDetectionAlerts = value;
            });
          },
        ),
        _buildSwitchTile(
          Icons.battery_alert,
          'Low Battery Alerts',
          _lowBatteryAlerts,
          (value) {
            setState(() {
              _lowBatteryAlerts = value;
            });
          },
        ),
        const SizedBox(height: 24),
        const Text(
          'About',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSettingsTile(
          Icons.system_update,
          'Firmware Update',
          'Version 2.4.1 - Up to date',
          () {
            _showDialog(context, 'Firmware Update', 'Bot firmware is up to date');
          },
        ),
        _buildSettingsTile(
          Icons.info,
          'App Version',
          '1.0.0',
          () {
            _showDialog(context, 'App Version', 'Smart Cleaning Bot v1.0.0');
          },
        ),
        _buildSettingsTile(
          Icons.help,
          'Help & Support',
          'Get help and contact support',
          () {
            _showDialog(context, 'Help & Support', 'Support options would be shown here');
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Factory Reset'),
                content: const Text(
                  'Are you sure you want to reset the bot to factory settings? This cannot be undone.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Reset initiated')),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Reset'),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[50],
            foregroundColor: Colors.red,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Factory Reset'),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SwitchListTile(
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}