import 'package:flutter/material.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';
import 'package:h2know_flutter/widgets/rounded_button.dart';
import 'package:h2know_flutter/widgets/text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const id = 'edit_profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Hero(
                    tag: 'profile_img',
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                      radius: 70,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    text: loggedInUserName,
                    label: 'Full Name',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    text: loggedInUserFloor,
                    label: 'Floor Number',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 50),
                  RoundedButton(
                    text: 'Update Profile',
                    onPressed: () {},
                    colour: const Color(0xFF50C2C9),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
