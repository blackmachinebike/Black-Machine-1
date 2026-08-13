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

## Notas técnicas

Aplicación de una sola página (HTML + CSS + JavaScript), sin dependencias externas.
Para respaldar los datos, usa "Exportar CSV" periódicamente.
