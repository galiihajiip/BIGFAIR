import 'package:flutter/material.dart';

/// Local mock data for the B1GFAIR landing page.
/// All data is static — no backend integration yet.

class EventData {
  const EventData({
    required this.city,
    required this.venue,
    required this.date,
    required this.tags,
    required this.gradientColors,
  });

  final String city;
  final String venue;
  final String date;
  final List<String> tags;
  final List<Color> gradientColors;

  String get title => 'BIGFAIR $city';
}

class CityData {
  const CityData({required this.name, required this.status});

  final String name;
  final String status; // "Tersedia" | "Segera Hadir"
}

class BenefitData {
  const BenefitData({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}

class HowItWorksStep {
  const HowItWorksStep({
    required this.number,
    required this.title,
    required this.description,
  });

  final int number;
  final String title;
  final String description;
}

class FaqItem {
  const FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}

// ── Events ──────────────────────────────────────────────────────────
const List<EventData> mockEvents = [
  EventData(
    city: 'Surabaya',
    venue: 'Airlangga Convention Center',
    date: 'Minggu, 04 Januari',
    tags: ['Seminar', 'Talkshow', 'Networking'],
    gradientColors: [Color(0xFF6D28D9), Color(0xFF8B5CF6)],
  ),
  EventData(
    city: 'Bandung',
    venue: 'Telkom University Convention Hall',
    date: 'Minggu, 26 Januari',
    tags: ['Career', 'Creator', 'Bazaar'],
    gradientColors: [Color(0xFF2E1065), Color(0xFFD946EF)],
  ),
  EventData(
    city: 'Yogyakarta',
    venue: 'Sportorium UMY',
    date: 'Minggu, 19 Januari',
    tags: ['Self Development', 'Speaker', 'Community'],
    gradientColors: [Color(0xFF1F1B2E), Color(0xFF6D28D9)],
  ),
];

// ── Cities ──────────────────────────────────────────────────────────
const List<CityData> mockCities = [
  CityData(name: 'Denpasar', status: 'Segera Hadir'),
  CityData(name: 'Malang', status: 'Segera Hadir'),
  CityData(name: 'Surabaya', status: 'Tersedia'),
  CityData(name: 'Semarang', status: 'Segera Hadir'),
  CityData(name: 'Yogyakarta', status: 'Tersedia'),
  CityData(name: 'Cirebon', status: 'Segera Hadir'),
  CityData(name: 'Bandung', status: 'Tersedia'),
  CityData(name: 'Jabodetabek', status: 'Segera Hadir'),
];

// ── Benefits ────────────────────────────────────────────────────────
const List<BenefitData> mockBenefits = [
  BenefitData(
    icon: Icons.lightbulb_outline_rounded,
    title: 'Insight yang relevan',
    description:
        'Belajar dari pembicara yang dekat dengan isu karier, pengembangan diri, dan kehidupan Gen-Z.',
  ),
  BenefitData(
    icon: Icons.people_outline_rounded,
    title: 'Networking baru',
    description:
        'Bertemu peserta lain yang punya semangat bertumbuh dan visi serupa.',
  ),
  BenefitData(
    icon: Icons.event_available_rounded,
    title: 'Event terasa rapi',
    description:
        'Detail jadwal, lokasi, benefit, tiket, dan pesanan disusun dalam alur yang mudah dipahami.',
  ),
  BenefitData(
    icon: Icons.storefront_outlined,
    title: 'Bazar & hiburan',
    description:
        'Nikmati suasana festival dengan bazar UMKM, hiburan, dan aktivitas pendukung.',
  ),
  BenefitData(
    icon: Icons.workspace_premium_outlined,
    title: 'Sertifikat digital',
    description:
        'Akses e-ticket dan e-certificate tanpa harus cari file tercecer.',
  ),
];

// ── How It Works ────────────────────────────────────────────────────
const List<HowItWorksStep> mockSteps = [
  HowItWorksStep(
    number: 1,
    title: 'Jelajahi Event',
    description:
        'Pilih event BIGFAIR berdasarkan kota, jadwal, dan minatmu.',
  ),
  HowItWorksStep(
    number: 2,
    title: 'Baca Detail',
    description:
        'Cek pembicara, venue, benefit, kapasitas, dan rundown secara ringkas.',
  ),
  HowItWorksStep(
    number: 3,
    title: 'Daftar & Simpan Tiket',
    description:
        'Registrasi lebih praktis dan simpan tiket dalam satu tempat.',
  ),
  HowItWorksStep(
    number: 4,
    title: 'Check-In',
    description:
        'Tunjukkan e-ticket saat hadir agar proses masuk lebih cepat.',
  ),
  HowItWorksStep(
    number: 5,
    title: 'Ambil Sertifikat',
    description: 'Akses e-certificate setelah rangkaian event selesai.',
  ),
];

// ── FAQ ─────────────────────────────────────────────────────────────
const List<FaqItem> mockFaqs = [
  FaqItem(
    question: 'Apa itu BIGFAIR?',
    answer:
        'BIGFAIR adalah festival edukasi dan pengembangan diri untuk generasi muda, berisi seminar, talkshow, networking, bazar, dan pengalaman event multi-kota.',
  ),
  FaqItem(
    question: 'Siapa yang cocok ikut BIGFAIR?',
    answer:
        'Mahasiswa, Gen-Z, young professional, dan siapa pun yang ingin upgrade skill, memperluas relasi, dan mendapatkan insight baru.',
  ),
  FaqItem(
    question: 'Apa saja benefit peserta?',
    answer:
        'Peserta bisa mendapatkan insight dari pembicara, e-ticket, e-certificate, akses informasi event, serta pengalaman festival yang rapi dan inspiratif.',
  ),
  FaqItem(
    question: 'Apakah tiket dan sertifikat tersedia digital?',
    answer:
        'Ya, landing page ini menampilkan arah produk BIGFAIR yang mendukung e-ticket dan e-certificate dalam aplikasi.',
  ),
  FaqItem(
    question: 'Apakah landing page ini sudah terhubung backend?',
    answer:
        'Untuk tahap ini belum. Ini adalah landing page statis yang siap dikembangkan ke integrasi event dan ticketing berikutnya.',
  ),
];
