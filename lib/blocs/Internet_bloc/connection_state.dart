


import 'package:equatable/equatable.dart';

abstract class ConnectionCheckState extends Equatable{

  @override
  List<Object?> get props => [];
}

class InitialState extends ConnectionCheckState{


}
class ConnectedState extends ConnectionCheckState{}

class DisConnectedState extends ConnectionCheckState{}

