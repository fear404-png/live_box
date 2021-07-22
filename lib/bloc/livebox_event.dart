part of 'livebox_bloc.dart';

@immutable
abstract class LiveboxEvent {}

class InitialLiveBox extends LiveboxEvent {}

class SeeLeft extends LiveboxEvent {}

class SeeRight extends LiveboxEvent {}

class SeeUp extends LiveboxEvent {}

class SeeDown extends LiveboxEvent {}

class GoLive extends LiveboxEvent {}

class ChangeSizeEyes extends LiveboxEvent {}

class ChangeMouth extends LiveboxEvent {}
