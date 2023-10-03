import 'package:flutter/material.dart';

class RouteAwareService {
  final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

  RouteObserver<ModalRoute> getRouteObserver() => routeObserver;
}
