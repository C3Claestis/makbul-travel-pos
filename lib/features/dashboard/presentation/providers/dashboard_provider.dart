import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repositories/dashboard_repository.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final dashboardRepositoryProvider = Provider(
  (ref) => DashboardRepository(ref.read(firestoreProvider)),
);

final dashboardSummaryProvider = FutureProvider((ref) async {
  final repo = ref.read(dashboardRepositoryProvider);
  return repo.getDashboardSummary();
});