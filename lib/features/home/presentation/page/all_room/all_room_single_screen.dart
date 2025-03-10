import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/config/const/app/app_colors.dart';
import 'package:hospital/config/utilities/enum/bloc_api_state.dart';
import 'package:hospital/config/utilities/extension/context_extensions.dart';
import 'package:hospital/config/utilities/extension/num_extensions.dart';
import 'package:hospital/core/global_widgets/custom_app_bar.dart';
import 'package:hospital/core/global_widgets/custom_image.dart';
import 'package:hospital/core/global_widgets/no_data_found.dart';
import 'package:hospital/features/home/presentation/cubit/home_cubit.dart';

class AllRoomSingleScreen extends StatefulWidget {
  const AllRoomSingleScreen({super.key});

  @override
  State<AllRoomSingleScreen> createState() => _AllRoomSingleScreenState();
}

class _AllRoomSingleScreenState extends State<AllRoomSingleScreen> {
  final databaseReference = FirebaseDatabase.instance.ref();

  List<String> _items = [];

  @override
  void initState() {
    super.initState();

    // Listen for real-time updates in the Firebase Realtime Database
    databaseReference.child("items").onValue.listen((event) {
      if (event.snapshot.value != null) {
        var data = event.snapshot.value as Map;
        List<String> tempItems = [];
        data.forEach((key, value) {
          tempItems.add(value.toString());
        });
        _items = tempItems;
          print('dsjkhskhfj ${_items.length}');
          print('dsjkhskhfj ${_items}');
          context.read<HomeCubit>().getSingleAllRoomDisplayData(context: context, id: int.parse(_items.first));

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Room'),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state.fetchApiState == NormalApiState.loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        else if (state.fetchApiState == NormalApiState.failure) {
          return SizedBox(
            width: context.appWidth(),
            height: context.appHeight() * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.fetchError, textAlign: TextAlign.center,),
              ],
            ),
          );
        }
          return state.allRoomSinglePayload.lasttoken!=null
              ? Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Doctor Info',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    )),
                5.vertical,
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.58),
                            offset: const Offset(0, 3),
                            blurRadius: 3),
                      ],
                      color: AppColors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CustomImage(
                            path: 'https://demo.medprohis.com/image/${state.allRoomSinglePayload.lasttoken?.doctor?.image}',
                            height: context.appHeight()*0.2,
                            width: context.appWidth()*0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        5.vertical,
                        Text(
                          '${state.allRoomSinglePayload.lasttoken?.doctor?.name}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                20.vertical,
                Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Patient Info',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    )),
                5.vertical,
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.58),
                            offset: const Offset(0, 3),
                            blurRadius: 3),
                      ],
                      color: AppColors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Token No.',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        10.vertical,
                        Text('${state.allRoomSinglePayload.lasttoken?.tokenNumber}',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Divider(color: AppColors.primaryColor,height: 20),
                        RichText(
                          text: TextSpan(
                            text: 'Room No : ',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: state.allRoomSinglePayload.lasttoken?.room?.name??'',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.vertical,
                        Text(state.allRoomSinglePayload.lasttoken?.patient?.firstName??'' + state.allRoomSinglePayload.lasttoken?.patient?.lastName??'',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
              : NoDataFoundWidget(msg: 'data',);
        }),
    );
  }
}
