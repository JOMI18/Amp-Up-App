import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:amp_up/imports.dart';

class ElectricList extends StatefulWidget {
  const ElectricList({super.key});

  @override
  State<ElectricList> createState() => _ElectricListState();
}

class _ElectricListState extends State<ElectricList> {
  final List items = [
    {
      "title": "aba",
      "img": "lib/Assets/img/TvChannels/dstv.jpg",
      "type": "electric"
    },
    {
      "title": "kano",
      "img": "lib/Assets/img/TvChannels/showmax.webp",
      "type": "electric"
    },
    {
      "title": "enugu",
      "img": "lib/Assets/img/TvChannels/dstv.jpg",
      "type": "electric"
    },
    {
      "title": "ibadan",
      "img": "lib/Assets/img/TvChannels/showmax.webp",
      "type": "electric"
    },
    {
      "title": "eko",
      "img": "lib/Assets/img/TvChannels/dstv.jpg",
      "type": "electric"
    },
    {
      "title": "ikeja",
      "img": "lib/Assets/img/TvChannels/showmax.webp",
      "type": "electric"
    },
    {
      "title": "joss",
      "img": "lib/Assets/img/TvChannels/dstv.jpg",
      "type": "electric"
    },
    {
      "title": "kaduna",
      "img": "lib/Assets/img/TvChannels/showmax.webp",
      "type": "electric"
    },
    {
      "title": "abuja",
      "img": "lib/Assets/img/TvChannels/dstv.jpg",
      "type": "electric"
    },
    {
      "title": "portharcourt",
      "img": "lib/Assets/img/TvChannels/showmax.webp",
      "type": "electric"
    },
    {
      "title": "benin",
      "img": "lib/Assets/img/TvChannels/dstv.jpg",
      "type": "electric"
    },
    {
      "title": "yola",
      "img": "lib/Assets/img/TvChannels/showmax.webp",
      "type": "electric"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBars(title: "Select an Electricity Disco"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ComponentSlideIns(
              beginOffset: const Offset(-3.0, 0.0),
              duration: const Duration(milliseconds: 1200),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "electricity",
                          arguments: {'name': items[index]["title"]});
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            items[index]['img'],
                          )),
                      title: Text(
                          "${items[index]["title"].toString().toUpperCase()} Electricity"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
// ₦