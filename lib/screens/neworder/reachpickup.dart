import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/map_route.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/screens/neworder/pickorder.dart';
import 'package:food_delivery/theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ReachPickupScreen extends StatefulWidget {
  const ReachPickupScreen({Key? key}) : super(key: key);

  @override
  State<ReachPickupScreen> createState() => _ReachPickupScreenState();
}

class _ReachPickupScreenState extends State<ReachPickupScreen> {
  bool isFinished = false;
  bool isExpanded = false;
  LatLng pickUpLatLong = const LatLng(12.731369497626739, 77.80610859284693);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: MapRoute(pickUpLatLong),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reach Pickup',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Theme.of(context).canvasColor,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'The Vasanta Bhavan - Al Barsha',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Shop No-3, Deyaar Building, Near ibis Hotel - Al Barsha - Dubai - United Arab Emirates',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.receipt_long,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'AL-786569',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 20,
                                // margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'SHARANJI P',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // border: Border.all(
                        //   color: Colors.grey,
                        // ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                const url = 'tel://+918610711834';
                                try {
                                  launchUrl(Uri.parse(url));
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  // color: AppTheme.nearlyDarkBlue,
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      kPrimaryColor,
                                      HexColor("#6F56E8")
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Call',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final url =
                                    'https://www.google.com/maps/search/?api=1&query=${pickUpLatLong.latitude},${pickUpLatLong.longitude}';
                                try {
                                  launchUrl(Uri.parse(url));
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      kPrimaryColor,
                                      HexColor("#6F56E8")
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.directions,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Go to Map',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SwipeableButtonView(
                        buttonText: 'REACHED LOCATION',
                        buttontextstyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Colors.white,
                                ),
                        buttonWidget: const Icon(
                          FeatherIcons.chevronsRight,
                          color: Colors.grey,
                        ),
                        activeColor: Colors.green,
                        isFinished: isFinished,
                        onWaitingProcess: () {
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              isFinished = true;
                            });
                          });
                        },
                        onFinish: () async {
                          await Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: const PickupOrderScreen(),
                            ),
                          );

                          setState(() {
                            isFinished = false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
