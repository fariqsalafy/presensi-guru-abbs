-- ====================================================================
-- 01_buat_tabel_presensi.sql
-- TABLE BARU untuk Presensi Guru — project smpabbs/monday-saving-form
-- Jangan ganggu tabel lain!
-- Copy-paste ke Supabase Dashboard > SQL Editor > RUN
-- ====================================================================

-- Buat tabel presensi guru
create table public.presensi_guru (
  id            uuid primary key default gen_random_uuid(),
  teacher_name  text not null,                -- nama guru yg presensi
  photo_data    text not null,                -- foto (base64 compressed JPG)
  latitude      double precision not null,    -- lokasi presensi
  longitude     double precision not null,
  location_accuracy double precision,         -- akurasi GPS (meter)
  created_at    timestamptz not null default now()
);

-- Index biar cepet filtering
create index idx_presensi_guru_teacher on public.presensi_guru (teacher_name);
create index idx_presensi_guru_created on public.presensi_guru (created_at desc);

-- Aktifkan RLS
alter table public.presensi_guru enable row level security;

-- Izinkan publik INSERT (via form presensi)
create policy "presensi_guru_insert_publik"
  on public.presensi_guru for insert
  with check (true);

-- Izinkan publik SELECT (via recap/admin)
create policy "presensi_guru_select_publik"
  on public.presensi_guru for select
  using (true);

-- ====================================================================
-- SELESAI. Setelah ini deploy presensi.html ke Vercel.
-- ====================================================================
