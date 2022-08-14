import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';
import 'package:h2know_flutter/widgets/rounded_button.dart';
import 'package:h2know_flutter/data/leaderboard_info.dart';

class FoodCoupon extends StatefulWidget {
  const FoodCoupon({super.key});
  static const id = 'food_coupon';

  @override
  State<FoodCoupon> createState() => _FoodCouponState();
}

class _FoodCouponState extends State<FoodCoupon> {
  int noCoupons = 3;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        if (leaderboardList.isEmpty) getLeaderboard();
        for (var i in leaderboardList) {
          if (i.highlighted && !i.topper) {
            showModalBottomSheet(
              context: context,
              isDismissible: false,
              enableDrag: false,
              builder: (BuildContext context) {
                return WillPopScope(
                  onWillPop: () async {
                    Navigator.pushNamed(context, Dashboard.id);
                    return false;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: 250,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Uh Oh! This is awkward.',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "In order to avail the free food coupons, you must be in the top 3 of the leaderboard.\nDont't be disheartened, try again next month :)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/food_coupon.png',
                width: 150,
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/food_coupon_text.png',
                width: 230,
              ),
              const SizedBox(height: 50),
              const Text(
                "Congratulations! You're at the top of the leaderboard, and we would like to show our appreciation by providing you 3 free coupons.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "You can use each coupon to get yourself that one extra ice cream, or that one extra samosa, or that one extra anything from the Plaksha dining hall. Enjoy!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 50),
              RoundedButton(
                text: '$noCoupons Coupons Remaining',
                onPressed: () {
                  setState(() {
                    if (noCoupons > 1) {
                      noCoupons--;
                    } else if (noCoupons == 1) {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        enableDrag: false,
                        builder: (BuildContext context) {
                          return WillPopScope(
                            onWillPop: () async {
                              Navigator.pushNamed(context, Dashboard.id);
                              return false;
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              height: 250,
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Uh Oh! You are out of coupons.',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Come back again next month as a leaderboard topper to avail more coupons.\nHope you enjoyed your free food!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  });
                },
                colour: const Color(0xFF4AB8DF),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
