
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
        // elevation: 10,
        automaticallyImplyLeading: false, // remove when cleaning for mr T
        title: Consumer(builder: (context, ref, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, "profile");
                  // So, both methods have their own use cases:

                  // Navigator.pushNamed: Convenient for navigating to predefined named routes with default transitions. Useful when you have a simple navigation flow and want to keep the route configuration centralized.
                  // Navigator.push: Provides more flexibility for custom navigation scenarios, such as applying custom transitions, passing arguments, or navigating dynamically based on user interactions. Ideal for more complex navigation needs or when you need to navigate outside the predefined route configuration.
                  // In your case, since you want to apply a custom slide animation transition when navigating to the "profile" route, using Navigator.push with a custom route (SlideAnimationRoute) is appropriate. This allows you to achieve the desired animation effect while still leveraging named routes for other simpler navigations in your application.
                  Navigator.of(context).push(
                    SlideAnimation(
                      page: Profile(),
                      // duration: Duration(milliseconds: 500),
                      // curve: Curves.easeInOut,
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
                      width: 4,
                    ),
                    Text(
                      // "Hi, Jonathan Smith Reyes",
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
                      backgroundColor: const Color(0xFF5C5C5C).withOpacity(0.5),
                      child: const Icon(
                        Icons.question_mark_outlined,
                        size: 18,
                        color: Color.fromARGB(245, 73, 73, 73),
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
                      color: const Color(0xFF5C5C5C).withOpacity(0.9),
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
                const SizedBox(
                  height: 20,
                ),
                Upgrade(colorScheme: colorScheme),
                const SizedBox(
                  height: 15,
                ),
                Access(colorScheme: colorScheme),
                const SizedBox(
                  height: 50,
                ),
                TransactionsList(colorScheme: colorScheme)
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}

// Main theme Color:  Color.fromARGB(255, 3, 85, 152),
// Lightest shade : const Color.fromARGB(228, 211, 231, 255)
// Medium Light shade : const Color.fromARGB(241, 193, 221, 255),
// Main theme bg Color : Color.fromARGB(255, 25, 196, 30),
// Green bg:  const Color.fromARGB(255, 1, 157, 7),