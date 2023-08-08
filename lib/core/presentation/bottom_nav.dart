import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit_flutter/core/config/custom_icons_icons.dart';

import '../config/colors.dart';

class BottomNav extends HookWidget {
  final Widget child;

  const BottomNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    TabController controller = useTabController(initialLength: 3);
    return Scaffold(
      bottomNavigationBar: TabBar(
        indicator: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3),
          border: Border(
            top: BorderSide(width: 3, color: ArtistaColor.primary),
            bottom: BorderSide(width: 0, color: ArtistaColor.primary),
            left: BorderSide(width: 0.000001, color: ArtistaColor.primary),
            right: BorderSide(width: 0.000001, color: ArtistaColor.primary),
          ),
        ),
        indicatorColor: ArtistaColor.primary,
        indicatorSize: TabBarIndicatorSize.label,
        controller: controller,
        unselectedLabelColor: Colors.grey,
        labelColor: ArtistaColor.primary,
        labelStyle: TextStyle(fontSize: 11.72),
        onTap: (index) {
          handelRoute(context: context, index: index);
        },
        tabs: const [
          Tab(
              icon: Icon(
                CustomIcons.home,
                size: 23,
              ),
              text: "Home"),
          Tab(
            icon: Icon(
              CustomIcons.categores,
              size: 23,
            ),
            text: "Categorys",
          ),
          Tab(
              icon: Icon(
                CustomIcons.person,
                size: 23,
              ),
              text: "Profile"),
        ],
      ),
      body: child,
    );
  }

  void handelRoute({required int index, required BuildContext context}) {
    /*switch (index) {
      case 0:
        {
          context.go("/home");
        }
      case 3:
        {
          context.go("/login");
        }
    }*/
  }
}
