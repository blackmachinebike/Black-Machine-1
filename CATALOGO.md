# Administrar el catálogo con Google Sheets

La tienda puede leer los productos desde una hoja de cálculo de Google. Editas
precios, stock, nombres o etiquetas en la hoja y **el sitio se actualiza solo al
recargar** — sin tocar código ni volver a publicar.

## Puesta en marcha (una sola vez, ~10 min)

1. **Crea la hoja.** Entra a [sheets.new](https://sheets.new). En la primera fila
   pon exactamente estas columnas (el orden puede variar, los nombres no):

   `id · marca · categoria · nombre · descripcion · precio · precio_anterior · etiqueta · stock · foto`

   Para no empezar de cero, **importa el archivo `plantilla-catalogo.csv`** de este
   repo: en Google Sheets → *Archivo → Importar → Subir → plantilla-catalogo.csv →
   Reemplazar hoja*. Ya trae los 56 productos actuales.

2. **Publica la hoja como CSV.** *Archivo → Compartir → Publicar en la web →*
   pestaña **CSV** → **Publicar**. Copia la URL (termina en `output=csv`).

3. **Conéctala al sitio.** En `tienda.html`, dentro de `CFG`, pega la URL:

   ```js
   sheetCsvUrl:'https://docs.google.com/spreadsheets/d/e/XXXX/pub?output=csv'
   ```

   Publica el cambio una vez. A partir de ahí, todo se administra desde la hoja.

## Qué significa cada columna

| Columna | Qué va | Ejemplo |
|---|---|---|
| `id` | Identificador único (sin espacios). También es el nombre del archivo de la foto. | `p001` |
| `marca` | Marca. Las marcas del filtro se generan solas con lo que pongas aquí. | `Cult` |
| `categoria` | Categoría (ver lista abajo). | `cuadros` |
| `nombre` | Nombre del producto. | `Cuadro Cult Shorty 20.75"` |
| `descripcion` | Descripción corta. | `100% cromoly, cabezal integrado.` |
| `precio` | Solo número. | `6900` |
| `precio_anterior` | (Opcional) precio tachado para ofertas. | `7500` |
| `etiqueta` | (Opcional) `Nuevo`, `Top` u `Oferta`. | `Top` |
| `stock` | `si` = disponible, `no` = agotado. Vacío = disponible. | `si` |
| `foto` | (Opcional) URL de imagen. Si se deja vacío, usa `assets/productos/<id>.jpg`. | |

**Categorías válidas** (usa el valor de la izquierda en la columna `categoria`):
`completas` · `cuadros` · `tijeras` · `manubrios` · `potencias` · `punos` ·
`pedales` · `bielas` · `transmision` · `llantas` · `rines` · `frenos` ·
`asiento` · `pegas` · `accesorios`. Si escribes una categoría nueva, aparece
igual como filtro (con ese nombre).

## Fotos de producto (automático por nombre)

Deja la foto de cada producto en `assets/productos/` con el **mismo `id`** y
extensión `.jpg`:

- `assets/productos/p001.jpg`, `assets/productos/p010.jpg`, …

La tarjeta la toma sola. Si no existe, muestra el ícono de la categoría. Formato
recomendado: cuadrada (1:1), mínimo 600×600 px. (Alternativa: pon la URL de la
imagen en la columna `foto`.)

## Notas

- Mientras `sheetCsvUrl` esté vacío, la tienda usa el catálogo de respaldo que
  viene dentro de `tienda.html`.
- La vista previa de Claude bloquea conexiones externas, por eso ahí no se carga
  la hoja; en tu dominio/Netlify sí funciona.
