import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/neworder/reachpickup.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    final streamProvider =
        Provider.of<Map<String, dynamic>?>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Fresh Order',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 30,
                        // fontStyle: FontStyle.italic,
                      ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    print(" '''''''' deny '''''''''");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        Text('  Deny  '),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/gmap.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Total Distance : 4.65 km",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "PickUp : 4.65 km",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  // fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: 1,
                          height: 50,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Drop : 4.65 km",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  // fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
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
                Text(
                  'PICKUP FROM',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Theme.of(context).textTheme.labelMedium!.color,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '8 Mins Away',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
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
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PICKUP FROM',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Theme.of(context).textTheme.labelMedium!.color,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '8 Mins Away',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SwipeableButtonView(
              buttonText: 'ACCEPT ORDER',
              buttonWidget: const Icon(
                FeatherIcons.chevronsRight,
                color: Colors.grey,
              ),
              buttontextstyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
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
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReachPickupScreen(),
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
