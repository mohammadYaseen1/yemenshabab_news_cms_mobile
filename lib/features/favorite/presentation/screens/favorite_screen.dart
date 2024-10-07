import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemenshabab/core/constants/constants.dart';
import 'package:yemenshabab/features/favorite/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:yemenshabab/shared/component/loading.dart';
import 'package:yemenshabab/shared/widget/base_sub_widget.dart';
import 'package:yemenshabab/shared/widget/news_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context
        .read<FavoriteBloc>()
        .add(FavoriteGetEvent(userId: userInfo?.uuid ?? "15"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        // if (state is FavoriteLoadedState) {
        // } else if (state is FavoriteErrorState) {
        //   toast(
        //     title: AppLocalizations.of(context)!.myList,
        //     context: context,
        //     description: AppLocalizations.of(context)!.incorrectEmailOrPassword,
        //     toastType: ToastificationType.error,
        //   );
        // } else if (state is SignOutState) {}
      },
      builder: (context, state) {
        return BaseSubWidget(
          title: AppLocalizations.of(context)!.myList,
          body: getView(state),
        );
      },
    );
  }

  Widget getView(FavoriteState state) {
    if (state is FavoriteLoadingState) {
      return LoadingScreen();
    } else if (state is FavoriteLoadedState) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .8,
          ),
          itemCount: state.favorite.length,
          itemBuilder: (context, index) => NewsWidget(
                isFavorite: true,
                valueChanged: (value) {},
                onTap: () {},
                onPressedFav: () {
                  context.read<FavoriteBloc>().add(
                        FavoriteRemoveEvent(
                          userId: userInfo?.uuid ?? "15",
                          favoriteInfo: state.favorite[index],
                        ),
                      );
                },
                title: state.favorite[index].title,
                imageUrl: state.favorite[index].image,
              ));
    } else if (state is FavoriteErrorState) {
      return ErrorWidget(Exception(state.errorMessage));
    } else {
      return Container();
    }
  }
}
