import 'package:flutter/material.dart';

class OptionsCard extends StatelessWidget {
  OptionsCard(
      {super.key,
      required this.title,
      required this.subText,
      required this.icon});
  final String title;
  final String subText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              CircleAvatar(
                radius: 19,
                child: Icon(
                  icon,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                subText,
                style: const TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    overlayColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                    surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: Colors.black,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
