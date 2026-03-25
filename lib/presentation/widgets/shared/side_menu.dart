import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenu extends ConsumerWidget {
  
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawer(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, 20, 16, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[

              Text('Configuración'),

              SizedBox(height: 10,),

              TextButton.icon(
                onPressed: (){
                 ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                }, 
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2)
                ),
                label: Text('Cambiar tema'),
                icon: Icon(Icons.sunny),
                )

            ])),

         
      ],
    );
  }
}