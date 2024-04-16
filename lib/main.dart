import 'package:amp_up/imports.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                surfaceVariant: Color.fromARGB(255, 181, 217, 249),
                secondary: const Color.fromARGB(255, 253, 176, 164),
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                bodyLarge: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 30, 31, 34),
              ),
              bottomAppBarTheme: const BottomAppBarTheme(
                color: Color.fromARGB(255, 30, 31, 34),
              ),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 30, 31, 34),
                  foregroundColor: Colors.white),
              useMaterial3: true,
            ),
            // initialRoute: "starter",
            initialRoute: "dashboard",
            routes: {
              'starter': (context) => const IndexPage(),
              "newUser": (context) => const NewUser(),
              'signUp': (context) => ActiveSignUp(),
              "continueSignUp": (context) => SignUpPasswordScreen(),
              "logIn": (context) => SignIn(),
              "verifyNumber": (context) => const VerifyNumber(),
              "createPin": (context) => const CreatePassword(),
              "confirmPin": (context) => const ConfirmPassword(),
              "alreadySignedIn": (context) => const AlreadySignedIn(),
              "dashboard": (context) => const Dashboard(),
              //
              "home": (context) => Home(),
              "forgotPin": (context) => const ForgotPin(),
              "bvn": (context) => const BvnVerification(),
              "security": (context) => const Security(),
              "profile": (context) => Profile(),
              "profileInfo": (context) => ProfileInfo(),
              "signOut": (context) => const SignOutAlert(),
              "support": (context) => Support(),
              'gettingLoan': (context) => const LoanPageView(),
              'challenge': (context) => const ChallengePage(),
              "notify": (context) => const NotificationTab(),
              'addMoney': (context) => AddMoney(),
              'sendMoney': (context) => const SendMoney(),
              'dataAirtime': (context) => AirtimeDataCombo(
                    param: 1,
                  ),
              'buyAirtimePG': (context) => AirtimeDataCombo(
                    param: 0,
                  ),
              'buyDataPG': (context) => AirtimeDataCombo(
                    param: 1,
                  ),
              'buyAirtime': (context) => BuyAirtime(),
              'buyData': (context) => BuyData(),
              'payBills': (context) => BillTabs(),
              'tvChannels': (context) => TvChannels(),
              'cables': (context) => CablesTv(),
              'electricity': (context) => Electricity(),
              'electricList': (context) => ElectricList(),
              'txSuccess': (context) => TXSuccess(),
              'reviewpurchase': (context) => ReviewPurchase(),
              'airtime_cash': (context) => AirtimeCash(),
            });
      },
      maxTabletWidth: 900,
    );
  }
}

// setting page pref
// check buy data pg ui
// add right imgs
// emm
// 174081
// 1518
