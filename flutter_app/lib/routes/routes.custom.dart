import 'package:flutter/material.dart';
import 'package:flutter_app/page/clients.page.dart';
import 'package:flutter_app/page/home.page.dart';
import 'package:page_transition/page_transition.dart';

class RoutesCustom {
  static String initialRoute = '/';

  static routes(settings) {
    switch (settings.name) {
      case '/':
        return PageTransitionCustom.featureFade(const HomePage());
      case '/clients':
        return PageTransitionCustom.featureFade(const ClientsPage());
    }
  }
}

class PageTransitionCustom {
  static featureFade(Widget widget) {
    return PageTransition(
      child: widget,
      type: PageTransitionType.fade,
    );
  }

  static featureRightToLeft(Widget widget) {
    return PageTransition(
      child: widget,
      type: PageTransitionType.rightToLeft,
    );
  }
}
