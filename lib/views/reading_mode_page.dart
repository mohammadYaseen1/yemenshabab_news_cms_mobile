import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/extension/string.dart';
import 'package:yemenshabab/services/home/models/news/news_entity.dart';
import 'package:yemenshabab/views/home/my_slider.dart';

class ReadingModePage extends StatefulWidget {
  const ReadingModePage(
      {super.key, required this.content, required this.isArabicLang});

  final NewsEntity content;
  final bool isArabicLang;

  @override
  State<ReadingModePage> createState() => _ReadingModePageState();
}

class _ReadingModePageState extends State<ReadingModePage> {
  var fontSize = 18.0;
  final locale = Get.locale;
  late bool isArabicLang;

  @override
  void initState() {
    isArabicLang = (locale == const Locale('ar'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "#fce292".toColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: "#fce295".toColor,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Theme.of(context).cardColor,
                  constraints: const BoxConstraints(
                    maxHeight: 300,
                  ),
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SizedBox(
                        child: ListView(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Text(
                              'settingContent'.tr,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'fontSize'.tr,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            MySlider(
                              fontSize: fontSize,
                              onChanged: (value) {
                                setState(() {
                                  fontSize = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'language'.tr,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AnimatedToggleSwitch<Locale>.size(
                              textDirection: TextDirection.rtl,
                              current: isArabicLang
                                  ? const Locale('ar')
                                  : const Locale('en'),
                              values: const [
                                Locale('ar'),
                                Locale('en'),
                              ],
                              indicatorSize: const Size.fromWidth(300),
                              borderWidth: 4.0,
                              iconList: const [
                                Text('العربية'),
                                Text('English'),
                              ],
                              iconAnimationType: AnimationType.onHover,
                              style: ToggleStyle(
                                borderColor: Colors.transparent,
                                indicatorColor:
                                    Theme.of(context).toggleButtonsTheme.color,
                                backgroundColor: Theme.of(context)
                                    .toggleButtonsTheme
                                    .fillColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onChanged: (local) {
                                setState(() {
                                  isArabicLang = local.languageCode == 'ar';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SelectableText(
                  textDirection:
                      isArabicLang ? TextDirection.rtl : TextDirection.ltr,
                  isArabicLang
                      ? widget.content.titleAr!
                      : widget.content.titleEn!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                textDirection:
                    isArabicLang ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SelectableText(
                      isArabicLang
                          ? widget.content.category!.nameAr!
                          : widget.content.category!.nameEn!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      isArabicLang ? 'ar' : 'en',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SelectionArea(
                  selectionControls: CupertinoTextSelectionControls(),
                  child: HtmlWidget(
                    customWidgetBuilder: (element) {
                      if (element.attributes.containsKey("src")) {
                        return const SizedBox();
                      }
                      return null;
                    },
                    isArabicLang
                        ? widget.content.contentAr!
                        : widget.content.contentEn!,
                    renderMode: RenderMode.column,
                    textStyle: TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
