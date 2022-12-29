import 'package:flutter/material.dart';
import 'package:jemputah_app_driver/constants/color.dart';
import 'package:jemputah_app_driver/constants/icons.dart';
import 'package:jemputah_app_driver/constants/images.dart';
import 'package:jemputah_app_driver/screens/change_password_screen.dart';
import 'package:jemputah_app_driver/screens/contact_us_screen.dart';
import 'package:jemputah_app_driver/screens/edit_profile_screen.dart';
import 'package:jemputah_app_driver/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jemputah_app_driver/API/FetchData.dart';
import 'package:jemputah_app_driver/constants/variable.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final Widget icon;
  final Widget ontap;
  final bool isLogOut;

  const _ProfileCard(this.name, this.icon, this.ontap, this.isLogOut);

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
        onTap: isLogOut
            ? () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                });
              }
            : () => Navigator.push(
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
  var username = "Loading..";
  var phoneNum = "Loading..";
  var email = "Loading..";

  void set() {
    var user = FetchData().fetchMapData("driver", uid);
    user.then((value) {
      setState(() {
        username = value["name_driver"];
        phoneNum = value["phone_num_driver"];
        email = value["email_driver"];
      });
    });
  }

  onGoBack(dynamic value) {
    setState(() {
      set();
    });
  }

  @override
  void initState() {
    super.initState();
    set();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    Route route = MaterialPageRoute(
                        builder: (context) => const EditProfilePage());
                    Navigator.push(context, route).then(onGoBack);
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
              false),
          _ProfileCard(
              "Ubah Password",
              Icon(
                Icons.lock,
                size: 30,
                color: AppColors.black,
              ),
              const ChangePasswordPage(),
              false),
          _ProfileCard(
            "Keluar",
            Icon(
              Icons.exit_to_app,
              size: 30,
              color: AppColors.black,
            ),
            const LoginScreen(),
            true,
          ),
        ],
      ),
    );
  }
}
