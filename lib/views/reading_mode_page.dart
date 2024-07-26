import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:yemenshabab/services/home/models/news/news_entity.dart';
import 'package:yemenshabab/shared/component/image_component.dart';
import 'package:yemenshabab/shared/extension/string.dart';
import 'package:yemenshabab/shared/utils/utils.dart';
import 'package:yemenshabab/views/home/my_slider.dart';

class ReadingModePage extends StatefulWidget {
  ReadingModePage({Key? key, required this.content, required this.isArabicLang})
      : super(key: key);

  final NewsEntity content;
  final bool isArabicLang;

  @override
  State<ReadingModePage> createState() => _ReadingModePageState();
}

class _ReadingModePageState extends State<ReadingModePage> {
  var fontSize = 18.0;
  late bool isArabicLang;

  @override
  void initState() {
    isArabicLang = widget.isArabicLang;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "#fce292".toColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
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
                          padding:
                              EdgeInsets.only(top: 15, left: 15, right: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Text(
                              AppLocalizations.of(context)!.settingContent,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.of(context)!.fontSize,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            MySlider(
                              fontSize: fontSize,
                              onChanged: (value) {
                                setState(() {
                                  fontSize = value;
                                  print(fontSize);
                                });
                              },
                            ),
                            SizedBox(height: 10),
                            Text(
                              AppLocalizations.of(context)!.language,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AnimatedToggleSwitch<Locale>.size(
                              textDirection: TextDirection.rtl,
                              current: AppLocalizations
                                  .supportedLocales[isArabicLang ? 0 : 1],
                              values: AppLocalizations.supportedLocales,
                              indicatorSize: const Size.fromWidth(300),
                              borderWidth: 4.0,
                              iconList: [
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
              icon: Icon(Icons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SelectableText(
                    textDirection:
                        isArabicLang ? TextDirection.rtl : TextDirection.ltr,
                    isArabicLang
                        ? widget.content.titleAr!
                        : widget.content.titleEn!,
                    style: TextStyle(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                        getFormattedDate(
                            widget.content.creationDate!,
                            AppLocalizations
                                .supportedLocales[isArabicLang ? 0 : 1]
                                .languageCode),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SelectionArea(
                    selectionControls: CupertinoTextSelectionControls(),
                    child: HtmlWidget(
                      customWidgetBuilder: (element) {
                        if (element.attributes.containsKey("src")) {
                          return SizedBox();
                          var src = element.attributes["src"]!;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: ImageComponent(
                              imageUrl: src,
                              clickable: true,
                            ),
                          );
                        }
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
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
