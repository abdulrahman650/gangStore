// import 'package:e_commerce_route/core/di/service_locator.dart';
// import 'package:e_commerce_route/core/utils/ui_utils.dart';
// import 'package:e_commerce_route/features/cart/presentaion/cubit/cart_cubit.dart';
// import 'package:e_commerce_route/features/cart/presentaion/cubit/cart_state.dart';
// import 'package:e_commerce_route/features/products/domain/entities/product.dart';
// import 'package:e_commerce_route/features/products/presentation/cubit/products_cubit.dart';
// import 'package:e_commerce_route/features/products/presentation/cubit/products_state.dart';
// import 'package:e_commerce_route/features/search/presentation/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/resources/assets_manager.dart';
// import '../../../../core/resources/color_manager.dart';
// import '../../../../core/resources/styles_manager.dart';
// import '../../../../core/widgets/custom_elevated_botton.dart';
// import '../../../../core/widgets/product_counter.dart';
// import '../widgets/product_description.dart';
// import '../widgets/product_image.dart';
// import '../widgets/product_label.dart';
// import '../widgets/product_rating.dart';
// import '../widgets/product_slider.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   const ProductDetailsScreen();
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
// final _productsCubit = serviceLocator.get<ProductsCubit>();
//   bool _isLoadingDialogShown = false;
// //   -----
// @override
// void dispose() {
//   print('PRODUCT_DETAILS_DISPOSED');
//   super.dispose();
// }
//   // ------
//   @override
//   Widget build(BuildContext context) {
//     final product = ModalRoute.of(context)!.settings.arguments as Product?;
//     if (product == null) {
//       return const Scaffold(
//         body: Center(child: Text('No Product Data')),
//       );
//     }
//     return BlocListener<CartCubit, CartState>(
//       listener: (context, state) {
//         print('LISTENER_CUBIT_HASH => ${context.read<CartCubit>().hashCode}');
//         print('STATE => ${state.runtimeType}');
//         if (state is AddToCartLoading) {
//           // show loading dialog only once
//           if (!_isLoadingDialogShown && mounted) {
//             _isLoadingDialogShown = true;
//             UIUtils.showLoading(context);
//           }
//         } else if (state is AddToCartSuccess) {
//           if (_isLoadingDialogShown && mounted) {
//             UIUtils.hideLoading(context);
//             _isLoadingDialogShown = false;
//           }
//           UIUtils.showMessage('Product added to cart successfully');
//         } else if (state is AddToCartError) {
//           if (_isLoadingDialogShown && mounted) {
//             UIUtils.hideLoading(context);
//             _isLoadingDialogShown = false;
//           }
//           UIUtils.showMessage(state.message);
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             'Product Details',
//             style: getMediumStyle(color: ColorManager.appBarTitle)
//                 .copyWith(fontSize: 20.sp),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () => Navigator.of(context).push(
//         MaterialPageRoute(builder: (_) => const SearchScreen()),
//       ),
//               icon: const ImageIcon(
//                 AssetImage(IconsAssets.search),
//                 color: ColorManager.primary,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.shopping_cart_outlined,
//                 color: ColorManager.primary,
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsetsDirectional.only(
//               start: 16.w,
//               end: 16.w,
//               bottom: 50.h,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ProductSlider(
//                   items:product.imagesURLs.map(
//                         (imageURL) => ProductImage(
//                           imageUrl: imageURL,
//                           product: product,
//                         ),
//                   )
//                       .toList(),
//                   initialIndex: 0,
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                  ProductLabel(
//                   name: product.title,
//                   price: 'EGP ${product.priceAfterDiscount ?? product.price}',
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 Row(
//                   children: [
//                      Expanded(
//                       child: ProductRating(
//                         buyers: '${product.sold}',
//                         rating: '${product.ratingsAverage} (${product.ratingsQuantity})',
//                       ),
//                     ),
//                     ProductCounter(
//                       initialValue: _productsCubit.productQuantity,
//                       onIncrement: _productsCubit.changeProductQuantity,
//                       onDecrement: _productsCubit.changeProductQuantity,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                  ProductDescription(
//                   description:
//                   product.description,
//                 ),
//                 SizedBox(
//                   height: 48.h,
//                 ),
//                 Row(
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Total price',
//                           style: getMediumStyle(
//                             color: ColorManager.primary.withOpacity(.6),
//                           ).copyWith(fontSize: 18.sp),
//                         ),
//                         SizedBox(
//                           height: 12.h,
//                         ),
//                         // Use the existing _productsCubit instance directly to avoid
//                         // creating/closing a cubit accidentally via BlocProvider.create.
//                         BlocBuilder<ProductsCubit, ProductsState>(
//                           bloc: _productsCubit,
//                           builder: (BuildContext context, ProductsState state) {
//                             return Text(
//                               'EGP ${_productsCubit.productQuantity *(product.priceAfterDiscount ?? product.price)}',
//                               style: getMediumStyle(
//                                 color: ColorManager.appBarTitle,
//                               ).copyWith(fontSize: 18.sp),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 33.w,
//                     ),
//                     Expanded(
//                         child: CustomElevatedButton(
//                             label: 'Add to cart',
//                             onTap: () {
//                               print('BUTTON_CUBIT_HASH => ${context.read<CartCubit>().hashCode}');
//                               final cartCubit = context.read<CartCubit>();
//                               if (cartCubit.state is AddToCartLoading) return;
//                               cartCubit.addToCart(product.id);
//                             },
//                         prefixIcon: const Icon(
//                           Icons.add_shopping_cart_outlined,
//                           color: ColorManager.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
