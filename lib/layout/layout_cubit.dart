import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';
import 'package:yemenshabab_news_cms_mobile/shared/local/cache_helper.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  void fetchSetting() {

  }
}
