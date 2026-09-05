-- ============================================================
--  ACTUALIZACIÓN 2 — córrela UNA vez en tu proyecto
--  Supabase > SQL Editor > New query > pega esto > Run
--  Agrega: descuentos, subtotal y papelera (borrada) a las notas.
-- ============================================================

alter table public.notas add column if not exists subtotal  numeric default 0;
alter table public.notas add column if not exists descuento numeric default 0;
alter table public.notas add column if not exists borrada   boolean default false;
