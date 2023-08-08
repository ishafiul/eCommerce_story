import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_project/core/config/const.dart';
import 'package:sample_project/core/utils/extention.dart';
import 'package:sample_project/core/widgets/button.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: Space.md,
            ),
            Text("Page Not Found!", style: context.textTheme.displayLarge),
            const SizedBox(
              height: Space.xxl,
            ),
            Button(
              buttonSize: ButtonSize.md,
              buttonColor: ButtonColor.warning,
              onPressed: () {
                context.go('/welcome');
              },
              child: Text(
                'Go Back To Home',
                style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
