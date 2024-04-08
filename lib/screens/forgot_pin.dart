// import 'package:amp_up/imports.dart';

// import 'package:flutter/material.dart';

// class BForgotPin extends StatefulWidget {
//   const BForgotPin({super.key});

//   @override
//   State<BForgotPin> createState() => _BForgotPinState();
// }

// class _BForgotPinState extends State<BForgotPin> {
//   int currentStep = 0;

//   final List<Map<String, dynamic>> steps = [
//     {'widget': const ResetPIN(), 'title': 'Reset PIN'},
//     {'widget': const Verification(), 'title': 'Code Verification'},
//     {'widget': const CreatePassword(), 'title': 'Create Password'},
//     {'widget': const ConfirmPassword(), 'title': 'Confirm Password'},
//   ];

//   void nextStep() {
//     setState(() {
//       if (currentStep < steps.length - 1) {
//         currentStep++;
//       } else {
//         // Navigate to a new component that is not a step
//         Navigator.pushNamed(context, "logIn");
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     ColorScheme colorScheme = Theme.of(context).colorScheme;
//     String appBarTitle = steps[currentStep]['title'] as String;
//     return Scaffold(
//       bottomNavigationBar: ComponentSlideIns(
//         beginOffset: Offset(0, 4),
//         duration: Duration(milliseconds: 600),
//         child: BottomAppBar(
//             surfaceTintColor: Colors.white,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   elevation: 5,
//                   backgroundColor: colorScheme.primary,
//                   shape: const RoundedRectangleBorder()),
//               onPressed: nextStep,
//               child: Text(
//                 currentStep == steps.length - 1 ? 'Finish' : 'Continue',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 ),
//               ),
//             )),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         actions: [
//           GestureDetector(
//             onTap: () {
//               showHelpPopup(context);
//             },
//             child: const CircleAvatar(
//               radius: 13,
//               backgroundColor: Color.fromARGB(203, 31, 31, 31),
//               child: Icon(
//                 Icons.question_mark_outlined,
//                 size: 16,
//                 color: Color.fromARGB(245, 255, 255, 255),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           )
//         ],
//         leading: TextButton(
//           style: ButtonStyle(
//               overlayColor: MaterialStateProperty.all(Colors.transparent)),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             size: 25,
//           ),
//         ),
//         title: Text(appBarTitle,
//             style: const TextStyle(fontWeight: FontWeight.bold)),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(4.0),
//           child: LinearProgressIndicator(
//             value: (currentStep + 1) / steps.length,
//             backgroundColor: Colors.grey[300],
//             // valueColor:
//             //     AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 3, 85, 152)),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: steps[currentStep]['widget'] as Widget,
//           ),
//           // SizedBox(height: 20.0),
//           //
//         ],
//       ),
//     );
//   }
// }
