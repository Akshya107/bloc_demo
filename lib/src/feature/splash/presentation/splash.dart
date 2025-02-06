import 'package:bloc_example/src/common/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(RouteName.planetScreen);
                  },
                  child: Text("Planet")),
              const SizedBox(
                width: 12,
              ),
              TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(RouteName.dogScreen);
                  },
                  child: Text("Dogs"))
            ],
          )
        ],
      ),
    );
  }
}
