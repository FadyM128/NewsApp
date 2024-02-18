import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{

static SharedPreferences? sharedPreferences;

static init()async
{

  sharedPreferences=await SharedPreferences.getInstance();


}

static Future<bool?> putData(
{
  required String key,
  required bool value,
}
    )async
{


    var x= await sharedPreferences?.setBool(key, value);

return x;
}

static bool? getData(
    {
      required String key,

    }
    )
{

  var x=  sharedPreferences?.getBool('isDark');

  print("the get shared preference ${x}");
 return x;

}


}