-- ============================================================
--  ACTUALIZACIÓN 3 — córrela UNA vez en tu proyecto
--  Supabase > SQL Editor > New query > pega esto > Run
--  Agrega: historial de abonos (con fecha) a las notas y el
--  enlace de reseñas de Google a la configuración de la tienda.
-- ============================================================

-- Historial de abonos por nota: [{"fecha":"2026-09-15","monto":500}, ...]
alter table public.notas  add column if not exists abonos jsonb default '[]'::jsonb;

-- Enlace de reseñas de Google (se muestra en el pie de las notas)
alter table public.config add column if not exists google text;
