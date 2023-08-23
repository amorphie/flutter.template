import 'package:bloc/bloc.dart';
import 'package:burgankuwait/core/models/brg_phone_number.dart';
import 'package:burgankuwait/core/network/signalr_connection_manager.dart';
import 'package:burgankuwait/features/login/login_network_manager.dart';
import 'package:burgankuwait/features/login/models/login_entity.dart';
import 'package:burgankuwait/features/login/models/login_register_request.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginNetworkManager networkManager;

  LoginBloc({required this.networkManager}) : super(const LoginStateInitial()) {
    _listenForSignalrUpdates();
    on<LoginEventLoginWithCredentials>((event, emit) => _onLoginWithCredentials(event, emit));
    on<LoginEventNavigateToOtp>((event, emit) => emit(const LoginStateInitial(navigateToOtp: true)));
  }

  Future _onLoginWithCredentials(LoginEventLoginWithCredentials event, Emitter<LoginState> emit) async {
    await networkManager.getTransitions();
    await networkManager.login(
      LoginRegisterRequest(
        LoginEntity(tckn: event.tckn, phoneNumber: event.phoneNumber),
      ),
    );
  }

  _listenForSignalrUpdates() {
    SignalrConnectionManager(onPageNavigation: _onNavigateToOtp).init();
  }

  _onNavigateToOtp(bool isNavigationAllowed) {
    if (isNavigationAllowed) {
      add(LoginEventNavigateToOtp());
    }
  }
}
