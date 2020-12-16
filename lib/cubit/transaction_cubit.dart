import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market_client/models/models.dart';
import 'package:food_market_client/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> res =
        await TransactionService.getTransactions();

    if (res.message != null) {
      emit(TransactionLoadFailed(res.message));
    } else {
      emit(TransactionLoaded(res.value));
    }
  }

  Future<bool> submitTransactions(Transaction transaction) async {
    ApiReturnValue<Transaction> res =
        await TransactionService.submitTransactions(transaction);

    if (res.message != null) {
      return false;
    } else {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transactions + [res.value]));
      return true;
    }
  }
}
