import 'package:amp_up/imports.dart';
import 'package:flutter/material.dart';

final List items = [
  {
    "mainIcon": Icons.format_align_center,
    "mainTitle": "Personal Details",
    "route": ""
  },
  {"mainIcon": Icons.account_balance, "mainTitle": "Bank Details", "route": ""},
  {
    "mainIcon": Icons.home_filled,
    "mainTitle": "Residential Details",
    "route": ""
  },
  {"mainIcon": Icons.work, "mainTitle": "Employment Details", "route": ""},
  {"mainIcon": Icons.people, "mainTitle": "Next of Kin", "route": ""},
];

class ProfileDetailsBody extends StatelessWidget {
  const ProfileDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                    radius: 70, backgroundColor: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hi, Jonathan!",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Change profile picture",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.camera_enhance,
                        size: 23,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 440,
          child: ComponentSlideIns(
            beginOffset: const Offset(4.0, 0.0),
            duration: const Duration(milliseconds: 1300),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, items[index]["route"]);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Icon(
                              items[index]["mainIcon"],
                              size: 22,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          title: Text(items[index]["mainTitle"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                        ),
                      ),
                      const Divider(
                        height: 20,
                      )
                    ],
                  );
                })),
          ),
        ),
        Container(
          height: 80,
          width: 380,
          decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(8)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.admin_panel_settings_rounded,
                size: 34,
              ),
              SizedBox(
                width: 330,
                child: Text(
                  "We don't share your personal details with anyone. This information is required soley for verification.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 85, 152),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
