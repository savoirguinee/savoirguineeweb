import 'package:flutter/material.dart';
import 'package:savoirguineeweb/routes.dart';

class NavBarMenu extends StatefulWidget {
  final BuildContext context;
  NavBarMenu({Key key, this.context}) : super(key: key);

  @override
  _NavBarMenuState createState() => _NavBarMenuState();
}

class _NavBarMenuState extends State<NavBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      margin: EdgeInsets.only(top: 20, bottom: 20),

      child: Wrap(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavigationItem(
            title: 'Home',
            route_name: RoutesName.FIRST_PAGE,
          ),
          NavigationItem(
            title: 'About',
            route_name: RoutesName.SECOND_PAGE,
          ),
          NavigationItem(
            title: 'Contact',
            route_name: RoutesName.FIRST_PAGE,
          ),
          NavigationItem(
            title: 'Contact',
            route_name: RoutesName.LOGIN,
          ),
        ],
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String title;
  final String route_name;

  const NavigationItem({this.title, this.route_name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => locator<NavigationService>().navigateTo(route_name),
      focusColor: Colors.red,
      hoverColor: Colors.green,
      focusNode: FocusNode(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
