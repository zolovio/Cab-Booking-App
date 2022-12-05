import 'package:animate_do/animate_do.dart';
import 'package:cab_booking/src/core/ui/common_widget/custom_buttons.dart';
import 'package:cab_booking/src/core/ui/common_widget/custom_form_field.dart';
import 'package:cab_booking/src/core/ui/theme.dart';
import 'package:cab_booking/src/driver/features/auth/login/login_vm.dart';
import 'package:cab_booking/src/driver/features/base_screen/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BaseScreen(
        child: FadeInUp(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: size.height * 0.40,
                  width: size.width * 0.40,
                ),
              ],
            ),
          ),
          SliverAppBar(
            elevation: 2.0,
            forceElevated: true,
            pinned: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )),
            backgroundColor: AppColors.lightBackground,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CustomButton(
                    isSelected: true,
                    title: "Sign In",
                  ),
                  CustomButton(
                    isSelected: false,
                    title: "Sign Up",
                  )
                ]),
          ),
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, _) {
                final vm = ref.watch(loginProvider);
                return FormBuilder(
                  key: _formKey,
                  child: Container(
                    height: 400.h,
                    color: AppColors.lightBackground,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.sm),
                          child: IntlPhoneField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                labelText: 'Phone No.',
                                hintText: "Enter your phone number",
                                border: CustomFormField.inputBorder,
                                focusedBorder: CustomFormField.inputBorder,
                                enabledBorder: CustomFormField.inputBorder),
                            initialCountryCode: 'CA',
                            onChanged: (phone) {
                              debugPrint(phone.completeNumber);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.sm),
                          child: CustomFormField(
                              labelTxt: "Password",
                              hintTxt: "Enter your password",
                              name: "password",
                              controller: passwordController,
                              icon: Icons.lock,
                              onChangedFunc: (val) {
                                _formKey.currentState!.fields['password']!
                                    .validate();
                              },
                              keyboardType: TextInputType.emailAddress,
                              isObsure: true),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.sm),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => vm.forgetPasswordTap(),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: AppColors.liteOrange,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        CustomGradientButton(
                            heightSize: 32.h,
                            widthSize: 112.w,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              vm.signInTap();
                            },
                            title: "Sign In"),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppColors.deepOrange,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomGradientButton(
                                heightSize: 30.h,
                                widthSize: 65.w,
                                onPressed: () {
                                  vm.userSignUpTap(context);
                                },
                                title: "User"),
                            SizedBox(
                              width: 38.w,
                              child: Center(
                                child: Text(
                                  "Or",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                            CustomGradientButton(
                                heightSize: 30.h,
                                widthSize: 65.w,
                                onPressed: () {
                                  vm.driverSignUpTap(context);
                                },
                                title: "Driver"),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
