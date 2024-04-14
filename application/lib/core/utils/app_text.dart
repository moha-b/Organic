part of 'utils.dart';

abstract class AppText {
  static TextStyle h1() => TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 27.sp,
      );
  static TextStyle hint({double? size}) => TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.GREY,
        fontSize: size,
      );
}
