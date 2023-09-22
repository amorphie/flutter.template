import 'dart:io';

import 'package:burgan_core/burgan_core.dart';
import 'package:burgankuwait/core/dependency_injection/dependency_injection.dart';
import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_network_manager.dart';
import 'package:burgankuwait/core/reusable_widgets/account_summary/account_summary_widget_ui_model.dart';
import 'package:burgankuwait/core/reusable_widgets/brg_account_slider/brg_account_slider_widget_builder.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'account_summary_widget_event.dart';

part 'account_summary_widget_state.dart';

final _baseUrlLocal = Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000";

class AccountSummaryWidgetBloc extends Bloc<AccountSummaryWidgetEvent, AccountSummaryWidgetState> {
  bool isFlipped = false;

  AccountSummaryWidgetBloc() : super(AccountSummaryWidgetStateLoading()) {
    _listenForWidgetEvents();

    on<AccountSummaryWidgetEventFetchComponentDetails>((event, emit) async {
      emit(AccountSummaryWidgetStateLoading());
      final response =
          await AccountSummaryNetworkManager(_baseUrlLocal).fetchAccountSummaryComponentDetails(event.iban);
      emit(AccountSummaryWidgetStateLoaded(AccountSummaryWidgetUIModel.fromResponse(response)));
    });
  }

  _listenForWidgetEvents() {
    getIt.get<BrgWidgetEventBus>().listen(
          eventId: BrgAccountSliderWidgetBuilder.type,
          onEventReceived: (BrgWidgetEvent event) {
            if (event.data is bool) {
              isFlipped = event.data as bool;
              add(AccountSummaryWidgetEventFetchComponentDetails("iban"));
            }
          },
        );
  }
}
