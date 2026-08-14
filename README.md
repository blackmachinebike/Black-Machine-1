# Black Machine Bike Shop — Sistema de Notas

Plataforma para registrar **notas de venta**, **notas de apartado** y **notas de taller**
de la tienda de bicicletas y accesorios de ciclismo *Black Machine Bike Shop*.

## Cómo usarla

Abre el archivo `index.html` en cualquier navegador (doble clic). No requiere
instalación ni servidor. Los datos se guardan localmente en el navegador
(`localStorage`).

## Funciones

- **Panel:** totales de ventas, saldos de apartados, servicios de taller pendientes y últimas notas.
- **Nueva nota:** registra los tres tipos de nota con conceptos, cantidades y precios.
  - *Venta:* nota simple con conceptos y total.
  - *Apartado:* registra anticipo/abono y calcula el saldo pendiente. Permite abonar después.
  - *Taller:* datos de la bicicleta, diagnóstico del servicio y estado (en proceso / entregado).
- **Notas registradas:** búsqueda por cliente/folio/concepto, filtro por tipo, detalle imprimible y eliminación.
- **Exportar CSV:** descarga todas las notas en un archivo compatible con Excel.
- **Folios automáticos:** V0001 (venta), A0001 (apartado), T0001 (taller).

## Tienda en línea (e-commerce)

- **`tienda.html`** — catálogo público de la tienda **BMX**. Productos separados
  por **marca** (Cult, Demolition, Sunday, Kink, Summit, Odyssey, Éclat, Sando,
  Chepe) y por **categoría de producto** (bicis completas, cuadros, tijeras,
  manubrios, potencias, puños, pedales, bielas, sprocket/cadena, llantas,
  rines/masas, frenos, asiento/poste, pegas, accesorios), con doble filtro,
  buscador, ordenamiento y carrito. El pedido se envía por **WhatsApp**
  (`33 2589 9142`) con el detalle (marca + producto) y total; ahí se confirma
  disponibilidad, envío/recolección y forma de pago. El carrito se guarda en
  `localStorage`, no requiere servidor ni pasarela de pago.

  **Editar el catálogo:** cambia el arreglo `PRODUCTS` dentro del archivo. Cada
  producto tiene: `id`, `brand` (marca), `cat` (categoría, debe coincidir con un
  `id` de la lista `CATS`), `name`, `desc`, `price`, opcional `price_old` (para
  ofertas, muestra precio tachado), `tag` (`Nuevo`/`Top`/`Oferta`) y `stock`
  (`true`/`false`). Para agregar una marca o categoría nueva, añádela a las
  listas `BRANDS` o `CATS`. **Los precios son de referencia de mercado en MXN;
  ajústalos a tu inventario real.**

## Versiones

- **`index.html`** — versión local. Los datos se guardan solo en el navegador de
  cada dispositivo. Ideal para un solo equipo o para probar. Sin dependencias.
- **`app.html`** — versión en la nube (multi-dispositivo). Los datos se comparten
  entre todos los dispositivos, con acceso por contraseña y sincronización en
  tiempo real usando **Supabase**. Si no se configura, funciona igual que la local.

## Poner las notas en la nube (multi-dispositivo)

Sigue la guía **`SETUP.md`** (≈15 min, gratis). Resumen:
1. Crear proyecto en Supabase y correr `supabase-setup.sql`.
2. Crear tu usuario (correo + contraseña) en Authentication.
3. Pegar *Project URL* y *anon key* en `app.html` (constante `CFG`).
4. Publicar en el subdominio `notas.blackmachinebike.com` (el e-commerce en
   WordPress se queda en el dominio principal).

## Notas técnicas

Aplicación de una sola página (HTML + CSS + JavaScript). Para respaldar los datos
en modo local, usa "Exportar CSV" periódicamente.
