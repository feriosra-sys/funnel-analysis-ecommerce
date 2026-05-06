-- Funnel con conversiones y drop-off
-- Este análisis calcula cuántos usuarios pasan por cada etapa
-- y cuánto porcentaje se pierde entre una y otra.

WITH funnel AS (
    SELECT
        COUNT(DISTINCT CASE WHEN event_name = 'page_view' THEN user_id END) AS page_view,
        COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_id END) AS view_item,
        COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_id END) AS add_to_cart,
        COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_id END) AS begin_checkout,
        COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_id END) AS purchase
    FROM ecommerce_jan_2021
)

SELECT
    page_view,
    view_item,
    add_to_cart,
    begin_checkout,
    purchase,

    ROUND((view_item * 100.0 / NULLIF(page_view, 0)), 2) AS conversion_view_item_pct,
    ROUND((add_to_cart * 100.0 / NULLIF(view_item, 0)), 2) AS conversion_add_to_cart_pct,
    ROUND((begin_checkout * 100.0 / NULLIF(add_to_cart, 0)), 2) AS conversion_begin_checkout_pct,
    ROUND((purchase * 100.0 / NULLIF(begin_checkout, 0)), 2) AS conversion_purchase_pct,

    ROUND(((page_view - view_item) * 100.0 / NULLIF(page_view, 0)), 2) AS dropoff_page_view_pct,
    ROUND(((view_item - add_to_cart) * 100.0 / NULLIF(view_item, 0)), 2) AS dropoff_view_item_pct,
    ROUND(((add_to_cart - begin_checkout) * 100.0 / NULLIF(add_to_cart, 0)), 2) AS dropoff_add_to_cart_pct,
    ROUND(((begin_checkout - purchase) * 100.0 / NULLIF(begin_checkout, 0)), 2) AS dropoff_begin_checkout_pct
FROM funnel;
