part of 'widgets.dart';

class ProductFormMobileView extends StatefulWidget {
  final TextEditingController name;

  final TextEditingController price;

  final TextEditingController description;
  ProductType? selectedType;
  ProductFormMobileView({
    super.key,
    required this.name,
    required this.price,
    this.selectedType,
    required this.description,
  });

  @override
  State<ProductFormMobileView> createState() => _ProductFormMobileView();
}

class _ProductFormMobileView extends State<ProductFormMobileView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: widget.name,
                    decoration: AppDecoration.ROUNDEDBORDER('Name'),
                  ),
                  TextField(
                    controller: widget.price,
                    decoration: AppDecoration.ROUNDEDBORDER('Price'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: widget.description,
                    decoration: AppDecoration.ROUNDEDBORDER('Description'),
                    maxLines: 3,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButton<ProductType>(
                      underline: const SizedBox.shrink(),
                      focusColor: Colors.transparent,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36.0,
                      hint: Text('Select Type'),
                      value: widget.selectedType,
                      onChanged: (ProductType? newValue) {
                        setState(() {
                          widget.selectedType = newValue;
                        });
                      },
                      items: ProductType.values.map((ProductType type) {
                        return DropdownMenuItem<ProductType>(
                          value: type,
                          child: Text(type.toString().split('.').last,
                              style: const TextStyle(fontSize: 16.0)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {},
                  child: DottedBorder(
                    dashPattern: const [6.7],
                    borderType: BorderType.RRect,
                    color: Colors.white,
                    strokeWidth: 1,
                    radius: const Radius.circular(12),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: 50,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Choose an image",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
