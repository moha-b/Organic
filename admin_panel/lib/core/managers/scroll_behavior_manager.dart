part of 'managers.dart';

class ScrollBehaviorManager extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return super.buildOverscrollIndicator(context, child, details);
  }

  TargetPlatform get platform => TargetPlatform.windows;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return super.getScrollPhysics(context);
  }
}
