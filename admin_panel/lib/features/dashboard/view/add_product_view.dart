import 'package:admin_panel/core/resources/resources.dart';
import 'package:admin_panel/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:admin_panel/features/dashboard/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product_model.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  _AddProductViewState createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ProductType? selectedType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ResponsiveView(
              webView: ProductFormWebView(
                name: _nameController,
                price: _priceController,
                description: _descriptionController,
                selectedType: selectedType,
              ),
              tabletView: ProductFormWebView(
                name: _nameController,
                price: _priceController,
                description: _descriptionController,
                selectedType: selectedType,
              ),
              mobileView: ProductFormMobileView(
                name: _nameController,
                price: _priceController,
                description: _descriptionController,
                selectedType: selectedType,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<DashboardBloc>().add(AddProduct(
                    ProductModel(
                      name: _nameController.text,
                      price: double.tryParse(_priceController.text),
                      description: _descriptionController.text,
                    ),
                  )),
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
