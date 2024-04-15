import 'dart:developer';

import 'package:admin_panel/core/helpers/id_helper.dart';
import 'package:admin_panel/core/resources/resources.dart';
import 'package:admin_panel/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:admin_panel/features/dashboard/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/product_model.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, this.product});
  final ProductModel? product;
  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isEditing = false;
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _descriptionController;
  ProductType? selectedType;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();

    if (widget.product != null) {
      isEditing = true;
      _nameController.text = widget.product!.name!;
      _priceController.text = widget.product!.price!.toString();
      _descriptionController.text = widget.product!.description!;
    } else {
      log("Product is Null", name: 'Adding View');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Product' : 'Add Product'),
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
              onPressed: () {
                if (isEditing) {
                  context.read<DashboardBloc>().add(EditProduct(
                        ProductModel(
                          id: widget.product!.id,
                          name: _nameController.text,
                          price: double.tryParse(_priceController.text),
                          description: _descriptionController.text,
                        ),
                      ));
                  log("Editing", name: 'Edit View');
                } else {
                  context.read<DashboardBloc>().add(AddProduct(
                        ProductModel(
                          id: IDProvider.id,
                          name: _nameController.text,
                          price: double.tryParse(_priceController.text),
                          description: _descriptionController.text,
                        ),
                      ));
                }
              },
              child: Text(isEditing ? 'Edit Product' : 'Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    isEditing = false;
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
