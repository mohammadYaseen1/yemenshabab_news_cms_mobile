import 'package:flutter/material.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/data/const_info/data_safety.dart';
import 'package:yemenshabab/data/const_info/info_model.dart';
import 'package:yemenshabab/shared/component/custom_app_bar.dart';

class TermsScreen extends StatelessWidget {
  TermsScreen({super.key});

  final List<String> letter = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

  @override
  Widget build(BuildContext context) {
    InfoModel dataSafety = isArabic(context) ? DataSafety.ar : DataSafety.en;
    return CustomAppBar(
      body: ListView.separated(
        itemCount: dataSafety.dataModel.length + 1,
        itemBuilder: (context, index) {
          int idx = index - 1;
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    dataSafety.header,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListTile(
                  title: Text(
                    "${index}. ${dataSafety.dataModel[idx].header}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 3,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      ...List.generate(
                        dataSafety.dataModel[idx].nested.length,
                        (index) => ListTile(
                          title: Text(
                            "${letter[index]}. ${dataSafety.dataModel[idx].nested[index].header}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 2,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 20),
                                  child: Text(
                                    "${dataSafety.dataModel[idx].description ?? ""}",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ...List.generate(
                                dataSafety.dataModel[idx].nested[index].dataList.length,
                                    (i) => ListTile(
                                  title: Text(
                                    "- ${dataSafety.dataModel[idx].nested[index].dataList[i].header}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 2,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding:
                                    const EdgeInsetsDirectional.only(start: 20),
                                    child: Text(
                                      "${dataSafety.dataModel[idx].nested[index].dataList[i].description}",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (dataSafety.dataModel[index - 1].description != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 20),
                          child: Text(
                            "${dataSafety.dataModel[index - 1].description ?? ""}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ...List.generate(
                        dataSafety.dataModel[idx].dataList.length,
                        (index) => ListTile(
                          title: Text(
                            "- ${dataSafety.dataModel[idx].dataList[index].header}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              height: 2,
                            ),
                          ),
                          subtitle: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 20),
                            child: Text(
                              "${dataSafety.dataModel[idx].dataList[index].description}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
      ),
      static: true,
    );
  }
}
