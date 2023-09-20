import 'package:bloc/bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'set_security_picture_event.dart';

part 'set_security_picture_state.dart';

class SetSecurityPictureBloc extends Bloc<SetSecurityPictureEvent, SetSecurityPictureState> {
  final LoginWorkflowManager workflowManager;

  SetSecurityPictureBloc({
    required this.workflowManager,
  }) : super(const SetSecurityPictureStateInitial()) {
    on<SetSecurityPictureEventPressContinueButton>((event, emit) => _onContinueButtonPressed(event));
  }

  Future _onContinueButtonPressed(SetSecurityPictureEventPressContinueButton event) async {
    await workflowManager.getTransitions();
    await workflowManager.submitSecurityImage(
      selectedPictureId: event.selectedPictureId,
      transitionId: event.transitionId,
    );
  }
}
