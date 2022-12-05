import 'package:cab_booking/src/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomButton({
    super.key,
    required this.isSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              color: !isSelected ? AppColors.grey : AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 4.h,
        ),
        Container(
          height: 6.h,
          width: 28.w,
          decoration: BoxDecoration(
              color: (isSelected)
                  ? AppColors.deepOrange
                  : AppColors.lightBackground,
              borderRadius: BorderRadius.circular(20.r)),
        )
      ],
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double widthSize;
  final double heightSize;

  const CustomGradientButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.widthSize = 115,
      this.heightSize = 35});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Container(
          height: heightSize,
          width: widthSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.4),
                  blurRadius: 2.r,
                  offset: const Offset(0, 2))
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.deepOrange, AppColors.liteOrange],
            ),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
