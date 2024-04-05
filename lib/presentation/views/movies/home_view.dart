import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:cinemapedia/presentation/providers/providers.dart";
import "package:cinemapedia/presentation/widgets/widgets.dart";

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    // final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    if (slideShowMovies.isEmpty) return const Center(child: CircularProgressIndicator());

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
            centerTitle: false,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  // const CustomAppbar(),
                  MoviesSlideshow(movies: slideShowMovies),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: "En Cines",
                    // subTitle: "Lunes 20",
                    subTitle: "Hoy",
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                  ),

                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: "Próximamente",
                    subTitle: "En éste mes",
                    loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage()
                  ),

                  // MovieHorizontalListview(
                  //   movies: popularMovies,
                  //   title: "Populares",
                  //   subTitle: "En éste mes",
                  //   loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage()
                  // ),

                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: "Mejor calificadas",
                    subTitle: "Desde siempre",
                    loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage()
                  ),

                  const SizedBox(height: 10),
                ],
              );
            },
            childCount: 1
          )
        ),
      ]
    );
  }

  @override
  bool get wantKeepAlive => true;
}
