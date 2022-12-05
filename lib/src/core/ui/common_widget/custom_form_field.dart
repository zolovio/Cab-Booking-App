import 'package:cab_booking/src/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomFormField extends StatelessWidget {
  final String labelTxt;
  final String hintTxt;
  final String name;
  final TextEditingController controller;
  final IconData icon;
  final Function onChangedFunc;
  final TextInputType keyboardType;
  final bool isObsure;
  final bool isMandatory;

  const CustomFormField(
      {super.key,
      required this.labelTxt,
      this.hintTxt = '',
      required this.name,
      required this.controller,
      required this.icon,
      required this.onChangedFunc,
      required this.keyboardType,
      this.isObsure = false,
      this.isMandatory = false});

  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.r),
    borderSide: const BorderSide(color: AppColors.grey),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sm, horizontal: 25.sm),
      child: FormBuilderTextField(
        style: TextStyle(color: AppColors.black.withOpacity(0.7)),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(15.sm),
            child: (name == 'licenceNum')
                ? Image.asset(
                    'assets/licence_no.png',
                    height: 2.h,
                    width: 2.h,
                    color: AppColors.grey,
                  )
                : Icon(
                    icon,
                    size: 20.sm,
                    color: AppColors.grey,
                  ),
          ),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          labelText: labelTxt,
          hintText: hintTxt,
          suffixIcon: (isMandatory)
              ? Padding(
                  padding: EdgeInsets.only(left: 25.sm),
                  child: Text(
                    "*",
                    style: TextStyle(
                        color: AppColors.deepOrange,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : null,
        ),
        name: name,
        controller: controller,
        obscureText: isObsure,
        onChanged: (val) => onChangedFunc(val),
        validator: (name == 'carNum' || name == 'licenceNum')
            ? null
            : FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                if (name == 'email') FormBuilderValidators.email(),
                if (name == 'phoneNo') FormBuilderValidators.maxLength(15)
              ]),
        keyboardType: keyboardType,
      ),
    );
  }
}
