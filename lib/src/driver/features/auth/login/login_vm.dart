import 'package:cab_booking/src/core/services/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider.autoDispose<LoginVm>((ref) {
  return LoginVm();
});

class LoginVm extends ChangeNotifier {
  bool _isSelected = true;
  bool get isSelected => _isSelected;
  void setIsSelected(val) {
    _isSelected = val;
    notifyListeners();
  }

  void forgetPasswordTap() {
    debugPrint('PasswordForgotton');
  }

  void signInTap() {
    debugPrint('Signed In');
  }

  void userSignUpTap(BuildContext context) {
    debugPrint('User Sign Up');
  }

  void driverSignUpTap(BuildContext context) {
    debugPrint('Driver Sign Up');
    // Navigator.of(context).pushNamed(AppRouter.signupScreen);
  }
}
