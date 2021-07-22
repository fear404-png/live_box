part of 'livebox_bloc.dart';

@immutable
abstract class LiveboxState {
  double eyesPositionX;
  double eyesPositionY;
  double eyesSize;
  double mouthPosition;
  double mouthWidthSize;


  LiveboxState(this.eyesPositionX, this.eyesPositionY, this.eyesSize, this.mouthPosition, this.mouthWidthSize);
  get positionX => eyesPositionX;
  get positionY => eyesPositionY;
  get size => eyesSize;
}

class LiveboxInitial extends LiveboxState {
  LiveboxInitial(double eyesPositionX, double eyesPositionY, double eyesSize, double mouthPosition, double mouthWidthSize) : super(eyesPositionX, eyesPositionY, eyesSize, mouthPosition, mouthWidthSize);

}
