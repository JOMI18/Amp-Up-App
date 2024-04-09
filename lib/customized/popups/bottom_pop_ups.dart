import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amp_up/imports.dart';

void showHelpPopup(BuildContext context) {
  showModalBottomSheet(
    elevation: 4,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: HelpPopup(),
      );
    },
  );
}

void showCalendarPicker(BuildContext context) {
  showModalBottomSheet(
    elevation: 4,
    context: context,
    builder: (BuildContext context) {
      return const SizedBox(
        height: 250,
        child: const CalendarPicker(),
      );
    },
  );
}

void showDropdownMenu(BuildContext context, Widget content, double height) {
  showModalBottomSheet(
    elevation: 4,
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: height,
        child: DropdownMenu(content: content, height: height),
      );
    },
  );
}

class HelpPopup extends StatelessWidget {
  HelpPopup({
    super.key,
  });
  final List item = [
    {"text": "I forgot my PIN", "icon": Icons.lock, "route": "forgotPin"},
    {"text": "Get in touch with us", "icon": Icons.email, "route": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 21, vertical: 12),
          child: Text(
            "Having issues logging in?",
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        const Divider(
          height: 10,
          color: Color(0x77000000),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        item[index]["icon"],
                        size: 18,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                      color: Colors.black,
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, item[index]["route"]);
                      },
                      child: Text(
                        item[index]["text"],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  if (index != item.length - 1)
                    const Divider(
                      height: 14,
                      color: Color(0x77000000),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class CalendarPicker extends ConsumerStatefulWidget {
  const CalendarPicker({
    super.key,
  });

  @override
  _CalendarPickerState createState() => _CalendarPickerState();
}

class _CalendarPickerState extends ConsumerState<CalendarPicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    //  selectedDateController =
    selectedDate = DateTime.now();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(
      builder: (context, watch, _) {
        // Read the value from the provider
        return CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectedDate,
          onDateTimeChanged: (DateTime newDateTime) {
            selectedDate = newDateTime;
            ref.read(dobProvider.notifier).state =
                DateFormat('MM/dd/yyyy').format(selectedDate);
          },
        );
      },
    );
  }
}

// class CalendarPicker2 extends StatefulWidget {
//   final Function(DateTime) onSelectDate;
//   const CalendarPicker2({
//     super.key,
//     required this.onSelectDate,
//   });
//   @override
//   State<CalendarPicker2> createState() => _CalendarPicker2State();
// }
// class _CalendarPicker2State extends State<CalendarPicker2> {
//   late DateTime selectedDate;
//   @override
//   void initState() {
//     super.initState();
//     selectedDate = DateTime.now()
//         .subtract(Duration(days: 365 * 25)); // Set default DOB to 25 years ago
//   }
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoDatePicker(
//       mode: CupertinoDatePickerMode.date,
//       initialDateTime: selectedDate,
//       onDateTimeChanged: (DateTime newDateTime) {
//         setState(() {
//           selectedDate = newDateTime;
//         });
//         widget.onSelectDate(
//             newDateTime); // Pass selected date to callback function
//       },
//     );
//   }
// }

class DropdownMenu extends StatelessWidget {
  final Widget content;
  final double height;
  const DropdownMenu({
    super.key,
    required this.content,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Set the height of the dropdown menu
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Your DropdownMenu widget content
          content,
        ],
      ),
    );
  }
}
