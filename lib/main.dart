import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';

void main() async {
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(320, 683),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MyApp();
          }),
    ),
  );
}
