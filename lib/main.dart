import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive/hive.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:savoirguineeweb/navbar.dart';
import 'package:savoirguineeweb/providers/provider_config.dart';
import 'package:savoirguineeweb/routes.dart';

//  locator<NavigationService>().navigateTo('login');
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var dir = await getApplicationDocumentsDirectory();
  //Hive.init(dir.path);
  //await Hive.openBox('pobaarBox');
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ConfigService()),
      // ChangeNotifierProvider(create: (_) => AuthService()),
      // ChangeNotifierProvider(create: (_) => PostService()),
    ],
    child: SGuinee(),
  ));
}

class SGuinee extends StatefulWidget {
  SGuinee({Key key}) : super(key: key);

  @override
  _SGuineeState createState() => _SGuineeState();
}

class _SGuineeState extends State<SGuinee> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.requestFocus(new FocusNode());
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) =>
            HomePage(child: child ?? Container(), key: UniqueKey()),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RoutesName.FIRST_PAGE,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.routing.current);
    return Scaffold(
      // appBar: Get.routing.current == "/splash"
      //     ? null
      //     : AppBar(
      //         title: Text(Get.currentRoute),
      //       ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarMenu(
            context: context,
            key: UniqueKey(),
          ),
          Expanded(child: child)
        ],
      ),
      //child,
      /*
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Expanded(child: child!)],
      ),
      */
    );
  }
}
