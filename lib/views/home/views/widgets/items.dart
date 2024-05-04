import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';
import 'package:project1/core/routers/app_routers.dart';
import 'package:project1/core/utils/app_styles.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';
import 'package:project1/model/items_model.dart';

void Function() onTap = () {};

class Items extends StatefulWidget {
  const Items({
    super.key
  });

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  getdata() {
    setState(() {});
  }

  HttpHelper httpHelper = HttpHelper();

  @override
  Widget build(BuildContext context) {
    onTap = getdata;

    return FutureBuilder(
      future: getItems(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      
        if (snapshot.hasData) {
          if (snapshot.data['status'] == false) {
            return Center(
              child: Text(
                snapshot.data['message'],
                style: AppStyles.textStyle23bold(context),
              ),
            );
          } else {
            List<ItemsModel> items = [];

            for (var item in snapshot.data['data']) {
              items.add(ItemsModel.fromJson(item));
            }
            return IntrinsicHeight(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      items.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Image.network(
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.fill,
                                    '${httpHelper.baseUrl}/storge/${items[index].itemsImage}',
                                  ),
                                  DefaultTextStyle(
                                    style:
                                        AppStyles.textStyle20Regular(context),
                                    child: Row(
                                      children: [
                                        Text(items[index].itemsName!),
                                        const SizedBox(width: 10),
                                        Text('${items[index].itemsPrice!} ر.ي'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.card_travel_sharp),
                                          Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Row(
                                        children: List.generate(
                                            6,
                                            (index) => const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 15,
                                                )),
                                      )
                                    ],
                                  ),
                                  CustomElevatedButton(
                                      height: 40,
                                      isDetils: true,
                                      width: 80,
                                      title: 'عــرض',
                                      onPressed: () {
                                        GoRouter.of(context).pushNamed(
                                            AppRouters.itemDetils,
                                            extra: [
                                              items[index].itemsName,
                                              items[index].itemsId
                                            ]);
                                      }),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

getItems() async {
  HttpHelper httpHelper = HttpHelper();

  var response = await httpHelper.getData(endPoint: EndPoints.getItems);

  return response;
}
