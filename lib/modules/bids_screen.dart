import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:kayish/blocs/deals%20detais%20cubit/cubit.dart';
import 'package:kayish/blocs/deals%20detais%20cubit/states.dart';
import 'package:kayish/blocs/profile%20cubit/cubit.dart';

import 'package:kayish/shared/component/font_manager.dart';
import 'package:kayish/shared/component/styles.dart';
import 'package:kayish/shared/component/styles_manager.dart';
import 'package:kayish/shared/localization/localizationSetup/app_localization.dart';
import 'package:kayish/widgets/deals_bids_item.dart';
import 'package:kayish/widgets/default_button.dart';

class BidsScreen extends StatelessWidget {
int id;
BidsScreen({
  required this.id
});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> DealsDetailsCubit()..getAllAuctionBids(id),
      child: BlocConsumer<DealsDetailsCubit,DealsDetailsStates>(
        listener: (context,state){},
        builder: (context,state){

          var cubit= DealsDetailsCubit.get(context);

          print(cubit.all.length);
          return  Scaffold(
            appBar: AppBar(
              title: Text(AppLocalization.of(context).translate('Bids')!,style: appBarTitle,),
              centerTitle: true,
              elevation: 0.0,
              leading:IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),

              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
              ),

            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Conditional.single(
                      context: context,
                      conditionBuilder:(context)=> cubit.all.isNotEmpty,
                      widgetBuilder: (context)=> ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cubit.all.length,
                        itemBuilder: (context,index)=>DealsBidsItem(
                          time: '${DateTime.parse(cubit.all[index].time!).hour} : ${DateTime.parse(cubit.all[index].time!).minute} : ${DateTime.parse(cubit.all[index].time!).second}',
                          date: '${DateTime.parse(cubit.all[index].time!).day} / ${DateTime.parse(cubit.all[index].time!).month} / ${DateTime.parse(cubit.all[index].time!).year}',
                          lastPrice:cubit.all[index].bidValue,
                        ),
                        separatorBuilder: (context,index)=>SizedBox(height: 4,),
                      ),
                      fallbackBuilder: (context)=>Center(
                        child: Text(
                          AppLocalization.of(context).translate('There are no bids yet')!,
                          style: Styles.getBoldMainTextStyle(color: Colors.black,fontSize: FontSize.s18),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 16,),

                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
