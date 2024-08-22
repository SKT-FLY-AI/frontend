import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              isScrollControlled: true,
              builder: (context) => NotificationBottomSheet(),
            );
          },
          child: Text('Show Notifications'),
        ),
      )
    );
  }
}

class NotificationBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Your notification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('New'),
              _buildNotificationTile(
                icon: Icons.wb_sunny,
                title:
                'A sunny day in your location, consider wearing your UV protection',
                time: '10 minutes ago',
                isNew: true,
              ),
              _buildSectionTitle('Earlier'),
              _buildNotificationTile(
                icon: Icons.cloud,
                title:
                'A cloudy day will occur all day long, don\'t worry about the heat of the sun',
                time: '1 day ago',
                isNew: false,
              ),
              _buildNotificationTile(
                icon: Icons.umbrella,
                title:
                'Potential for rain today is 84%, don\'t forget to bring your umbrella.',
                time: '2 days ago',
                isNew: false,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String time,
    required bool isNew,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: isNew ? Colors.blue[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        subtitle: Text(
          time,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
