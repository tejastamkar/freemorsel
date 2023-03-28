import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freemorsel/api/getuserdetails_api.dart';
import 'package:freemorsel/firebase_options.dart';
import 'package:freemorsel/provider/notifcationprovider.dart';
import 'package:freemorsel/screens/login.dart';
import 'package:freemorsel/screens/navbarscreens/bottomnavbar.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool waitNav = true;
  Future callApi() async {
    if (auth.currentUser != null) {
      await getUserDeatilsApi();
    }
  }

  @override
  void initState() {
    callApi().whenComplete(() => FlutterNativeSplash.remove());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ligthTheme,
        // darkTheme: darkTheme,
        // The Mandy red, dark theme.
        // darkTheme: ThemeData(
        //     // scaffoldBackground: Colors.black,
        //     // appBarBackground: Colors.black,
        //     // fontFamily: "Overpass",
        //     // appBarStyle: FlexAppBarStyle.background,
        //     // primary: primary3Color,
        //     // secondaryContainer: primary2Color,
        //     ),
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.system,
        builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            ),
        // theme: ThemeData(
        //     fontFamily: "Overpass",
        //     primaryColor: primary3Color,
        //     secondaryHeaderColor: primary2Color,
        //     colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        //         .copyWith(background: backgroundColors)),
        title: 'FreeMorsel',
        home: auth.currentUser == null ? const LoginScreen() : const Navbar());
    // return auth.currentUser == null ? const LoginScreen() : const Navbar();
  }
}
