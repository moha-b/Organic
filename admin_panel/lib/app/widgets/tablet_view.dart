part of 'widgets.dart';

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement your tablet layout here
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Tablet Layout',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
