-- ====================================================================
-- 03_tambah_delete_policy.sql
-- Izinkan publik (anon key) menghapus & mengedit data presensi
-- dari rekap page. Copy-paste ke Supabase Dashboard > SQL Editor.
-- ====================================================================

-- HAPUS: untuk tombol 🗑 Hapus di modal
CREATE POLICY "presensi_guru_delete_publik"
  ON public.presensi_guru FOR DELETE
  USING (true);

-- EDIT: untuk tombol ✎ Edit di modal (PATCH created_at)
CREATE POLICY "presensi_guru_update_publik"
  ON public.presensi_guru FOR UPDATE
  USING (true);
