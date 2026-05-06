
# Análisis de Funnel de Conversión en E-commerce

## 📌 Objetivo
Analizar el comportamiento de los usuarios en el proceso de compra para identificar en qué etapa se pierde mayor conversión.

## 🛠 Herramientas
SQL | Google Sheets | Excel

## 📈 Funnel analizado
page_view → view_item → add_to_cart → begin_checkout → purchase

## 📊 Resultados principales

| Etapa | Usuarios | Drop-off |
|---|---:|---:|
| Page View | 1192 | — |
| View Item | 266 | 77% |
| Add to Cart | 46 | 82% |
| Begin Checkout | 30 | 34% |
| Purchase | 16 | 46% |

## 💡 Hallazgos clave
- La mayor pérdida de usuarios ocurre entre `view_item` y `add_to_cart`.
- Esto sugiere fricción en la etapa donde el usuario pasa de interés a intención de compra.
- Aunque algunos usuarios avanzan a checkout, pocos completan la compra final.

## 📈 Impacto potencial
Optimizar la etapa de `add_to_cart` podría reducir significativamente el abandono y aumentar la conversión total del funnel.

## ✅ Recomendaciones
- Mejorar la información del producto.
- Revisar UX/UI en la acción de agregar al carrito.
- Reducir fricción antes del checkout.
