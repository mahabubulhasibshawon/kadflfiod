part of 'play_list_cubit.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEnity> songs;
  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlayListState {}
