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
  tel       text,
  wa        text,
  pago      text,
  bici      text,
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

-- Seguridad: solo usuarios con sesión iniciada pueden ver/editar
alter table public.notas  enable row level security;
alter table public.config enable row level security;

drop policy if exists "acceso autenticado notas"  on public.notas;
drop policy if exists "acceso autenticado config" on public.config;

create policy "acceso autenticado notas"
  on public.notas for all
  to authenticated
  using (true) with check (true);

create policy "acceso autenticado config"
  on public.config for all
  to authenticated
  using (true) with check (true);

-- Sincronización en tiempo real entre dispositivos
alter publication supabase_realtime add table public.notas;
