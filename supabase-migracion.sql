-- ============================================================
--  ACTUALIZACIÓN — córrela UNA vez en tu proyecto existente
--  Supabase > SQL Editor > New query > pega esto > Run
--  Agrega: domicilio, rodado y detalles a las notas, y la
--  tabla de historial de clientes.
-- ============================================================

-- Nuevos campos en notas
alter table public.notas add column if not exists domicilio text;
alter table public.notas add column if not exists rodado    text;
alter table public.notas add column if not exists detalles  text;

-- Tabla de historial de clientes
create table if not exists public.clientes (
  id        text primary key,   -- WhatsApp (solo dígitos)
  nombre    text,
  whatsapp  text,
  domicilio text,
  creada    timestamptz default now()
);

alter table public.clientes enable row level security;
drop policy if exists "acceso autenticado clientes" on public.clientes;
create policy "acceso autenticado clientes"
  on public.clientes for all to authenticated using (true) with check (true);

-- Sincronización en tiempo real
alter publication supabase_realtime add table public.clientes;
