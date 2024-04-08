import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class TvChannels extends StatefulWidget {
  const TvChannels({super.key});

  @override
  State<TvChannels> createState() => _TvChannelsState();
}

class _TvChannelsState extends State<TvChannels> {
  List items = [
    {"title": "Gotv", "img": "lib/Assets/img/TvChannels/gotv.jpg"},
    {"title": "Showmax", "img": "lib/Assets/img/TvChannels/showmax.webp"},
    {"title": "Dstv", "img": "lib/Assets/img/TvChannels/dstv.jpg"},
    {"title": "Startimes", "img": "lib/Assets/img/TvChannels/startimes.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars(title: "Select a TV Subscription"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                        Navigator.pushNamed(context, "cables",
                            // don't send arguemnts directly, send as a map
                            arguments: {"name": items[index]["title"]});
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              items[index]["img"],
                            )),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        title: Text(items[index]["title"],
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
    );
  }
}
