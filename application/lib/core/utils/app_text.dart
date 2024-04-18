part of 'utils.dart';

abstract class AppText {
  static TextStyle h1() => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 27.sp,
      );
  static TextStyle h2() => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 22.sp,
      );
  static TextStyle hint({double? size}) => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.GREY,
        fontSize: size,
      );
  static TextStyle productTitle({double? size}) => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.BROWN,
        fontSize: 15.sp,
      );
  static TextStyle price({double? size}) => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.GREY,
        fontSize: 17.sp,
      );
}
