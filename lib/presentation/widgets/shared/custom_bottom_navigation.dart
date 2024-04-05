import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class CustomBottomNavigation extends StatelessWidget {
  // final int currentIndex;

  const CustomBottomNavigation({
    super.key, required int currentIndex,
    // required this.currentIndex
  });

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case "/":
        return 0;

      case "/populares":
        return 1;

      case "/favorites":
        return 2;

      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // context.go("/");
        context.go("/home/0");
        break;

      case 1:
        // context.go("/populares");
        context.go("/home/1");
        break;

      case 2:
        // context.go("/favorites");
        context.go("/home/2");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Navegación Material 2
    // return BottomNavigationBar(
    //   currentIndex: currentIndex,
    //   elevation: 0,
    //   currentIndex: getCurrentIndex(context),
    //   onTab: (index) => onItemTapped(context, index),
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home_max_outlined),
    //       label: "Inicio",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.label_outline),
    //       label: "Categorías",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.favorite_outline),
    //       label: "Favoritos",
    //     ),
    //   ],
    // );

    // Navegación Material 3
    return NavigationBar(
      elevation: 0,
      selectedIndex: getCurrentIndex(context),
      onDestinationSelected: (index) => onItemTapped(context, index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: "Inicio",
        ),
        NavigationDestination(
          icon: Icon(Icons.thumbs_up_down_outlined),
          label: "Populares",
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          label: "Favoritos",
        ),
      ],
    );
  }
}
