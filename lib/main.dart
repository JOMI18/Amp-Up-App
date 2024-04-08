import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            title: 'Amp Up',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                background: const Color.fromARGB(255, 30, 31, 34),
                seedColor: const Color.fromARGB(255, 245, 81, 57),
                surfaceVariant: const Color.fromARGB(255, 187, 221, 250),
                secondary: const Color.fromARGB(228, 211, 231, 255),
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                bodyLarge: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 30, 31, 34),
              ),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 30, 31, 34),
                  foregroundColor: Colors.white),
              useMaterial3: true,
            ),
            initialRoute: "alreadySignedIn",
            routes: {
              'starter': (context) => const IndexPage(),
              "newUser": (context) => const NewUser(),
              'signUp': (context) => ActiveSignUp(),
              "continueSignUp": (context) => SignUpPasswordScreen(),
              "logIn": (context) => SignIn(),
              "verifyNumber": (context) => const VerifyNumber(),
              "createPin": (context) => const CreatePassword(),
              "confirmPin": (context) => const ConfirmPassword(),
              "dashboard": (context) => const Dashboard(),
              "home": (context) => Home(),

              "alreadySignedIn": (context) => const AlreadySignedIn(),

              // "bvn": (context) => const BvnVerification(),

              "profile": (context) => Profile(),
              "profileInfo": (context) => ProfileInfo(),
              // "security": (context) => const Security(),
              "signOut": (context) => const SignOutAlert(),

              // "support": (context) => Support(),
              // 'gettingLoan': (context) => const LoanPageView(),
              // 'challenge': (context) => const ChallengePage(),

              // "notify": (context) => const BNotification(),

              //////// MONEY TAB
              'addMoney': (context) => AddMoney(),
              'sendMoney': (context) => const SendMoney(),

              //////// QUICK ACCESS
              'dataAirtime': (context) => AirtimeDataCombo(
                    param: 1,
                  ),
              'buyAirtimePG': (context) => AirtimeDataCombo(
                    param: 0,
                  ),
              'buyDataPG': (context) => AirtimeDataCombo(
                    param: 1,
                  ),
              // 'buyAirtime': (context) => BuyAirtime(),
              // 'buyData': (context) => BuyData(),
              'payBills': (context) => BillTabs(),
              'tvChannels': (context) => TvChannels(),
              // 'cables': (context) => CablesTv(),
              // 'tvPurchase': (context) => TVPurchase(),
              // 'txSuccess': (context) => TXSuccess(),
              // 'electricity': (context) => Electricity(),
              'electricList': (context) => ElectricList(),
            });
      },
      maxTabletWidth: 900,
    );
  }
}


// clear input on delete
// setting page pref