// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makbul_app/page/features/dashboard/presentation/widgets/summary_card.dart';
import '../providers/dashboard_provider.dart';
import '../../domain/entities/dashboard_summary.dart';

class DashboardTravel extends ConsumerWidget {
  const DashboardTravel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardSummaryProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 16),
              _SummarySection(),
              _SectionTitle(title: "Statistik"),
              _ChartPlaceholder(),
              _SectionTitle(title: "Jadwal Terdekat"),
              _ScheduleList(),
              _SectionTitle(title: "Status Jamaah"),
              _StatusSection(),
              _SectionTitle(title: "Peringatan"),
              _AlertSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummarySection extends ConsumerWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dashboardSummaryProvider);

    return summary.when(
      data: (data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.6,
          children: [
            SummaryCard(
                title: "Total Jamaah",
                value: data.totalJamaah.toString()),
            SummaryCard(
                title: "Pendaftaran",
                value: data.totalPendaftaran.toString()),
            SummaryCard(
                title: "Revenue",
                value: "Rp ${data.totalRevenue.toStringAsFixed(0)}"),
            SummaryCard(
                title: "Keberangkatan",
                value: data.totalKeberangkatan.toString()),
          ],
        ),
      ),
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text("Error: $e"),
      ),
    );
  }
}
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(title,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}

class _ChartPlaceholder extends StatelessWidget {
  const _ChartPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(child: Text("Chart Area")),
    );
  }
}

class _ScheduleList extends StatelessWidget {
  const _ScheduleList();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.flight, color: Color(0xFF23762C)),
          title: Text("Umrah Ramadhan"),
          subtitle: Text("12 Mei 2026"),
        ),
      ],
    );
  }
}

class _StatusSection extends StatelessWidget {
  const _StatusSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatusItem("Pending", "12"),
          _StatusItem("Lunas", "30"),
          _StatusItem("Berangkat", "80"),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String label;
  final String count;

  const _StatusItem(this.label, this.count);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count,
            style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23762C))),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class _AlertSection extends StatelessWidget {
  const _AlertSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.warning, color: Colors.orange),
          title: Text("5 jamaah belum upload passport"),
        ),
      ],
    );
  }
}