import 'package:amp_up/imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Referrals extends StatefulWidget {
  const Referrals({super.key});

  @override
  State<Referrals> createState() => _ReferralsState();
}

class _ReferralsState extends State<Referrals> {
  TextEditingController codeCt = TextEditingController();
  List items = [
    {
      "key": "Total Rewards",
      "value": "N0.0",
      "icon": Icons.monetization_on,
      "bg": Colors.green,
      "route": ""
    },
    {
      "key": "Total Referrals",
      "value": "0",
      "icon": Icons.people_alt_sharp,
      "bg": Colors.teal,
      "route": ""
    }
  ];
  List steps = [
    {
      "key": "Invite your friend to install the app with your code",
      "icon": Icons.link,
      "value": "1"
    },
    {
      "key": "Get your friend to fund his account with a minimum of N1000.00",
      "icon": Icons.card_giftcard,
      "value": "2"
    },
    {
      "key":
          "Once thats complete and they successfully fund their account, you receive N50.00",
      "icon": Icons.grade_rounded,
      "value": "3"
    },
  ];
  String code = "https://heres/your/referalcode2240?";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBars(title: "Referrals"),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Earn N50.00 each time you refer your friends",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
                Divider(
                  thickness: 5,
                  color: Utilities().appColors(context).primary,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stats:".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Utilities().appColors(context).primary,
                  ),
                ),
                SizedBox(height: 1.h),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final key = items[index]["key"];
                    final bg = items[index]["bg"];
                    final value = items[index]["value"];
                    final icon = items[index]["icon"];
                    final route = items[index]["route"];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          if (route == "") {
                            return;
                          } else {
                            Navigator.pushNamed(context, route);
                          }
                        },
                        title: Text(key),
                        subtitle: Text(value),
                        leading: Icon(
                          icon,
                          color: bg,
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                      ),
                    );
                  },
                ),
              ],
            ),
            CustomTextField(
              inputTitle: "Your Referral Code",
              hintText: code,
              readOnly: true,
              controller: codeCt,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      codeCt.text = code;
                      Utilities().copyToClipboard(context, codeCt.text);
                    });
                  },
                  child: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HOW THIS WORKS:".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: Utilities().appColors(context).primary,
                  ),
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      final key = steps[index]["key"];
                      final value = steps[index]["value"];
                      final icon = steps[index]["icon"];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 75.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 5,
                                  color:
                                      Utilities().appColors(context).primary),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: Icon(
                                  icon,
                                  size: 32,
                                  color: Utilities().appColors(context).primary,
                                ),
                              ),
                              Text(
                                key,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Step $value".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.green),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
