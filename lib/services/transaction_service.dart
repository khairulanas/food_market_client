part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 3));
    return ApiReturnValue(value: mockTransactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransactions(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));
    return ApiReturnValue(
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }
}
