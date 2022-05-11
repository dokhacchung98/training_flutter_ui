import 'package:flutter/material.dart';
import 'package:training_flutter_ui/style/style_gradient.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key, this.body, this.bottomNavigationBar})
      : super(key: key);

  final Widget? body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:
            const BoxDecoration(gradient: StyleGradient.gradientBackground),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
