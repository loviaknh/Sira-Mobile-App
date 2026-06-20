import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/payment_repository.dart';

final paymentRepositoryProvider = Provider((ref) => PaymentRepository());

enum PaymentState { idle, initializing, awaitingPin, processing, success, failed, cancelled }

class PaymentStateData {
  final PaymentState state;
  final String? paymentId;
  final String? errorMessage;
  final Map<String, dynamic>? receipt;

  PaymentStateData({this.state = PaymentState.idle, this.paymentId, this.errorMessage, this.receipt});

  PaymentStateData copyWith({PaymentState? state, String? paymentId, String? errorMessage, Map<String, dynamic>? receipt}) {
    return PaymentStateData(
      state: state ?? this.state,
      paymentId: paymentId ?? this.paymentId,
      errorMessage: errorMessage,
      receipt: receipt ?? this.receipt,
    );
  }
}

class PaymentNotifier extends StateNotifier<PaymentStateData> {
  final PaymentRepository repository;
  
  PaymentNotifier(this.repository) : super(PaymentStateData());

  Future<void> initiatePayment({required double amount, required String method}) async {
    state = state.copyWith(state: PaymentState.initializing);
    try {
      final res = await repository.initializePayment(amount: amount, method: method, description: "Cotisation Mutuelle");
      state = state.copyWith(state: PaymentState.awaitingPin, paymentId: res['paymentId']);
    } catch (e) {
      state = state.copyWith(state: PaymentState.failed, errorMessage: e.toString());
    }
  }

  Future<void> confirmPin(String pin) async {
    if (state.paymentId == null) return;
    state = state.copyWith(state: PaymentState.processing);
    try {
      // Simulation delay for MTN MoMo
      await Future.delayed(const Duration(seconds: 2));
      
      await repository.confirmPayment(state.paymentId!);
      
      // Fetch receipt
      final receipt = await repository.getReceipt(state.paymentId!);
      state = state.copyWith(state: PaymentState.success, receipt: receipt);
    } catch (e) {
      state = state.copyWith(state: PaymentState.failed, errorMessage: e.toString());
    }
  }

  Future<void> cancelPayment() async {
    if (state.paymentId == null) return;
    state = state.copyWith(state: PaymentState.processing);
    try {
      await repository.cancelPayment(state.paymentId!);
      state = state.copyWith(state: PaymentState.cancelled);
    } catch (e) {
      state = state.copyWith(state: PaymentState.failed, errorMessage: e.toString());
    }
  }

  void reset() {
    state = PaymentStateData();
  }
}

final paymentProvider = StateNotifierProvider<PaymentNotifier, PaymentStateData>((ref) {
  return PaymentNotifier(ref.watch(paymentRepositoryProvider));
});

final paymentHistoryProvider = FutureProvider<List<dynamic>>((ref) async {
  final repository = ref.watch(paymentRepositoryProvider);
  return repository.getHistory();
});
