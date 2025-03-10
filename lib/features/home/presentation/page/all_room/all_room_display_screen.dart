import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/config/const/app/app_colors.dart';
import 'package:hospital/config/navigation/name_route.dart';
import 'package:hospital/config/utilities/enum/bloc_api_state.dart';
import 'package:hospital/config/utilities/extension/context_extensions.dart';
import 'package:hospital/core/global_widgets/custom_app_bar.dart';
import 'package:hospital/features/home/presentation/cubit/home_cubit.dart';

class AllRoomDisplayScreen extends StatefulWidget {
  const AllRoomDisplayScreen({super.key});

  @override
  State<AllRoomDisplayScreen> createState() => _AllRoomDisplayScreenState();
}

class _AllRoomDisplayScreenState extends State<AllRoomDisplayScreen> {

  final databaseReference = FirebaseDatabase.instance.ref();


  @override
  void initState() {
    context.read<HomeCubit>().getAllRoomDisplayDataList(context: context);
    // TODO: implement initState
    super.initState();
  }

  // Function to insert data into Firebase
  void insertData(int item) {
    print('Inserting item: $item');

    // Clear all existing data under "items"
    databaseReference.child("items").set({}).then((value) {
      // Insert the new item
      databaseReference.child("items").push().set(item).then((value) {
        // Optionally, you can navigate after the item is added.
        print("Item inserted successfully!");
        Navigator.pushNamed(context, NameRoute.roomDisplayShowSingleScreen);
      }).catchError((error) {
        print("Failed to insert item: $error");
      });
    }).catchError((error) {
      print("Failed to clear items: $error");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'All Room'),
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
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 3),
              children: List.generate(state.allRoomDisplayList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    // context.read<HomeCubit>().getSingleAllRoomDisplayData(context: context, id: state.allRoomDisplayList[index].id!);
                      insertData(state.allRoomDisplayList[index].id!);
                    },
                  child: Container(
                    color: AppColors.primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${state.allRoomDisplayList[index].name}',style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
