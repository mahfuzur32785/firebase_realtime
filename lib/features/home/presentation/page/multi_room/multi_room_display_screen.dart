import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/config/const/app/app_colors.dart';
import 'package:hospital/config/utilities/enum/bloc_api_state.dart';
import 'package:hospital/config/utilities/extension/context_extensions.dart';
import 'package:hospital/core/global_widgets/custom_app_bar.dart';
import 'package:hospital/features/home/presentation/cubit/home_cubit.dart';

class MultiRoomDisplayScreen extends StatefulWidget {
  const MultiRoomDisplayScreen({super.key});

  @override
  State<MultiRoomDisplayScreen> createState() => _MultiRoomDisplayScreenState();
}

class _MultiRoomDisplayScreenState extends State<MultiRoomDisplayScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getMultiRoomDisplayDataList(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Multi Room'),
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
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context.read<HomeCubit>().getAllRoomDisplayDataList(context: context);
                  },
                )
              ],
            ),
          );
        }
        return Container(
          padding: EdgeInsets.all(16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 3),
            children: List.generate(state.multiRoomDisplayList.length, (index) {
              return GestureDetector(
                onTap: () {
                  // if(historyIndex == 0){
                  //   Navigator.pushNamed(context, NameRoute.appointmentHistoryScreen);
                  // }
                },
                child: Container(
                  color: AppColors.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${state.multiRoomDisplayList[index].name}',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColors.white
                      ))
                    ],
                  ),
                ),
              );
            },),
          ),
        );
      }),
    );
  }
}
