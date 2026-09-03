import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/widgets/Main_loading_widget.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routs.dart';
import '../../core/utils/app_text_styels.dart';
import '../../core/utils/mob_size.dart';
import 'custom_elevated_button.dart';

class ProfileHeader extends StatelessWidget {
  final User currentUser;

   const ProfileHeader({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Container(
      color: AppColors.darkGrey,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        spacing: height * 0.015,
        children: [
          SizedBox(height: height * 0.06),
          _UserInfoRow(currentUser: currentUser),
          _ActionButtonsRow(),
        ],
      ),
    );
  }
}

class _UserInfoRow extends StatelessWidget {
  final User currentUser;

  const _UserInfoRow({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    var width = context.width;

    return Row(
      spacing: width * 0.03,
      children: [
        Expanded(
          child: _UserProfileAvatarAndName(currentUser: currentUser),
        ),
        Expanded(
          child: _FirestoreCountCounter(
            collectionName: 'wish_list',
            label: context.tr("wish_list"),
            userId: currentUser.uid,
          ),
        ),
        Expanded(
          child: _FirestoreCountCounter(
            collectionName: 'watched_movies',
            label: context.tr('history'),
            userId: currentUser.uid,
          ),
        ),
      ],
    );
  }
}

class _UserProfileAvatarAndName extends StatelessWidget {
  final User currentUser;

  const _UserProfileAvatarAndName({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    var height = context.height;

    return Column(
      spacing: height * 0.01,
      children: [

        FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return MainLoadingWidget();
            }

            if (snapshot.hasData && snapshot.data!.exists) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              final userName = userData['name'] ?? userData['username'] ?? currentUser.displayName ?? 'User';
              final userImage = userData['avatar'] ?? '';
              return Column(
                spacing: height * 0.01,
                children: [
                  Image.asset(userImage),
                  Text(userName, style: AppTextStyels.white20bold, overflow: TextOverflow.ellipsis),
                ],
              );
            }

            return Column(
              spacing: height * 0.01,
              children: [
                Image.asset(AppAssets.gamer1),
                Text(currentUser.displayName ?? 'User', style: AppTextStyels.white20bold, overflow: TextOverflow.ellipsis)              ],
            );
          },
        ),
      ],
    );
  }
}

class _FirestoreCountCounter extends StatelessWidget {
  final String collectionName;
  final String label;
  final String userId;

  const _FirestoreCountCounter({
    required this.collectionName,
    required this.label,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;

    return Column(
      spacing: height * 0.01,
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .collection(collectionName)
              .snapshots(),
          builder: (context, snapshot) {
            int count = snapshot.hasData ? snapshot.data!.docs.length : 0;
            return Text('$count', style: AppTextStyels.white36bold);
          },
        ),
        Text(label, style: AppTextStyels.white24bold),
      ],
    );
  }
}

class _ActionButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = context.width;

    return Row(
      spacing: width * 0.02,
      children: [
        Expanded(
          flex: 2,
          child: CustomElevatedButton(
            text: context.tr("edit_profile"),
            func: () => Navigator.pushNamed(context, AppRouts.updateProf),
            color: AppColors.primaryColor,
            textStyle: AppTextStyels.black20regular,
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomElevatedButton(
            text: context.tr("exit"),
            func: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouts.loginRouteName,
                      (route) => false,
                );
              }
            },
            color: AppColors.redColor,
            textStyle: AppTextStyels.White20regular,
          ),
        ),
      ],
    );
  }
}
