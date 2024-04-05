import "package:flutter/material.dart";
import "package:cinemapedia/presentation/widgets/widgets.dart";
import "package:cinemapedia/presentation/views/views.dart";

// class HomeScreen extends StatelessWidget {
class HomeScreen extends StatefulWidget {
  static const name = "home-screen";
  final int pageIndex;
  // final Widget childView;

  const HomeScreen({
    super.key,
    required this.pageIndex,
    // required this.childView,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//* Este Mixin es necesario para mantener el estado en el PageView
class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes =  const <Widget>[
    HomeView(),
    PopularView(), // <--- categorias View
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut, 
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        //* Esto evitará que rebote 
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation( 
        currentIndex: widget.pageIndex,
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;


  // final viewRoutes = const <Widget>[
  //   HomeView(),
  //   CategoriesView(),
  //   FavoritesView(),
  // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: childView,
//       // body: IndexedStack(
//       //   index: pageIndex,
//       //   children: viewRoutes,
//       // ),
//       bottomNavigationBar: const CustomBottomNavigation(),
//       // bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
//     );
//   }
}
