import 'dart:convert';

import 'package:fleet_booking_system/constants/color_list.dart';
import 'package:fleet_booking_system/model/dummy_profile_model.dart';
import 'package:fleet_booking_system/screens/account/edit_profile.dart';
import 'package:fleet_booking_system/utils/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final dummyProfile = Profile(
    id: 1,
    email: 'johndoe@example.com',
    phone: '+62 812 3456 7890',
    name: 'John Doe',
    profilePic: 'https://i.pravatar.cc/150?img=3',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          gapHeight(24),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(dummyProfile.profilePic),
          ),
          gapHeight(16),
          Text(
            dummyProfile.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          gapHeight(4),
          Text(
            dummyProfile.email,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          gapHeight(4),
          Text(
            dummyProfile.phone,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
            child: Column(
              children: [
                settingsOption(
                  icon: 'profile-ic-settings',
                  title: 'Edit Profile',
                  colorBoxColor: ColorList.primary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => EditProfilePage(
                              name: dummyProfile.name,
                              email: dummyProfile.email,
                              phone: dummyProfile.phone,
                            ),
                      ),
                    );
                  },
                ),
                gapHeight(12),
                settingsOption(
                  icon: 'document-ic',
                  title: 'Term and Conditions',
                  colorBoxColor: ColorList.primary,
                ),
                gapHeight(12),
                settingsOption(
                  icon: 'help-center-ic',
                  title: 'Frequently Ask Question',
                  colorBoxColor: ColorList.primary,
                ),
                gapHeight(12),
                settingsOption(
                  icon: 'shield-ic',
                  title: 'Privacy Policy',
                  colorBoxColor: ColorList.primary,
                ),
                gapHeight(12),
                settingsOption(
                  icon: 'logout-ic',
                  title: 'Logout',
                  colorBoxColor: ColorList.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingsOption({
    required String icon,
    required String title,
    required Color colorBoxColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorBoxColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // kalau ada icon asset svg/png bisa taro di sini
            gapWidth(12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorList.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
