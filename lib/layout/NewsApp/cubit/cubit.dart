
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/NewsAPP/cubit/states.dart';

import '../../../modules/business/businessScreen.dart';
import '../../../modules/science/scienceScreen.dart';
import '../../../modules/sport/sportScreen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialStates());
  //create object

 static NewsCubit get(context)=>BlocProvider.of(context);

 int currentIndex=0;
 List<BottomNavigationBarItem> bottomItems=[
BottomNavigationBarItem(
    icon:Icon(
      Icons.business_center,
    ),
  label: 'Business',

),
BottomNavigationBarItem(
    icon:Icon(
      Icons.sports,
    ),
  label: 'Sports',

),
BottomNavigationBarItem(
    icon:Icon(
      Icons.science,
    ),
  label: 'Science',

),



 ];
List<Widget> Screens=[
  BusinessScreen(),
  SportScreen(),
  ScienceScreen(),


];

 void changeBottomNavBar(int index)
 {

   currentIndex=index;
   if (index==1)
     getSport();
   else if (index==2)
     getScince();
   emit(NewsBottomNavStates());
 }

List<dynamic> business=[];
 void getBusiness ()
 {
   emit(NewsGetBusinessLoadingState());
   if(business.length==0)
   {

     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'us',
           'category':'business',
           'apiKey':'39c82b77c8834853b819143d03ba7243',



         }
     ).then((value){

       //print(value?.data.toString());
       business=value?.data['articles'];
       print(business[0]['title']);
       emit(NewsGetBusinessSuccessState());
     }).catchError((error){

       print('the error :${error.toString()}');
       emit(NewsGetBusinessErrorState(error.toString()));
     });




   }else{

     emit(NewsGetBusinessSuccessState());
   }




 }

  List<dynamic> sport=[];
  void getSport ()
  {
    emit(NewsGetSportLoadingState());
    if(sport.length==0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'sports',
            'apiKey': '39c82b77c8834853b819143d03ba7243',


          }
      ).then((value) {
        //print(value?.data.toString());
        sport = value?.data['articles'];
        print(sport[0]['title']);
        emit(NewsGetSportSuccessState());
      }).catchError((error) {
        print('the error :${error.toString()}');
        emit(NewsGetSportErrorState(error.toString()));
      });
    }else{

      emit(NewsGetSportSuccessState());
    }

  }

  List<dynamic> Scince=[];
  void getScince () {
    emit(NewsGetScienceLoadingState());

    if (Scince.length == 0) {
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'us',
            'category': 'science',
            'apiKey': '39c82b77c8834853b819143d03ba7243',


          }
      ).then((value) {
        //print(value?.data.toString());
        Scince = value?.data['articles'];
        print(Scince[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print('the error :${error.toString()}');
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{

      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search=[];
  void getSearch (String value) {


    emit(NewsSearchLoadingState());
    search.clear();
    DioHelper.getData(
        url: 'v2/everything',
        query: {

          'q': '${value}',
          'apiKey': '39c82b77c8834853b819143d03ba7243',


        }
    ).then((value) {
      //print(value?.data.toString());
      search = value?.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print('the error :${error.toString()}');
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
