import 'package:flutter/material.dart';
import 'package:project1/core/api/end_points.dart';
import 'package:project1/core/api/http_helper.dart';
import 'package:project1/core/utils/app_styles.dart';
import 'package:project1/model/categorisess_model.dart';

class Categorisess extends StatefulWidget {
  const Categorisess({
    super.key,
  });

  @override
  State<Categorisess> createState() => _CategorisessState();
}

class _CategorisessState extends State<Categorisess> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  HttpHelper helpers = HttpHelper();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
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
            List<CategorisessModel> categorisess = [];

            for (var items in snapshot.data['data']) {
              categorisess.add(CategorisessModel.fromJson(items));
            }

            return IntrinsicHeight(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      categorisess.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Image.network(
                                    '${helpers.baseUrl}/storge/${categorisess[index].categoriesImage}',
                                    height: 70,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    categorisess[index].categoriesName!,
                                    style: AppStyles.textStyle23bold(context),
                                  ),
                                  const SizedBox(height: 8)
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

  getData() async {
    var response = await helpers.getData(endPoint: EndPoints.getCategorisess);
    return response;
  }
}
