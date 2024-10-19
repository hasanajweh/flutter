import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(), 
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center'),
      ),
      body: Column(
        children: [
        
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://i.ibb.co/xzSgtbk/me.jpg', 
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasan Ajweh',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Backend Developer',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildStats('1700', 'Collect'),
                    buildStats('100', 'Attention'),
                    buildStats('2100', 'Track'),
                    buildStats('139', 'Coupons'),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButtonWithLabel(icon: Icons.wallet, label: 'Wallet'),
                IconButtonWithLabel(icon: Icons.local_shipping, label: 'Delivery'),
                IconButtonWithLabel(icon: Icons.message, label: 'Message', badge: 2),
                IconButtonWithLabel(icon: Icons.monetization_on, label: 'Service'),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                buildOptionItem(Icons.location_on, 'Address', 'ensure your ...'),
                buildOptionItem(Icons.lock, 'Privacy', 'system permission '),
                buildOptionItem(Icons.settings, 'General', 'basic settings'),
                buildOptionItem(Icons.notifications, 'Notification', 'take over ...'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStats(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget buildOptionItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final int badge;

  const IconButtonWithLabel({
    Key? key,
    required this.icon,
    required this.label,
    this.badge = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Icon(icon, size: 30, color: Colors.black87),
            Text(label),
          ],
        ),
        
      ],
    );
  }
}
