import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/NewsAPP/cubit/cubit.dart';
import '../../layout/NewsAPP/cubit/states.dart';
import '../../shared.component/components.dart';


class SportScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state){
        var list=NewsCubit.get(context).sport;

        return  list.length>0 ? ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildArticaleItem(list[index],context),
          separatorBuilder: (context, index) =>
              myDivider(),
          itemCount: list.length,
        ):
        Center(child: CircularProgressIndicator());

      },
      listener: (context,state){},
    );
  }
}
