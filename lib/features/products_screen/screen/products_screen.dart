import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/resources/app_colors.dart';
import 'package:flutter_task/features/products_screen/cubit/products_cubit.dart';
import 'package:flutter_task/features/products_screen/widget/product_item.dart';

import '../../../di/di.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsCubit productsCubit = getIt<ProductsCubit>();

  @override
  void initState() {
    super.initState();
    productsCubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductsCubit, ProductsState>(
          bloc: productsCubit,
          builder: (context, state) {
            switch (state) {
              case ProductsInitial():
                return customLoading();
              case ProductsLoading():
                return customLoading();
              case ProductsSuccess():
                return GridView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      imageUrl: state.products[index].image,
                      title: state.products[index].title,
                      desc: state.products[index].category,
                      price: state.products[index].price,
                      rate: state.products[index].rate,
                    );
                  },
                );
              case ProductsError():
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  Widget customLoading() {
    return Center(child: CircularProgressIndicator(color: AppColors.blueColor));
  }
}
