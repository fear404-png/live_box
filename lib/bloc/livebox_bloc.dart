import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'livebox_event.dart';
part 'livebox_state.dart';

class LiveboxBloc extends Bloc<LiveboxEvent, LiveboxState> {
  double _eyesPositionX = 3;
  double _eyesPositionY = 30;
  double _eyesSize = 25;
  double _mouthPosition = 20;
  double _mouthWidthSize = 40;

  bool _isChangeEyesSize = true;
  bool _isChangeMouthSize = true;
  bool _isChangeMouthPosition = true;

  LiveboxBloc() : super(LiveboxInitial(3, 30, 25, 20, 40));

  @override
  Stream<LiveboxState> mapEventToState(
    LiveboxEvent event,
  ) async* {
    if (event is GoLive) {
      int index;

      index = Random().nextInt(7);
      print(index);
      switch (index) {
        case 0:
          LiveboxInitial(await seeLeft(), _eyesPositionY, _eyesSize,
              _mouthPosition, _mouthWidthSize);

          break;
        case 1:
          yield LiveboxInitial(await seeRight(), _eyesPositionY, _eyesSize,
              _mouthPosition, _mouthWidthSize);

          break;
        case 2:
          yield LiveboxInitial(_eyesPositionX, await seeUp(), _eyesSize,
              _mouthPosition, _mouthWidthSize);

          break;
        case 3:
          yield LiveboxInitial(_eyesPositionX, await seeDown(), _eyesSize,
              _mouthPosition, _mouthWidthSize);

          break;
        case 4:
          yield LiveboxInitial(_eyesPositionX, _eyesPositionY, changeSizeEyes(),
              _mouthPosition, _mouthWidthSize);

          break;

        case 5:
          yield LiveboxInitial(_eyesPositionX, _eyesPositionY, changeSizeEyes(),
              _mouthPosition, changeSizeMouth());
          break;
        case 6:
          yield LiveboxInitial(_eyesPositionX, _eyesPositionY, changeSizeEyes(),
              changeMouthPosition(), _mouthWidthSize);
          break;
      }
    }
  }

  Future<double> seeRight() async {
    _eyesPositionX = 3;

    return Future.delayed(Duration(milliseconds: Random().nextInt(2000)), () {
      this.add(GoLive());
      return _eyesPositionX;
    });
  }

  Future<double> seeLeft() async {
    _eyesPositionX = 17;
    return Future.delayed(Duration(milliseconds: Random().nextInt(2000)), () {
      this.add(GoLive());
      return _eyesPositionX;
    });
  }

  Future<double> seeDown() async {
    _eyesPositionY = 30;
    return Future.delayed(Duration(milliseconds: Random().nextInt(2000)), () {
      this.add(GoLive());
      return _eyesPositionY;
    });
  }

  Future<double> seeUp() async {
    _eyesPositionY = 5;
    return Future.delayed(Duration(milliseconds: Random().nextInt(2000)), () {
      this.add(GoLive());
      return _eyesPositionY;
    });
  }

  double changeSizeEyes() {
    if (_isChangeEyesSize) {
      _isChangeEyesSize = !_isChangeEyesSize;
      _eyesSize = 20;
      this.add(GoLive());
      return _eyesSize;
    } else {
      _isChangeEyesSize = !_isChangeEyesSize;
      _eyesSize = 25;
      this.add(GoLive());
      return _eyesSize;
    }
  }

  double changeSizeMouth() {
    if (_isChangeEyesSize) {
      _isChangeMouthSize = !_isChangeMouthSize;
      _mouthWidthSize = 40;
      this.add(GoLive());
      return _mouthWidthSize;
    } else {
      _isChangeMouthSize = !_isChangeMouthSize;
      _mouthWidthSize = 10;
      this.add(GoLive());
      return _mouthWidthSize;
    }
  }

  double changeMouthPosition() {
    if (_isChangeEyesSize) {
      _isChangeMouthPosition = !_isChangeMouthPosition;
      _mouthPosition = 40;
      this.add(GoLive());
      return _mouthPosition;
    } else {
      _isChangeMouthPosition = !_isChangeMouthPosition;
      _mouthPosition = 20;
      this.add(GoLive());
      return _mouthPosition;
    }
  }
}
