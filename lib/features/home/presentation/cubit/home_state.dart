part of 'home_cubit.dart';

class HomeState extends Equatable {
  final NormalApiState fetchApiState;
  final NormalApiState saveApiState;
  final List<AllRoomDisplayEntity> allRoomDisplayList;
  final List<MultiRoomDisplayEntity> multiRoomDisplayList;
  final AllRoomSinglePayload allRoomSinglePayload;
  final String fetchError;
  final String saveError;

  const HomeState({
    required this.fetchApiState,
    required this.saveApiState,
    required this.saveError,
    required this.fetchError,
    required this.allRoomDisplayList,
    required this.multiRoomDisplayList,
    required this.allRoomSinglePayload,
  });
  @override
  List<Object?> get props => [
    fetchApiState,
    saveApiState,
    saveError,
    fetchError,
    allRoomDisplayList,
    multiRoomDisplayList,
    allRoomSinglePayload,
  ];

  factory HomeState.initial() => HomeState(
    fetchApiState: NormalApiState.initial,
    saveApiState: NormalApiState.initial,
    saveError: '',
    fetchError: '',
    allRoomDisplayList: [],
    multiRoomDisplayList: [],
    allRoomSinglePayload: AllRoomSinglePayload(),
  );

  HomeState copyWith({
    NormalApiState? fetchApiState,
    NormalApiState? saveApiState,
    String? saveError,
    String? fetchError,
    List<AllRoomDisplayEntity>? allRoomDisplayList,
    List<MultiRoomDisplayEntity>? multiRoomDisplayList,
    AllRoomSinglePayload? allRoomSinglePayload,
  }) {
    return HomeState(
      fetchApiState: fetchApiState ?? this.fetchApiState,
      saveApiState: saveApiState ?? this.saveApiState,
      saveError: saveError ?? this.saveError,
      fetchError: fetchError ?? this.fetchError,
      allRoomDisplayList: allRoomDisplayList ?? this.allRoomDisplayList,
      multiRoomDisplayList: multiRoomDisplayList ?? this.multiRoomDisplayList,
      allRoomSinglePayload: allRoomSinglePayload ?? this.allRoomSinglePayload,
    );
  }
}
