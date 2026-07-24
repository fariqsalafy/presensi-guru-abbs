-- 02_tambah_unik_constraint.sql
-- Menambahkan kolom tgl + unique constraint agar 1 guru hanya absen 1x/hari

ALTER TABLE public.presensi_guru
    ADD COLUMN IF NOT EXISTS tgl DATE DEFAULT CURRENT_DATE;

UPDATE public.presensi_guru SET tgl = created_at::date WHERE tgl IS NULL;

ALTER TABLE public.presensi_guru ALTER COLUMN tgl SET NOT NULL;

ALTER TABLE public.presensi_guru
    ADD CONSTRAINT uq_presensi_guru_teacher_date
    UNIQUE (teacher_name, tgl);

CREATE INDEX IF NOT EXISTS idx_presensi_tgl
    ON public.presensi_guru (tgl);
