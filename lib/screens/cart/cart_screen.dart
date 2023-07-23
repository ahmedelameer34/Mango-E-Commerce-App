import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/cart_model.dart';

import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_cubit/home_states.dart';

import '../../models/home_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessAddItemState) {
          state.cartItem.quantity++;
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('Cart'),
            ),
            body: ConditionalBuilder(
              builder: (context) {
                return cubit.cartModel!.data.cartItems.isNotEmpty
                    ? Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => cartBuilder(
                                  cubit.homeModel!,
                                  cubit.cartModel!.data.cartItems[index],
                                  index,
                                  context,
                                  cubit
                                      .cartModel!.data.cartItems[index].quantity
                                      .toString()),
                              itemCount: cubit.cartModel!.data.cartItems.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 5,
                                  child: Divider(
                                    thickness: 0.8,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              color: Colors.grey[50],
                              elevation: 0.5,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Subtotal ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${cubit.cartModel!.data.subTotal} EGP',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'fees ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          '0 EGP',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'total ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${cubit.cartModel!.data.total} EGP',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Checkout',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.favorite_border_outlined),
                            ),
                            Center(
                              child: Text(
                                "Your cart is empty",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      );
              },
              condition: cubit.cartModel != null && cubit.homeModel != null,
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}

Widget cartBuilder(
    HomeModel homeModel, CartItem model, int index, context, String quantity) {
  return Container(
      decoration: BoxDecoration(color: Colors.grey[50]),
      width: double.infinity,
      height: 180,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 180,
                      width: 150,
                      child: Image(
                        image: NetworkImage(
                          model.product.image!,
                        ),
                        //fit: BoxFit.cover,
                      ),
                    ),
                    if (model.product.oldPrice != model.product.price)
                      Container(
                        color: Colors.redAccent,
                        child: const Text(
                          'Discount',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product.name.toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              HomeCubit.get(context).addItem(model.quantity);
                            },
                          ),
                          Text(
                            quantity,
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              HomeCubit.get(context).addItem(model.quantity);
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                '${model.product.price} EGP',
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (model.product.oldPrice != model.product.price)
                                Text(
                                  '${model.product.oldPrice} EGP',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.red),
                                ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: IconButton(
                              iconSize: 18,
                              color:
                                  HomeCubit.get(context).cart[model.product.id]!
                                      ? Colors.green
                                      : Colors.grey[700],
                              onPressed: () {
                                HomeCubit.get(context)
                                    .changeCart(model.product.id);
                              },
                              icon: const Icon(Icons.shopping_cart)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: IconButton(
                              iconSize: 18,
                              onPressed: () {
                                HomeCubit.get(context)
                                    .changeFavorites(model.product.id);
                              },
                              icon: Icon(
                                Icons.favorite_outlined,
                                color: HomeCubit.get(context)
                                        .favourites[model.product.id]!
                                    ? Colors.red
                                    : Colors.grey[700],
                              )),
                        )
                      ],
                    )
                  ]),
            ),
          )
        ],
      ));
}
