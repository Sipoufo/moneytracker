import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_state.cubit.dart';

/// Cubit manager for application navigation
class ApplicationNavigationCubit extends Cubit<ApplicationNavigationState> {
  ApplicationNavigationCubit() : super(const ApplicationNavigationState(pageIndex: 0));

  void changePage(int pageIndex) {
    emit(ApplicationNavigationState(pageIndex: pageIndex));
  }
}
