-- ====================================================================
-- 03_tambah_delete_policy.sql
-- Biarkan publik (anon key) menghapus data presensi dari rekap page
-- Copy-paste ke Supabase Dashboard > SQL Editor > RUN
-- ====================================================================

create policy "presensi_guru_delete_publik"
  on public.presensi_guru for delete
  using (true);

-- ====================================================================
-- SELESAI.
-- ====================================================================
