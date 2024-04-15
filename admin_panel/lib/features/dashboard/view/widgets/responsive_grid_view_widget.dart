part of 'widgets.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({
    Key? key,
    required this.products,
    required this.crossAxisCount,
  }) : super(key: key);

  final List<ProductModel> products;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(radius: 60),
                    Text(products[index].name!),
                    Text('\$${products[index].price.toString()}'),
                  ],
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('Edit'),
                        onTap: () {
                          NavigationHelper.goBack();
                          NavigationHelper.navigateTo(
                            AppRoute.ADD_PRODUCT,
                            arguments: {'product': products[index]},
                          );
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('Delete'),
                        onTap: () {
                          context.read<DashboardBloc>().add(
                              DeleteProduct(products[index].id.toString()));
                          NavigationHelper.goBack();
                          context.read<DashboardBloc>().add(ViewAllProducts());
                        },
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
