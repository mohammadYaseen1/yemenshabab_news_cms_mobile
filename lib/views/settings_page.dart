import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/config/config.dart';
import 'package:yemenshabab/core/extension/string.dart';
import 'package:yemenshabab/core/utils/social_media.dart';
import 'package:yemenshabab/core/utils/utils.dart';
import 'package:yemenshabab/features/app/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:yemenshabab/shared/component/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height * 0.13;
    return CustomAppBar(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'appearance'.tr,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Divider(color: Theme.of(context).cardColor),
                    const SizedBox(height: 10),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildThemeButton(
                          context: context,
                          outsideColor: '#f6f6f6'.toColor,
                          insideColor: Colors.white,
                          border: '#e7e7e7'.toColor,
                          iconColor: Colors.black,
                          themeMode: ThemeMode.light,
                          width: width,
                        ),
                        buildThemeButton(
                          context: context,
                          outsideColor: '#4e4e4e'.toColor,
                          insideColor: '#161616'.toColor,
                          border: '#959595'.toColor,
                          iconColor: Colors.white,
                          themeMode: ThemeMode.dark,
                          width: width,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            ThemeBloc.get(context).add(ThemeEvent.toggleSystem);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: '#f6f6f6'.toColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                                border: Border.all(
                                    color: '#e7e7e7'.toColor,
                                    width: ThemeBloc.get(context)
                                                .state
                                                .themeMode ==
                                            ThemeMode.system
                                        ? 3
                                        : 0)),
                            child: Row(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: width / 2,
                                      decoration: BoxDecoration(
                                          color: '#f6f6f6'.toColor,
                                          borderRadius:
                                              const BorderRadiusDirectional
                                                  .horizontal(
                                                  start: Radius.circular(15)),
                                          border: Border.all(
                                              color: '#e7e7e7'.toColor)),
                                    ),
                                    Container(
                                      height: 80,
                                      width: (width - 25) / 2,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              const BorderRadiusDirectional
                                                  .only(
                                            topStart: Radius.circular(15),
                                          ),
                                          border: Border.all(
                                              color: '#e7e7e7'.toColor)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'Aa',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: width / 2,
                                      decoration: BoxDecoration(
                                          color: '#4e4e4e'.toColor,
                                          borderRadius:
                                              const BorderRadiusDirectional
                                                  .horizontal(
                                                  end: Radius.circular(15)),
                                          border: Border.all(
                                              color: '#959595'.toColor)),
                                    ),
                                    Container(
                                      height: 80,
                                      width: (width - 25) / 2,
                                      decoration: BoxDecoration(
                                          color: '#161616'.toColor,
                                          borderRadius:
                                              const BorderRadiusDirectional
                                                  .only(
                                            topStart: Radius.circular(15),
                                            bottomEnd: Radius.circular(15),
                                          ),
                                          border: Border.all(
                                              color: '#959595'.toColor)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'Aa',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              buildLanguageToggle(context),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection:
                      isArabic(context) ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Text(
                      'followUs'.tr,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (Config.settings!.facebook != null)
                buildSocialMediaButton(
                  icon: FontAwesomeIcons.squareFacebook,
                  url: Config.settings!.facebook!,
                  context: context,
                ),
              if (Config.settings!.instagram != null)
                buildSocialMediaButton(
                  icon: FontAwesomeIcons.instagram,
                  url: Config.settings!.instagram!,
                  context: context,
                ),
              if (Config.settings!.twitter != null)
                buildSocialMediaButton(
                  icon: FontAwesomeIcons.xTwitter,
                  url: Config.settings!.twitter!,
                  context: context,
                ),
              if (Config.settings!.telegram != null)
                buildSocialMediaButton(
                  icon: FontAwesomeIcons.telegram,
                  url: Config.settings!.telegram!,
                  context: context,
                ),
              if (Config.settings!.youtube != null)
                buildSocialMediaButton(
                  icon: FontAwesomeIcons.youtube,
                  url: Config.settings!.youtube!,
                  context: context,
                ),
            ],
          ),
        ],
      ),
      static: true,
    );
  }

  Container buildLanguageToggle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'language'.tr,
            style: const TextStyle(fontSize: 18),
          ),
          Divider(color: Theme.of(context).cardColor),
          const SizedBox(height: 10),
          AnimatedToggleSwitch<Locale>.size(
            textDirection: TextDirection.rtl,
            current: Localizations.localeOf(context),
            values: const [Locale('ar'), Locale('en')],
            indicatorSize: const Size.fromWidth(300),
            borderWidth: 4.0,
            iconList: const [
              Text('العربية'),
              Text('English'),
            ],
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              indicatorColor: Theme.of(context).toggleButtonsTheme.color,
              backgroundColor: Theme.of(context).toggleButtonsTheme.fillColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            onChanged: (local) {
              //   App.of(context)!.setLocale(local);
            },
          )
        ],
      ),
    );
  }

  InkWell buildThemeButton({
    required Color outsideColor,
    required Color border,
    required Color insideColor,
    required Color iconColor,
    required ThemeMode themeMode,
    required BuildContext context,
    required double width,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        // App.of(context)!.setThemeMode(themeMode);
      },
      child: Container(
        decoration: BoxDecoration(
            color: outsideColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: iconColor,
              //   width: App.of(context)!.themeMode == themeMode ? 3 : 0,
            )),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              height: 100,
              width: width,
              decoration: BoxDecoration(
                color: outsideColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: border),
              ),
            ),
            Container(
              height: 75,
              width: width - 25,
              decoration: BoxDecoration(
                  color: insideColor,
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(15),
                    topStart: Radius.circular(15),
                  ),
                  border: Border.all(color: border)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Aa',
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
