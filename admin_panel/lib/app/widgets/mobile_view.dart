part of 'widgets.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement your mobile layout here
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Mobile Layout',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
