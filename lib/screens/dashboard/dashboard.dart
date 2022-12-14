import 'package:flutter/material.dart';
import 'package:food_delivery/screens/neworder/neworder_screen.dart';
import 'package:food_delivery/theme.dart';
import 'package:food_delivery/custom_drawer/drawer_user_controller.dart';
import 'package:food_delivery/custom_drawer/home_drawer.dart';
import 'package:food_delivery/screens/dashboard/app_home_screen.dart';
import 'package:food_delivery/screens/navigation/feedback_screen.dart';
import 'package:food_delivery/screens/navigation/help_screen.dart';
import 'package:food_delivery/screens/navigation/invite_friend_screen.dart';
import 'package:provider/provider.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  NavigationHomeScreenState createState() => NavigationHomeScreenState();
}

class NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  int pageIndex = 0;

  String text = 'stop';
  void denyHandler() {
    setState(() {
      pageIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final streamProvider = Provider.of<Map<String, dynamic>?>(context);

    List pages = [
      const DashboardScreen(),
      NewOrderScreen(),
    ];
    if (streamProvider!['message'] == 'order') {
      setState(() {
        pageIndex = 1;
      });
    } else if (streamProvider['message'] == 'cancel') {
      setState(() {
        pageIndex = 0;
      });
    }
    return Scaffold(body: pages[pageIndex]);
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
