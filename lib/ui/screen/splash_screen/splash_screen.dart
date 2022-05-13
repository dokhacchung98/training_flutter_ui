import 'package:flutter/material.dart';
import 'package:training_flutter_ui/ui/components/my_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      body: Text("Day la splash screen"),
    );
  }
}
