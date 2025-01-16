import 'package:chewie/chewie.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final ChewieController chewieController;
  TrailerLoaded({required this.chewieController});
}

class LoadFailureTrailer extends TrailerState {
  final String errorMessage;
  LoadFailureTrailer({required this.errorMessage});
}
