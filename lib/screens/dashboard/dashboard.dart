import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:food_delivery/theme.dart';
import 'package:food_delivery/custom_drawer/drawer_user_controller.dart';
import 'package:food_delivery/custom_drawer/home_drawer.dart';
import 'package:food_delivery/screens/dashboard/app_home_screen.dart';
import 'package:food_delivery/screens/navigation/feedback_screen.dart';
import 'package:food_delivery/screens/navigation/help_screen.dart';
import 'package:food_delivery/screens/navigation/invite_friend_screen.dart';
import 'package:food_delivery/screens/splash_shop/splash_screen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  NavigationHomeScreenState createState() => NavigationHomeScreenState();
}

class NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  int pageIndex = 1;
  String text = 'stop';

  @override
  Widget build(BuildContext context) {
    final streamProvider = Provider.of<Map<String, dynamic>?>(context);

    List pages = [const DashboardScreen(), const NewOrderScreen()];
    if (streamProvider!['message'] == 'order') {
      setState(() {
        pageIndex = 1;
      });
    }
    return Scaffold(body: pages[pageIndex]);
  }
}

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final streamProvider =
        Provider.of<Map<String, dynamic>?>(context, listen: false);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top + 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 28, 144, 222),
                ),
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/gmap.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 70,
              ),
              Text(
                'New Order !',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          LiteRollingSwitch(
            //initial value
            value: false,
            textOff: 'Accept',
            textOn: '',
            colorOn: Colors.green,
            colorOff: Colors.green,
            iconOn: Icons.done,
            iconOff: Icons.done,
            textSize: 16.0,
            onSwipe: () {},
            onChanged: (bool state) {
              //Use it to manage the different states
              print('Current State of SWITCH IS: $state');
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const HomeScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        default:
          break;
      }
    }
  }
}
