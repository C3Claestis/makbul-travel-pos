import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/dashboard_summary.dart';

class DashboardRepository {
  final FirebaseFirestore firestore;

  DashboardRepository(this.firestore);

  Future<DashboardSummary> getDashboardSummary() async {
    final results = await Future.wait([
      firestore.collection('jamaahs').get(),
      firestore.collection('jamaah_registrations').get(),
      firestore.collection('payments').get(),
      firestore
          .collection('package_schedules')
          .where('departure_date', isGreaterThan: DateTime.now())
          .get(),
    ]);

    // Ambil hasil berdasarkan index
    final jamaahSnap = results[0] as QuerySnapshot;
    final daftarSnap = results[1] as QuerySnapshot;
    final paymentSnap = results[2] as QuerySnapshot;
    final scheduleSnap = results[3] as QuerySnapshot;

    double totalRevenue = 0;
    for (var doc in paymentSnap.docs) {
      totalRevenue += (doc['amount'] ?? 0).toDouble();
    }

    return DashboardSummary(
      totalJamaah: jamaahSnap.docs.length,
      totalPendaftaran: daftarSnap.docs.length,
      totalRevenue: totalRevenue,
      totalKeberangkatan: scheduleSnap.docs.length,
    );
  }
}
