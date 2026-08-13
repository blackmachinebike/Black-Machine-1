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
