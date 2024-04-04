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
        if (constraints.maxWidth < 500) {
          return mobileView ?? Text("data");
        } else if (constraints.maxWidth < 1024) {
          return tabletView ?? Text("data");
        } else {
          return webView ?? Text("data");
        }
      },
    );
  }
}
