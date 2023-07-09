import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';

import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_cubit/home_states.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessChangeFavoritesState) {
          if (!state.model.status!) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.model.message.toString()),
              backgroundColor: Colors.red,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.model.message.toString()),
                backgroundColor: Colors.green));
          }
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.homeModel != null && cubit.categoriesModel != null,
            builder: (context) {
              return screenBuilder(cubit.homeModel!, cubit.categoriesModel!);
            },
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}

Widget screenBuilder(HomeModel model, CategoriesModel catModel) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data!.banners
                .map((e) => Image(image: NetworkImage(e.image)))
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                height: 250,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(seconds: 1))),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      categoryBuilder(catModel, index),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemCount: catModel.data.data.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'New products',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    productBuilder(model, index, context),
                itemCount: model.data!.products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                    child: Divider(
                      thickness: 0.8,
                      color: Colors.grey,
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget categoryBuilder(CategoriesModel model, int index) {
  return InkWell(
    onTap: () {},
    child: SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.data.data[index].image),
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(.7),
            child: Text(
              model.data.data[index].name,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      ),
    ),
  );
}

Widget productBuilder(
  HomeModel model,
  int index,
  context,
) {
  return Container(
      decoration: BoxDecoration(color: Colors.grey[50]),
      width: double.infinity,
      height: 200,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    color: Colors.white,
                    height: 200,
                    width: 150,
                    child: Image(
                      image: NetworkImage(
                        model.data!.products[index].image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (model.data!.products[index].oldPrice !=
                      model.data!.products[index].price)
                    Container(
                      color: Colors.redAccent,
                      child: Text(
                        'Discount',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )
                ],
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
                      model.data!.products[index].name.toString(),
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                model.data!.products[index].price.toString() +
                                    'EGP',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              if (model.data!.products[index].oldPrice !=
                                  model.data!.products[index].price)
                                Text(
                                  model.data!.products[index].oldPrice
                                          .toString() +
                                      'EGP',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.red),
                                ),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            iconSize: 20,
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart)),
                        IconButton(
                            iconSize: 20,
                            onPressed: () {
                              HomeCubit.get(context).changeFavorites(
                                  model.data!.products[index].id);
                            },
                            icon: Icon(
                              Icons.favorite_outlined,
                              color: HomeCubit.get(context).favorites[
                                      model.data!.products[index].id]!
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
