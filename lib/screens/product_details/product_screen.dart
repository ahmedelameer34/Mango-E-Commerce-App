import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_cubit/home_states.dart';

import '../../models/home_model.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  Product? productDetails;

  ProductDetailsScreen({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          color: Colors.white,
                          width: double.infinity,
                          height: 300,
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Image(
                                image: NetworkImage(productDetails!.image!),
                                fit: BoxFit.cover,
                              ),
                              if (productDetails!.oldPrice !=
                                  productDetails!.price)
                                Container(
                                  color: Colors.redAccent,
                                  child: const Text(
                                    'Discount',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      height: 70,
                      width: 200,
                      child: CarouselSlider(
                          items: productDetails!.images
                              .map((e) => Image(
                                    image: NetworkImage(e),
                                    fit: BoxFit.cover,
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            // height: 60,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                            reverse: false,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productDetails!.name!,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${productDetails!.price} EGP',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 18),
                                  ),
                                  if (productDetails!.oldPrice !=
                                      productDetails!.price)
                                    Text(
                                      '${productDetails!.oldPrice} EGP',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.red),
                                    ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  iconSize: 24,
                                  onPressed: () {},
                                  icon: const Icon(Icons.shopping_cart)),
                              IconButton(
                                  iconSize: 24,
                                  onPressed: () {
                                    cubit.changeFavorites(productDetails!.id!);
                                  },
                                  icon: Icon(
                                    Icons.favorite_outlined,
                                    color: cubit.favourites[productDetails!.id]!
                                        ? Colors.red
                                        : Colors.grey[700],
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            productDetails!.description!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              height: 220,
                              width: double.infinity,
                              child: CarouselSlider(
                                  items: productDetails!.images
                                      .map((e) => Image(
                                            image: NetworkImage(e),
                                            fit: BoxFit.cover,
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    // height: 60,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    scrollDirection: Axis.horizontal,
                                    reverse: false,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            condition: productDetails != null && cubit.homeModel != null,
            fallback: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
    );
  }
}
