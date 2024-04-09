import 'package:flutter/material.dart';
import 'package:amp_up/imports.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController controller = TextEditingController();

  AlertInfo info = AlertInfo();

  AlertLoading loading = AlertLoading();

  void proceed() async {
    if (controller.text == "") {
      info.message = "Field can't be empty";
      info.showAlertDialog(context);
      return;
    }

    loading.showAlertDialog(context);
    final response = await AirtimeDataController()
        .detectNetwork({"number": controller.text});

    loading.closeDialog(context);

    if (response['status'] == "error") {
      info.message = response['message'];
      info.showAlertDialog(context);
      return;
    }
    print(response);

    Navigator.pushNamed(context, "buyAirtime");
  }

  @override
  Widget build(BuildContext context) {
    // ColorScheme Colorscheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
                hintText: "Beneficiary phone number",
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: Colors.white,
                  size: 28,
                ),
                controller: controller,
                inputTitle: "Enter phone number"),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              width: 400,
              child: ComponentSlideIns(
                beginOffset: const Offset(4.0, 0),
                duration: const Duration(milliseconds: 1200),
                child: Card(
                  elevation: 4,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                          radius: 50,
                          child: Icon(
                            Icons.credit_card,
                            color: Theme.of(context).iconTheme.color,
                            size: 70,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("No recent payment",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Text("You have not made any payment recently ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade800)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 240,
              width: 400,
              child: ComponentSlideIns(
                beginOffset: const Offset(0.0, 4.0),
                duration: const Duration(milliseconds: 1100),
                child: Card(
                  elevation: 8,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          // backgroundColor: Color.fromARGB(228, 211, 231, 255),
                          radius: 50,
                          child: Icon(
                            Icons.people_alt_sharp,
                            color: Theme.of(context).iconTheme.color,
                            size: 60,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("No saved contact",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 10),
                        Text(
                            "You currently have no saved contacts on your account.When you do, they will show up here. ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade800)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Btns().btn(context, "Proceed", () {
              proceed();
            }),
          ],
        ),
      ),
    );
  }
}
