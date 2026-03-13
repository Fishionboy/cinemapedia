import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {

  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigation({
    super.key, 
    required this.navigationShell
    });

 

  void onItemTapped(BuildContext context, int index){
   navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,    
      onTap: (index) => onItemTapped(context, index),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio'),
       
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorias'),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos'),       
      ],
    );
  }
}