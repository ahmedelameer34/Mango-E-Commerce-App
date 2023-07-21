import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_cubit/home_states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return ConditionalBuilder(
            fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child: cubit.favoritesModel!.data!.favData.isNotEmpty
                        ? ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => favoritesBuilder(
                                cubit.homeModel!,
                                cubit.favoritesModel!.data!.favData[index],
                                index,
                                context),
                            itemCount:
                                cubit.favoritesModel!.data!.favData.length,
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
                          )
                        : const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.favorite_border_outlined),
                                ),
                                Text(
                                  "You don't like any product",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          )),
              );
            },
            condition: cubit.favoritesModel != null && cubit.homeModel != null);
      },
    );
  }
}

Widget favoritesBuilder(
  HomeModel homeModel,
  FavData model,
  int index,
  context,
) {
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
                          model.product.image,
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
                    const Spacer(),
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
                        IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart)),
                        IconButton(
                            iconSize: 20,
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
                            ))
                      ],
                    )
                  ]),
            ),
          )
        ],
      ));
}
