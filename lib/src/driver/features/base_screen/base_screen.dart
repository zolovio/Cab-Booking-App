import 'package:cab_booking/src/core/ui/theme.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  const BaseScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
              radius: 3.0,
              center: Alignment.centerLeft,
              colors: [
                AppColors.deepBlue2.withOpacity(0.3),
                AppColors.deepOrange.withOpacity(0.7),
              ],
            )),
            child: widget.child),
      ),
    );
  }
}
