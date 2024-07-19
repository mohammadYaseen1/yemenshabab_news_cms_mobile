import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/data_type.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/home_model.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/home/news/news_type.dart';
import 'package:yemenshabab_news_cms_mobile/data/models/section/category.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/cubits/home_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/services/home/models/section/section_entity.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/utils/utils.dart';
import 'package:yemenshabab_news_cms_mobile/views/home/custom_tab_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(
      length: homeController.homeCubit.allSections.length + 1,
      vsync: this,
    )..addListener(
        () {
          setState(() {
            isSelected = isSelected
                .map(
                  (e) => false,
            )
                .toList();
          });

        },
      );

    super.initState();
  }

  CategorySection? section;
  SectionSectionsCategories? category;
  int categoryIndex = 0;
  SectionDate? sectionDate;
  List<bool> isSelected = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var sections = homeController.homeCubit.section;
        var allSections = homeController.homeCubit.allSections;
        if (isSelected.isEmpty) isSelected = unSelected(allSections);
        return DefaultTabController(
          initialIndex: 0,
          length: allSections.length + 1,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 25,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Theme.of(context).cardColor,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontWeight: FontWeight.w900),
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                  tabs: <Widget>[
                    Tab(
                      text: AppLocalizations.of(context)!.you,
                    ),
                    ...List.generate(
                      allSections.length,
                      (index) {
                        if (allSections[index].section.categories!.length > 1) {
                          return Tab(
                            child: DropdownButton<SectionSectionsCategories>(
                              elevation: 0,
                              underline: SizedBox(),
                              borderRadius: BorderRadius.circular(10),
                              hint: Text(isArabic(context)
                                  ? allSections[index].section.nameAr!
                                  : allSections[index].section.nameEn!),
                              value: allSections[index].data,
                              focusColor: Colors.green,
                              style: TextStyle(
                                  fontWeight: isSelected[index]
                                      ? FontWeight.w900
                                      : FontWeight.normal),
                              dropdownColor: Theme.of(context).cardColor,
                              items: allSections[index]
                                  .section
                                  .categories!
                                  .map(
                                    (category) => DropdownMenuItem(
                                      child: Text(isArabic(context)
                                          ? category.nameAr!
                                          : category.nameEn!),
                                      value: category,
                                    ),
                                  )
                                  .toList(),
                              onTap: () async {
                                tabController
                                    .animateTo(allSections[index].index);
                                isSelected = unSelected(allSections);
                                setState(() {
                                  isSelected[index] = true;
                                });
                              },
                              onChanged: (category) {
                                print(category!.nameAr);
                                var categorySection = CategorySection(
                                  dataType: ViewType.valueOf(
                                      allSections[index].section.dataType!),
                                  color: category.color,
                                  layout: Layout.valueOf(category.layout!),
                                  nameAr: category.nameAr,
                                  nameEn: category.nameEn,
                                );
                                homeController.categoryCubit
                                    .navigate(categorySection);
                                section = null;
                                sectionDate = null;
                                setState(() {
                                  section = categorySection;
                                  sectionDate = allSections[index];
                                });
                                // setState(() {
                                //   categoryIndex = allSections[index]
                                //       .section
                                //       .categories!
                                //       .indexOf(category!);
                                //   homeController.homeCubit.categoryIndex =
                                //       categoryIndex = categoryIndex;
                                //   allSections[index].data = category;
                                //   section = CategorySection(
                                //     dataType: ViewType.valueOf(
                                //         allSections[index].section.dataType!),
                                //     color: category!.color,
                                //     layout: Layout.valueOf(category.layout!),
                                //     nameAr: category.nameAr,
                                //     nameEn: category.nameEn,
                                //   );
                                // });
                              },
                            ),
                          );
                        } else {
                          return Tab(
                            text: isArabic(context)
                                ? allSections[index].section.nameAr
                                : allSections[index].section.nameEn,
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  CustomTabScreen(
                      homeModel: widget.homeModel, category: allSections),
                  ...List.generate(
                    allSections.length,
                    (index) {
                      return allSections[index].tab(categoryIndex);
                    },
                  )
                ],
              ),
            ),
          ),
        );
        // return Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: buildDynamicTabBarWidget(context, sections),
        // );
      },
    );
  }

  List<bool> unSelected(List<SectionDate> allSections) {
    return List.generate(
      allSections.length,
      (index) => false,
    );
  }

// Widget buildDynamicTabBarWidget(
//     BuildContext context, List<CategorySection> sections) {
//   return DynamicTabBarWidget(
//     tabAlignment: TabAlignment.start,
//     dynamicTabs: [
//       TabData(
//         index: 0,
//         title: Tab(
//           text: AppLocalizations.of(context)!.you,
//         ),
//         content: CustomTabScreen(homeModel: widget.homeModel),
//       ),
//       ...List.generate(
//         sections.length,
//         (index) {
//           return TabData(
//             index: index,
//             title: Tab(
//               text: isArabic(context)
//                   ? sections[index].nameAr
//                   : sections[index].nameEn,
//             ),
//             content: TabScreen(
//               categoryData: sections[index],
//               videoSection: homeController.homeCubit.videoSection,
//             ),
//           );
//         },
//       )
//     ],
//     padding: EdgeInsets.all(0),
//     viewportFractionTabBarView: 1,
//     labelStyle: TextStyle(fontWeight: FontWeight.w900),
//     unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
//     unselectedLabelColor: Colors.grey,
//     dividerColor: Theme.of(context).cardColor,
//     isScrollable: true,
//     dividerHeight: 0.5,
//     onTabControllerUpdated: (controller) {
//       debugPrint("onTabControllerUpdated");
//     },
//     onTabChanged: (index) {
//       debugPrint("Tab changed: $index");
//     },
//     showBackIcon: false,
//     showNextIcon: false,
//     indicatorColor: Colors.red,
//     automaticIndicatorColorAdjustment: true,
//   );
// }
//
// Widget buildTabBarWidget(
//     BuildContext context, List<CategorySection> sections) {
//   return TabBar(tabs: [
//     Tab(
//       text: AppLocalizations.of(context)!.you,
//       // child: CustomTabScreen(homeModel: homeModel),
//     ),
//     ...List.generate(
//       sections.length,
//       (index) {
//         return Tab(
//           text: isArabic(context)
//               ? sections[index].nameAr
//               : sections[index].nameEn,
//           // child: TabScreen(
//           //   categoryData: sections[index],
//           //   videoSection: homeController.homeCubit.videoSection,
//           // ),
//         );
//       },
//     )
//   ]);
//
//   return DynamicTabBarWidget(
//     tabAlignment: TabAlignment.start,
//     dynamicTabs: [
//       TabData(
//         index: 0,
//         title: Tab(
//           text: AppLocalizations.of(context)!.you,
//         ),
//         content: CustomTabScreen(homeModel: widget.homeModel),
//       ),
//       ...List.generate(
//         sections.length,
//         (index) {
//           return TabData(
//             index: index,
//             title: Tab(
//               text: isArabic(context)
//                   ? sections[index].nameAr
//                   : sections[index].nameEn,
//             ),
//             content: TabScreen(
//               categoryData: sections[index],
//               videoSection: homeController.homeCubit.videoSection,
//             ),
//           );
//         },
//       )
//     ],
//     padding: EdgeInsets.all(0),
//     viewportFractionTabBarView: 1,
//     labelStyle: TextStyle(fontWeight: FontWeight.w900),
//     unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
//     unselectedLabelColor: Colors.grey,
//     dividerColor: Theme.of(context).cardColor,
//     isScrollable: true,
//     dividerHeight: 0.5,
//     onTabControllerUpdated: (controller) {
//       debugPrint("onTabControllerUpdated");
//     },
//     onTabChanged: (index) {
//       debugPrint("Tab changed: $index");
//     },
//     showBackIcon: false,
//     showNextIcon: false,
//     indicatorColor: Colors.red,
//     automaticIndicatorColorAdjustment: true,
//   );
// }
}
