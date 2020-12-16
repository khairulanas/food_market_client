import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market_client/models/models.dart';
import 'package:food_market_client/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> res = await FoodService.getFoods();

    if (res.message != null) {
      emit(FoodLoadFailed(res.message));
    } else {
      emit(FoodLoaded(res.value));
    }
  }
}
