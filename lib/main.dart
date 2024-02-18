
import 'package:bloc/bloc.dart';
import 'package:news_app/layout/NewsAPP/News_layout.dart';
import 'package:news_app/shared.component/bloc_observer.dart';
import 'package:news_app/shared.cubit/cubit.dart';
import 'package:news_app/shared.cubit/states.dart';
//import 'package:course/layout/ToDo_layout.dart';
//import 'package:news_app/modules/login/Login_screen.dart';
//import 'package:news_app/modules/bmi_result/bmi_result.dart';
//import 'package:news_app/modules/bmi/bmi_screen.dart';
//import 'package:news_app/modules/home/home_screen.dart';
//import 'package:news_app/modules/users/users.dart';
//import 'package:news_app/shared/component/bloc_observer.dart';

import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/NewsAPP/cubit/cubit.dart';
//import 'layout/ToDoAPP/ToDo_layout.dart';
//import 'modules/counter/counterScreen.dart';
//import 'modules/messanger/messanger_screen.dart';

void main()async{
  //بيتأكد ان كل حاجه هنا في المثود خلصت بعدين يفتح الاب

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? fromShared= CacheHelper.getData(key:"isDark");
  print("Shared preferece is ${fromShared}");
  runApp(App(fromShared));


}
class App extends StatelessWidget{
  bool? isDark;
  App(this.isDark);

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=>NewsCubit()..getBusiness()),
       BlocProvider(create: (context)=>AppCubit()..changeAppMode(fromShared: isDark),),



     ],
     child: BlocConsumer<AppCubit,AppStates>(
       listener: (context, index){},
       builder: (context,index){

         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             scaffoldBackgroundColor: Colors.white,
             primarySwatch: Colors.deepOrange,
             appBarTheme: AppBarTheme(
               iconTheme: IconThemeData(
                 color: Colors.black,

               ),
               systemOverlayStyle:SystemUiOverlayStyle(
                 statusBarBrightness:Brightness.dark,

                 statusBarColor: Colors.white,
               ),
               backgroundColor: Colors.white,
               elevation: 0.0,
               titleTextStyle: TextStyle(
                 color: Colors.black,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               backgroundColor: Colors.white,
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.deepOrange,
               unselectedItemColor: Colors.grey,
               elevation: 30.0,

             ),
             textTheme: TextTheme(
               bodyText1:TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18.0,
                   color: Colors.black


               ),


             ),
           ),
           darkTheme: ThemeData(
             scaffoldBackgroundColor: HexColor('333739'),
             primarySwatch: Colors.deepOrange,
             appBarTheme: AppBarTheme(
               iconTheme: IconThemeData(
                 color: Colors.white,

               ),
               systemOverlayStyle:SystemUiOverlayStyle(
                 statusBarBrightness:Brightness.light,

                 statusBarColor: HexColor('333739'),
               ),
               backgroundColor: HexColor('333739'),
               elevation: 0.0,
               titleTextStyle: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               backgroundColor: HexColor('333739'),
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Colors.deepOrange,
               unselectedItemColor: Colors.grey,
               elevation: 30.0,

             ),
             textTheme: TextTheme(
               bodyText1:TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18.0,
                   color: Colors.white


               ),


             ),




           ),
           themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
           home: Directionality(
               textDirection: TextDirection.ltr,
               child: NewsLayout()
           )
           ,
         );

       },
     ),
   );
  }



}