part of 'widgets.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.total,
  });
  final String title;
  final String total;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title),
            Text(total),
          ],
        ),
      ),
    );
  }
}
