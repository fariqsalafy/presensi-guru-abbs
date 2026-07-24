# CHANGELOG — Presensi Guru ABBS

Semua perubahan signifikan pada proyek ini dicatat di sini.

## [1.1.0] — 2026-07-24

### Added
- **Export Excel** — tombol ⎙ Export Excel di halaman rekap, memakai SheetJS
  Layout: dark bg, nama bold, ontime hijau, telat kuning, ToT gold, Total Hadir hijau, freeze pane
- **Edit Presensi (inline)** — tombol ✎ Edit di modal foto, bisa ganti jam (HH:mm)
  Setelah save modal nutup & tabel reload otomatis (via PATCH Supabase REST)
- **Hapus Presensi** — tombol 🗑 Hapus di modal, konfirmasi dulu, DELETE via Supabase REST
- **RLS Policy** — file `03_tambah_delete_policy.sql` (sekarang include UPDATE juga)
- **CHANGELOG.md** — file ini

### Fixed
- Modal tombol dirapikan jadi `.modal-actions` flex, border-top pemisah
- Duplikasi fungsi `deleteRecord()` dihapus

### Notes
- Fitur Edit & Hapus **membutuhkan RLS policy** UPDATE dan DELETE.
  Jalankan `03_tambah_delete_policy.sql` di Supabase Dashboard > SQL Editor.

### Guru di TEACHERS
- **Baru:** Arif Hidayat, Muhammad Jauhari Ahmad, Arfian Moneter Pratama, Luthfa Usaidah, Ms Zahro
- **Hilang:** Ramadanti Prativi, Farida Nur Hidayati, Daffa Danendra Rizqi Nugraha, Ahmad Bayu Abdullah, Syahrul Abdi Narotama, Muhammad Syarif Hidayatullah
- **Total:** 39 guru (sebelumnya 38)

## [1.0.0] — 2026-07-24 (perkiraan)

### Added
- Halaman `presensi.html` — form presensi dengan foto, lokasi, status ontime/late
- Halaman `rekap.html` — tabel rekap presensi dengan filter tanggal
  - Modal detail (nama, foto, jam, koordinat)
  - Hitungan ToT dan Total Hadir
  - Password gate (abidin2026)
  - Warna status: ontime=hijau, late=kuning
- Supabase backend: tabel `presensi_guru` + RLS insert/select
- `vercel.json` — routing static HTML
