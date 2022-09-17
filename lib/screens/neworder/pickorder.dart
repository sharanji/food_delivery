import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/navigatetodeliver/reachdrop.dart';
import 'package:food_delivery/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class PickupOrderScreen extends StatefulWidget {
  const PickupOrderScreen({Key? key}) : super(key: key);

  @override
  State<PickupOrderScreen> createState() => _PickupOrderScreenState();
}

class _PickupOrderScreenState extends State<PickupOrderScreen> {
  bool isFinished = false;
  bool showOdrDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pickup Order',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.nearlyBlue.withOpacity(0.1),
              // border: Border.all(
              //     color: Colors.grey,
              //     ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.timer,
                  color: AppTheme.nearlyBlue,
                  // size: 33,
                ),
                Text(
                  'Pickup Order in 2 Mintues',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.nearlyBlue,
                    // fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(3),
            width: double.infinity,
            // height: ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: AppTheme.nearlyBlue.withOpacity(0.1),
              // border: Border.all(
              //   color: Colors.grey,
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'ORDER ID',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  'Al-3656399',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    // color: AppTheme.nearlyBlue,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black12,
                        ),
                        child: const Icon(Icons.restaurant),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Details',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'The Vasanta Bhavan',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showOdrDetails = !showOdrDetails;
                          });
                        },
                        child: Icon(
                          showOdrDetails
                              ? FeatherIcons.chevronUp
                              : FeatherIcons.chevronDown,
                        ),
                      )
                    ],
                  ),
                ),
                if (showOdrDetails)
                  const SizedBox(
                    height: 5,
                  ),
                if (showOdrDetails)
                  const Divider(
                    color: Colors.grey,
                  ),
                if (showOdrDetails)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2 x',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Masala Dosa',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '2 x',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Masala Dosa',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
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
                          color: Theme.of(context).textTheme.titleMedium!.color,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'AL-786569',
                          style: Theme.of(context).textTheme.titleMedium,
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
                          color: Theme.of(context).textTheme.titleMedium!.color,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'SHARANJI P',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SwipeableButtonView(
              buttonText: 'PICKED ORDER',
              buttontextstyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                    child: const ReachDropScreen(),
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
    );
  }
}
