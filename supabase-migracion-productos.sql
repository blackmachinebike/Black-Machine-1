-- ============================================================
--  ACTUALIZACIÓN — córrela UNA vez en tu proyecto existente
--  Supabase > SQL Editor > New query > pega esto > Run
--  Agrega el catálogo de PRODUCTOS con foto.
--  (Si es un proyecto nuevo, con supabase-setup.sql basta.)
-- ============================================================

-- Catálogo de productos (con foto)
create table if not exists public.productos (
  id        text primary key,
  nombre    text,
  precio    numeric default 0,
  categoria text,
  foto      text,            -- imagen comprimida (data URL), o URL de la foto
  creada    timestamptz default now()
);

alter table public.productos enable row level security;
drop policy if exists "acceso autenticado productos" on public.productos;
create policy "acceso autenticado productos"
  on public.productos for all to authenticated using (true) with check (true);

-- Sincronización en tiempo real entre dispositivos
alter publication supabase_realtime add table public.productos;
