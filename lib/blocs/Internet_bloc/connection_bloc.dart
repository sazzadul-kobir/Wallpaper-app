
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_event.dart';
import 'connection_state.dart';

class ConnectionCheckBloc extends Bloc<ConnectionCheckEvent, ConnectionCheckState> {
  
  Connectivity connectivity;
  
    ConnectionCheckBloc(this.connectivity) : super(InitialState()) {
    on<OnchangedConnectionEvent>((event, emit) {
      if(event.connectivityResult.contains(ConnectivityResult.mobile) || event.connectivityResult.contains(ConnectivityResult.wifi) ){
        emit(ConnectedState());
      }else{
        emit(DisConnectedState());
      }
    });
    
    connectivity.onConnectivityChanged.listen((event) {
      add(OnchangedConnectionEvent(event));
    });

  }
}
