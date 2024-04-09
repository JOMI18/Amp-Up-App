import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
    title,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Consumer(builder: (context, ref, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    SlideAnimation(
                      page: Profile(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: const Color(0xFFE7E7E7),
                        radius: 22,
                        child: Icon(
                          Icons.account_circle,
                          size: 41,
                          color: const Color(0xFF252525).withOpacity(0.5),
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Hi, ${ref.watch(userProvider).firstName}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "support");
                    },
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: const Color(0xFF5C5C5C),
                      child: const Icon(
                        Icons.question_mark_outlined,
                        size: 18,
                        color: Color.fromARGB(245, 232, 232, 232),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "notify");
                    },
                    child: Icon(
                      Icons.notifications,
                      size: 28,
                      color: Color.fromARGB(221, 232, 232, 232),
                    ),
                  )
                ],
              )
            ],
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              children: [
                Account(colorScheme: colorScheme),
                SizedBox(
                  height: 4.h,
                ),
                Upgrade(colorScheme: colorScheme),
                SizedBox(
                  height: 3.h,
                ),
                Access(colorScheme: colorScheme),
                SizedBox(
                  height: 5.h,
                ),
                TransactionsList(colorScheme: colorScheme),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
