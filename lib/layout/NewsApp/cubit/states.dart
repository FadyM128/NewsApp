abstract class NewsStates {}
class NewsInitialStates extends NewsStates{}



class NewsBottomNavStates extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates
{
late final String error;

NewsGetBusinessErrorState(this.error);



}

class NewsGetSportLoadingState extends NewsStates{}
class NewsGetSportSuccessState extends NewsStates{}
class NewsGetSportErrorState extends NewsStates
{
  late final String error;

  NewsGetSportErrorState(this.error);



}


class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates
{
  late final String error;

  NewsGetScienceErrorState(this.error);



}


class NewsSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates {
  late final String error;

  NewsGetSearchErrorState(this.error);


}