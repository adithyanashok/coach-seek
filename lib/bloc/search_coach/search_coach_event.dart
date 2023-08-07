part of 'search_coach_bloc.dart';

@freezed
class SearchCoachEvent with _$SearchCoachEvent {
  const factory SearchCoachEvent.getSearchedCoaches({String? query}) =
      GetSearchedCoaches;
}
