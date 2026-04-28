import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:makbul_app/page/main/jamaah/data/maskapaimodel.dart';
import 'package:makbul_app/page/main/jamaah/jenispenerbangan_page.dart';

final statusColorProvider = Provider.family<StatusStyle, String>((ref, status) {
  switch (status.toLowerCase()) {
    case 'ontime':
      return StatusStyle(
        bgColor: const Color(0xFFE5F6EB),
        textColor: const Color(0xFF1B5E20),
      );

    case 'delayed':
      return StatusStyle(
        bgColor: const Color(0xFFFFF3E0),
        textColor: const Color(0xFFE65100),
      );

    case 'boarding':
      return StatusStyle(
        bgColor: const Color(0xFFE3F2FD),
        textColor: const Color(0xFF1565C0),
      );

    case 'check-in':
      return StatusStyle(
        bgColor: const Color(0xFFF3E5F5),
        textColor: const Color(0xFF6A1B9A),
      );

    default:
      return StatusStyle(
        bgColor: Colors.grey.shade200,
        textColor: Colors.grey.shade800,
      );
  }
});

final selectedMaskapaiProvider = StateProvider<MaskapaiModel?>((ref) => null);

final selectedMaskapaiDataLengkapProvider = StateProvider<MaskapaiDataLengkap?>((ref) => null);

final selectedInfoPenerbanganProvider = StateProvider<InfoPenerbangan?>((ref) => null);


