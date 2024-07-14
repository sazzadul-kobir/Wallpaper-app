


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectionCheckEvent extends Equatable {}


class OnchangedConnectionEvent extends ConnectionCheckEvent{

  final List<ConnectivityResult> connectivityResult;


  OnchangedConnectionEvent(this.connectivityResult);

  @override
  // TODO: implement props
  List<Object?> get props =>[connectivityResult];
}