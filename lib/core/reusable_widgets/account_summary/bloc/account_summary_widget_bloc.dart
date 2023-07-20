import 'package:burgan_poc/core/bus/widget_event_bus/widget_event.dart';
import 'package:burgan_poc/core/bus/widget_event_bus/widget_event_bus.dart';
import 'package:burgan_poc/core/component/component_id.dart';
import 'package:burgan_poc/core/dependency_injection/dependency_injection.dart';
import 'package:burgan_poc/core/reusable_widgets/account_summary/account_summary_network_manager.dart';
import 'package:burgan_poc/core/reusable_widgets/account_summary/account_summary_widget_ui_model.dart';
import 'package:burgan_poc/features/home/bloc/home_page_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_summary_widget_event.dart';

part 'account_summary_widget_state.dart';

class AccountSummaryWidgetBloc extends Bloc<AccountSummaryWidgetEvent, AccountSummaryWidgetState> {
  AccountSummaryWidgetBloc() : super(AccountSummaryWidgetStateLoading()) {
    _listenForWidgetEvents();

    on<AccountSummaryWidgetEventFetchComponentDetails>((event, emit) async {
      // TODO: Call SignalR event
      final response = await AccountSummaryNetworkManager(baseUrlLocal).fetchAccountSummaryComponentDetails(event.iban);

      // TODO: Delete this add event method, this is for SignalR response simulation purposes
      getIt.get<WidgetEventBus>().addEvent(
            WidgetEvent(
              widgetId: ComponentId.accountSummary.value,
              data: AccountSummaryWidgetUIModel.fromResponse(response),
            ),
          );
    });
    on<AccountSummaryWidgetEventSetUIModel>((event, emit) {
      emit(AccountSummaryWidgetStateLoaded(event.uiModel));
    });
  }

  _listenForWidgetEvents() {
    getIt.get<WidgetEventBus>().listen(
          widgetId: ComponentId.accountSummary.value,
          onEventReceived: (WidgetEvent event) {
            if (event.data is AccountSummaryWidgetUIModel) {
              add(AccountSummaryWidgetEventSetUIModel(event.data as AccountSummaryWidgetUIModel));
            }
          },
        );
  }
}
