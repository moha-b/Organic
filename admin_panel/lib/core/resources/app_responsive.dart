part of 'resources.dart';

class ResponsiveView extends StatelessWidget {
  final Widget? mobileView;
  final Widget? tabletView;
  final Widget? webView;

  const ResponsiveView({
    super.key,
    this.mobileView,
    this.tabletView,
    this.webView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.isMobile) {
          return mobileView ?? Text("data");
        } else if (constraints.isTablet) {
          return tabletView ?? Text("data");
        } else {
          return webView ?? Text("data");
        }
      },
    );
  }
}
