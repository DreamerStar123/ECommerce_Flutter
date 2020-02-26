// Product list Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/repos/models/brand.dart';
import 'package:openflutterecommerce/repos/models/category.dart';
import 'package:openflutterecommerce/repos/models/hashtag.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/widgets/product_filter.dart';

class ProductStateData {
  List<Product> products;
  List<HashTag> hashtags;
  Category category;
}

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class ProductInitialState extends ProductState { }

@immutable
class ProductsLoadedState extends ProductState {
  final ProductStateData data;
  final bool isLoading;
  final bool showSortBy;
  final SortBy sortBy;

  final List<Color> availableColors = [
    Color(0xFF222222),
    Color(0xFFFFFFFF),
    Color(0xFFB82222),
    Color(0xFFBEA9A9),
    Color(0xFFE2BB8D),
    Color(0xFF151867)
  ];

  final List<Color> selectedColors;

  final List<String> availableSizes = [
    'XS','S','M','L','XL'
  ];

  final List<String> selectedSizes;

  final List<Category> availableCatgories = [
    Category(id: 1, title: 'Women'),
    Category(id: 2, title: 'Men'),
    Category(id: 3, title: 'Boys'),
    Category(id: 4, title: 'Girls'),
  ];

  final List<Category> selectedCategories;

  final List<Brand> availableBrands = [
    Brand(1, 'Adidas'),
    Brand(2, 'Adidas Originals'),
    Brand(3, 'Blend'),
    Brand(4, 'Boutique Moschino'),
    Brand(5, 'Champion'),
    Brand(6, 'Diesel'),
  ];

  final List<Brand> selectedBrands;

  final RangeValues priceRange;

  final RangeValues availablePriceRange;

  ProductsLoadedState({this.data, this.isLoading, 
    this.showSortBy, this.sortBy, 
    this.priceRange, @required this.availablePriceRange,
    this.selectedColors, this.selectedSizes,
    this.selectedCategories, this.selectedBrands
    });

  ProductsLoadedState copyWith(
      {ProductStateData data,
      bool loading, 
      bool showSortBy,
      SortBy sortBy,
      RangeValues priceRange,
      RangeValues availablePriceRange,
      List<Color> selectedColors,
      List<String> selectedSizes,
      List<Category> selectedCategories,
      List<Brand> selectedBrands}) {
    return ProductsLoadedState(
      data: data ?? this.data,
      isLoading: loading ?? this.isLoading,
      showSortBy: showSortBy ?? this.showSortBy,
      sortBy: sortBy ?? this.sortBy,
      priceRange: priceRange ?? this.priceRange,
      availablePriceRange: availablePriceRange ?? this.availablePriceRange,
      selectedColors: selectedColors ?? this.selectedColors,
      selectedSizes: selectedSizes ?? this.selectedSizes,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      selectedBrands: selectedBrands ?? this.selectedBrands
    );
  }
  
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
    data, isLoading, showSortBy, sortBy, 
    availablePriceRange, priceRange, 
    selectedColors, selectedSizes, selectedCategories, 
    selectedBrands
  ];
}

@immutable
class ProductsErrorState extends ProductState { }
