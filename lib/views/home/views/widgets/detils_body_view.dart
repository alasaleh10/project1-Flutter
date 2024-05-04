import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';

import 'package:project1/core/routers/app_routers.dart';

import 'package:project1/core/utils/app_styles.dart';
import 'package:project1/core/widgets/custom_elevated_button.dart';
import 'package:project1/model/items_model.dart';
import 'package:project1/views/home/views/widgets/delete_item.dart';
import 'package:project1/views/home/views/widgets/detils_text_row.dart';

import 'package:project1/views/home/views/widgets/rating_item_row.dart';

class DetilsBodyView extends StatefulWidget {
  final int id;
  const DetilsBodyView({super.key, required this.id});

  @override
  State<DetilsBodyView> createState() => _DetilsBodyViewState();
}

class _DetilsBodyViewState extends State<DetilsBodyView> {
  HttpHelper httpHelper = HttpHelper();
  ItemsModel? itemsModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: displayItem(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['status'] == false) {
            return Center(
              child: Text(snapshot.data['message']),
            );
          } else {
            itemsModel = ItemsModel.fromJson(snapshot.data['data']);
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.network(
                        '${httpHelper.baseUrl}/storge/${itemsModel!.itemsImage}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.sizeOf(context).height * .3,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height -
                          MediaQuery.sizeOf(context).height * .3,
                      width: MediaQuery.sizeOf(context).width,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: ListView(
                          children: [
                            const SizedBox(height: 20),
                            DefaultTextStyle(
                                style: AppStyles.textStyle23bold(context),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(itemsModel!.itemsName!),
                                    Text('${itemsModel!.itemsPrice!} ر.ي')
                                  ],
                                )),
                            const RatingItemRow(),
                            const DetilsTextRow(),
                            Text(
                              itemsModel!.itemsDes!,
                              style: AppStyles.textStyle23bold(context),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                      title: 'تعديل',
                                      onPressed: () {
                                        GoRouter.of(context).pushNamed(
                                            AppRouters.editItemView,
                                            extra: itemsModel);
                                      }),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                    child: CustomElevatedButton(
                                  title: 'حذف',
                                  onPressed: () {
                                    
                                    showDialog(
                                        context: context,
                                        builder: (context) => DeleteItem(
                                            itemsModel: itemsModel!));
                                  },
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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

displayItem(int id) async {
  HttpHelper httpHelper = HttpHelper();

  var response =
      await httpHelper.getData(endPoint: '${EndPoints.getItem}?itemId=$id');
  return response;
}
