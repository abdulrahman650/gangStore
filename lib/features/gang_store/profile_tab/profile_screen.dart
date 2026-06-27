
import 'package:flutter/material.dart';

import '../layout/layout.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,
            size: 30,
          ),
          onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Layout()));

          },
        ),
        title: Center(child: Text('My Profile',
        style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.settings_outlined, color: Colors.black,
              size: 30,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfileScreen()));
            },
          ),

        ],
      ),
      body:
      SingleChildScrollView(
        child: Column(
        children: [
          const SizedBox(height: 10),
        // Profile Header
        Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: const AssetImage('assets/images/img.png',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'abdulrahman',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'abdulrahman@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
        
              ],
            ),
        ),
            // Box 1
          buildBox([
            {'icon': Icons.favorite_border, 'title': 'Favourites'},
            {'icon': Icons.download_outlined, 'title': 'Downloads'},
          ]),
            const Divider(height: 2, indent:35, endIndent: 35, color: Colors.black),
            // Box 2
          buildBox([
            {'icon': Icons.language_outlined, 'title': 'Languages'},
            {'icon': Icons.location_on_outlined, 'title': 'Location'},
            {'icon': Icons.play_circle_outline, 'title': 'Subscription'},
            {'icon': Icons.desktop_windows_outlined, 'title': 'Display'},
          ]),
        
          const Divider(height: 2, indent:35, endIndent: 35, color: Colors.black),
          // Box 3
          buildBox([
            {'icon': Icons.delete_outline, 'title': 'Clear Cache'},
            {'icon': Icons.access_time, 'title': 'Clear History'},
            {'icon': Icons.logout, 'title': 'Log Out'},
          ]),
          SizedBox(height: 50,),
          ],
        ),
      )
    );

  }
  Widget buildBox(List<Map<String, dynamic>> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(),
        itemBuilder: (context, index) {
          return customListRow(
            items[index]['icon'],
            items[index]['title'],
          );
        },
      ),
    );
  }

  Widget customListRow(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon,  size: 24),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color:  Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black, size: 20),
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      minLeadingWidth: 24,
    );
  }
}
