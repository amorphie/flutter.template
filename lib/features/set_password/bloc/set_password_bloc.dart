import 'package:bloc/bloc.dart';
import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_password_event.dart';

part 'set_password_state.dart';

class SetPasswordBloc extends Bloc<SetPasswordEvent, SetPasswordState> {
  final LoginWorkflowManager workflowManager;
  final IComponentsNetworkManager componentsNetworkManager;

  SetPasswordBloc({
    required this.workflowManager,
    required this.componentsNetworkManager,
  }) : super(const SetPasswordStateInitial()) {
    on<SetPasswordEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
  }

  Future _onContinueButtonPressed(SetPasswordEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitPassword(event.password, event.transitionId);
  }
}
