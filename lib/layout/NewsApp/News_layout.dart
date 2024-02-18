





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules.SearchNews/searchScreen.dart';
import '../../shared.component/components.dart';
import '../../shared.cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context,state){},
      builder:(context,state){
        var cubit= NewsCubit.get(context);

        return  Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(
                  onPressed: (){

                navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search_rounded,
                  ),
              ),
              IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems ,

            currentIndex: cubit.currentIndex,
            onTap: (index){

              cubit.changeBottomNavBar(index);
            },


          ),

          body: cubit.Screens[cubit.currentIndex],

        );

      },
    ) ;
  }
}
