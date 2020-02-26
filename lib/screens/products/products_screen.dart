// Produt List Screen
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/category_repository.dart';
import 'package:openflutterecommerce/repos/hashtag_repository.dart';
import 'package:openflutterecommerce/repos/product_repository.dart';
import 'package:openflutterecommerce/screens/products/products.dart';
import 'package:openflutterecommerce/screens/products/views/brands.dart';
import 'package:openflutterecommerce/screens/products/views/filters.dart';
import 'package:openflutterecommerce/screens/wrapper.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';
import 'package:openflutterecommerce/widgets/scaffold.dart';

import 'products.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;

  const ProductsScreen({Key key, this.categoryId}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: OpenFlutterScaffold(
      background: null,
      title: "Products",
      body: BlocProvider<ProductBloc>(
          create: (context) {
            return ProductBloc(
                productRepository: ProductRepository(),
                categoryRepository: CategoryRepository(),
                hashtagRepository: HashtagRepository())
              ..add(ProductStartEvent(widget.categoryId));
          },
          child: ProductsWrapper()),
      bottomMenuIndex: 1,
    ));
  }
}

class ProductsWrapper extends StatefulWidget {
  @override
  _ProductsWrapperState createState() => _ProductsWrapperState();
}

class _ProductsWrapperState extends OpenFlutterWrapperState<ProductsWrapper> {
  //State createState() => OpenFlutterWrapperState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        bloc: BlocProvider.of<ProductBloc>(context),
        builder: (BuildContext context, ProductState state) {
          return getPageView(<Widget>[
            ProductsListView(changeView: changePage),
            ProductsCardView(changeView: changePage),
            ProductFilterView(changeView: changePage),
            SelectBrandView(changeView: changePage)
          ]);
        });
  }
}
