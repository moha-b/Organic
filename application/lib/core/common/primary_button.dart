part of 'common.dart';

class PrimaryButton extends StatelessWidget {
  // general
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? color;
  final bool isBorder;
  final EdgeInsetsGeometry? margin;
  // text
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.isBorder = false,
    this.fontSize,
    this.color,
    super.key,
    this.fontWeight,
    this.textColor,
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height ?? 55.h,
        alignment: Alignment.center,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: color ?? AppColors.PRIMARY,
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            border: isBorder ? Border.all(color: AppColors.PRIMARY) : null),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? AppColors.WHITE,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
