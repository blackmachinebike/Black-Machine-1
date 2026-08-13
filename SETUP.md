# Guía: poner las notas en la nube (multi-dispositivo)

Con esto la app deja de guardar en un solo navegador y pasa a **datos compartidos**:
registras una nota en el mostrador y al instante se ve en el celular, en casa o en
otro equipo. Incluye **acceso con contraseña** y **sincronización en tiempo real**.

Tiempo aproximado: **15 minutos**. Costo: **gratis** (plan free de Supabase).

---

## Paso 1 — Crear la base de datos (Supabase)

1. Entra a **https://supabase.com** → **Start your project** → crea cuenta (gratis).
2. **New project**: ponle nombre (ej. `black-machine`), define una contraseña de base de
   datos (guárdala) y elige la región más cercana. Espera ~2 min a que se cree.
3. En el menú izquierdo abre **SQL Editor** → **New query**.
4. Abre el archivo **`supabase-setup.sql`** de este repositorio, copia **todo** su
   contenido, pégalo y presiona **Run**. Debe decir *Success*.

## Paso 2 — Crear tu usuario de acceso

1. En el menú izquierdo: **Authentication** → **Users** → **Add user** → **Create new user**.
2. Escribe tu **correo** y una **contraseña**. Marca *Auto Confirm User* si aparece.
3. Ese correo y contraseña serán los que uses para **entrar a la app**.

## Paso 3 — Conectar la app con tu proyecto

1. En Supabase: **Project Settings** (engrane) → **API**.
2. Copia dos valores:
   - **Project URL** (ej. `https://xxxxxxxx.supabase.co`)
   - **anon public** (una clave larga; es segura para usarse en el navegador)
3. Abre el archivo **`app.html`** y, hasta arriba del `<script>`, pégalos aquí:

   ```js
   const CFG={
     url:'https://xxxxxxxx.supabase.co',   // tu Project URL
     key:'eyJhbGciOi...'                    // tu clave anon public
   };
   ```

4. Guarda. Con esos datos, la app entra en **modo nube** automáticamente
   (si los dejas vacíos, sigue funcionando en modo local en un solo equipo).

## Paso 4 — Publicar en tu dominio

Recomendado: un **subdominio** `notas.blackmachinebike.com` (tu tienda WordPress
se queda en el dominio principal).

**Opción fácil (gratis): Netlify**
1. Entra a **https://netlify.com** → crea cuenta.
2. **Add new site** → **Deploy manually** → arrastra el archivo `app.html`
   (renómbralo antes a `index.html`).
3. Netlify te da una dirección tipo `algo.netlify.app` para probar.
4. Para usar tu subdominio: en Netlify **Domain settings** → **Add custom domain**
   → escribe `notas.blackmachinebike.com`. Netlify te dirá qué registro **CNAME**
   agregar; ese registro lo pones en el panel de tu dominio (donde compraste
   blackmachinebike.com). En ~15–30 min queda activo con candado (HTTPS).

> Tu **e-commerce** sigue en `blackmachinebike.com` (WordPress) y las **notas** en
> `notas.blackmachinebike.com`. No se estorban.

---

## Cómo se usa una vez en la nube
- Entras a `notas.blackmachinebike.com`, inicias sesión con tu correo y contraseña.
- Todas las notas se guardan en la nube y se ven igual en cualquier dispositivo.
- Botón **Salir** para cerrar sesión.
- El botón **⚙ Tienda** (WhatsApp/teléfono) también se guarda en la nube.

## Preguntas frecuentes
- **¿Se pierden los datos si cambio de celular?** No, viven en la nube.
- **¿Puedo agregar empleados después?** Sí: crea más usuarios en *Authentication*.
  (Si quieres registrar *quién* hizo cada nota, se agrega en una fase siguiente.)
- **¿Y lo que ya registré en modo local?** Se puede exportar a CSV desde la app
  para conservarlo.
