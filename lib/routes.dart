import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:savoirguineeweb/first-page.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  goBack() {
    return navigatorKey.currentState.pop();
  }
}

class RoutesName {
  static const String FIRST_PAGE = '/first_page';
  static const String SECOND_PAGE = '/second_page';
  static const String LOGIN = '/login';
  static const String FirstPage = '/FirstPage';
  static const String HOME = '/home';

  final navKey = new GlobalKey<NavigatorState>();
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.FIRST_PAGE:
        return ScaleRoute(
            page: FirstPage(
          key: UniqueKey(),
        ));
      case RoutesName.HOME:
        return ScaleRoute(
            page: FirstPage(
          key: UniqueKey(),
        ));

      case RoutesName.SECOND_PAGE:
        return _getPageRoute(FirstPage(
          key: UniqueKey(),
        ));

      case RoutesName.LOGIN:
        return _getPageRoute(FirstPage(
          key: UniqueKey(),
        ));
      case RoutesName.FirstPage:
        return _getPageRoute(FirstPage(
          key: UniqueKey(),
        ));
      case RoutesName.FirstPage:
        return _getPageRoute(FirstPage(
          key: UniqueKey(),
        ));

      case RoutesName.FirstPage:
        return _getPageRoute(FirstPage(
          key: UniqueKey(),
        ));

      default:
        return _getPageRoute(FirstPage(
          key: UniqueKey(),
        ));
    }
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
//Navigator.push(context, SlideRightRoute(page: Screen2()))
