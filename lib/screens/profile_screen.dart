import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jemputah_app_driver/constants/color.dart';
import 'package:jemputah_app_driver/constants/icons.dart';
import 'package:jemputah_app_driver/constants/images.dart';
import 'package:jemputah_app_driver/screens/change_password_screen.dart';
import 'package:jemputah_app_driver/screens/contact_us_screen.dart';
import 'package:jemputah_app_driver/screens/edit_profile_screen.dart';
import 'package:jemputah_app_driver/screens/transaksi_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final Widget icon;
  final ontap;

  const _ProfileCard(this.name, this.icon, this.ontap);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(
        //top: 12,
        bottom: 12,
        left: 24,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.separatorLine,
            width: 2,
          ),
        ),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: icon,
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              fontSize: 12,
            ),
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Icon(
            Icons.navigate_next,
            size: 20,
            color: AppColors.black,
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext ctx) => ontap,
          ),
        ),
      ),
    );
  }
}

class GetScreen {
  final BuildContext ctx;

  GetScreen(this.ctx);
}

class _ProfilScreenState extends State<ProfilScreen> {
  var username = "Adit Dudung";
  var phoneNum = "+628123456789";
  var email = "aditdudung88@gmail.com";

  void getAddressList() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext ctx) => TransaksiScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        backgroundColor: AppColors.mainGreen,
        title: const Text('Profil Driver'),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            height: 90,
            padding: const EdgeInsets.symmetric(
              //vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.separatorLine,
                  width: 2,
                ),
              ),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                width: 53,
                height: 53,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      profilePicture,
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 5,
                ),
                child: Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneNum,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 24,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext ctx) {
                          return const EditProfilePage();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          _ProfileCard(
            "Kontak Kami",
            Image.asset(
              iconTelpon,
              width: 30,
              height: 30,
            ),
            const ContactUsPage(),
          ),
          _ProfileCard(
            "Ubah Password",
            Icon(
              Icons.lock,
              size: 30,
              color: AppColors.black,
            ),
            const ChangePasswordPage(),
          ),
          _ProfileCard(
            "Keluar",
            Icon(
              Icons.exit_to_app,
              size: 30,
              color: AppColors.black,
            ),
            null,
          ),
        ],
      ),
    );
  }
}
