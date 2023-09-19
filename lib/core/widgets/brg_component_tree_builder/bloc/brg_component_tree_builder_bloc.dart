import 'package:burgankuwait/core/util/network/components_network_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'brg_component_tree_builder_event.dart';

part 'brg_component_tree_builder_state.dart';

class BrgComponentTreeBuilderBloc extends Bloc<BrgComponentTreeBuilderEvent, BrgComponentTreeBuilderState> {
  final ComponentsNetworkManager networkManager;

  BrgComponentTreeBuilderBloc(this.networkManager) : super(BrgComponentTreeBuilderStateLoading()) {
    on<BrgComponentTreeBuilderEventFetchComponents>((event, emit) async {
      try {
        var response = await networkManager.fetchPageComponentsByPageId(event.pageId);
        emit(BrgComponentTreeBuilderStateLoaded(componentsMap: response));
      } on Exception catch (e) {
        emit(BrgComponentTreeBuilderStateError(errorMessage: e.toString()));
      }
    });
  }
}
