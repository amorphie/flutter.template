import 'package:bloc/bloc.dart';
import 'package:burgankuwait/features/login/login_workflow_manager.dart';
import 'package:equatable/equatable.dart';

part 'personal_info_event.dart';

part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final LoginWorkflowManager workflowManager;

  PersonalInfoBloc({
    required this.workflowManager,
  }) : super(const PersonalInfoStateInitial()) {
    on<PersonalInfoEventPressContinueButton>((event, emit) => _onContinueButtonPressed(
          name: event.name,
          surname: event.surname,
          email: event.email,
          transitionId: event.transitionId,
        ));
  }

  Future _onContinueButtonPressed({
    required String name,
    required String surname,
    required String email,
    required transitionId,
  }) async {
    await workflowManager.getTransitions();
    await workflowManager.submitPersonalInfo(name, surname, email, transitionId);
  }
}
