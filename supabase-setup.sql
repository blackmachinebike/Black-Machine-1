-- ============================================================
--  Black Machine Bike Shop — Base de datos (Supabase)
--  Copia TODO este contenido y pégalo en:
--  Supabase > tu proyecto > SQL Editor > New query > Run
-- ============================================================

-- Tabla de notas (venta / apartado / taller)
create table if not exists public.notas (
  id        text primary key,
  folio     text,
  tipo      text,
  fecha     date,
  cliente   text,
  wa        text,
  domicilio text,
  pago      text,
  bici      text,
  rodado    text,
  detalles  text,
  diag      text,
  estado    text,
  items     jsonb default '[]'::jsonb,
  total     numeric default 0,
  anticipo  numeric default 0,
  saldo     numeric default 0,
  obs       text,
  creada    timestamptz default now()
);

-- Tabla de configuración de la tienda (WhatsApp / teléfono)
create table if not exists public.config (
  id        int primary key default 1,
  tel       text,
  whatsapp  text
);

-- Historial de clientes
create table if not exists public.clientes (
  id        text primary key,   -- WhatsApp (solo dígitos)
  nombre    text,
  whatsapp  text,
  domicilio text,
  creada    timestamptz default now()
);

-- Catálogo de productos (con foto)
create table if not exists public.productos (
  id        text primary key,
  nombre    text,
  precio    numeric default 0,
  categoria text,
  foto      text,            -- imagen comprimida (data URL), o URL de la foto
  creada    timestamptz default now()
);

-- Seguridad: solo usuarios con sesión iniciada pueden ver/editar
alter table public.notas     enable row level security;
alter table public.config    enable row level security;
alter table public.clientes  enable row level security;
alter table public.productos enable row level security;

drop policy if exists "acceso autenticado notas"     on public.notas;
drop policy if exists "acceso autenticado config"    on public.config;
drop policy if exists "acceso autenticado clientes"  on public.clientes;
drop policy if exists "acceso autenticado productos" on public.productos;

create policy "acceso autenticado notas"
  on public.notas for all to authenticated using (true) with check (true);
create policy "acceso autenticado config"
  on public.config for all to authenticated using (true) with check (true);
create policy "acceso autenticado clientes"
  on public.clientes for all to authenticated using (true) with check (true);
create policy "acceso autenticado productos"
  on public.productos for all to authenticated using (true) with check (true);

-- Sincronización en tiempo real entre dispositivos
alter publication supabase_realtime add table public.notas;
alter publication supabase_realtime add table public.clientes;
alter publication supabase_realtime add table public.productos;
