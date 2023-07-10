import 'package:bloc/bloc.dart';
import 'package:burgan_poc/core/reusable_widgets/account_summary/account_summary_widget_ui_model.dart';
import 'package:equatable/equatable.dart';

part 'account_summary_widget_event.dart';

part 'account_summary_widget_state.dart';

class AccountSummaryWidgetBloc extends Bloc<AccountSummaryWidgetEvent, AccountSummaryWidgetState> {
  AccountSummaryWidgetBloc() : super(AccountSummaryWidgetStateLoading()) {
    on<AccountSummaryWidgetEventSetUIModel>((event, emit) {
      emit(AccountSummaryWidgetStateLoaded(event.uiModel));
    });
  }
}
