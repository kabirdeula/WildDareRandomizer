import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void updateIndex(int newIndex) => emit(newIndex);

  void openEndDrawer() => scaffoldKey.currentState?.openEndDrawer();
}
