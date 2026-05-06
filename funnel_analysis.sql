-- Análisis de Funnel de Conversión en E-commerce
-- Objetivo:
-- Identificar en qué etapa del proceso de compra se pierde mayor cantidad de usuarios.

WITH page_view_users AS (
    SELECT DISTINCT user_id
    FROM ecommerce_jan_2021
    WHERE event_name = 'page_view'
),
view_item_users AS (
    SELECT DISTINCT user_id
    FROM ecommerce_jan_2021
    WHERE event_name = 'view_item'
),
add_to_cart_users AS (
    SELECT DISTINCT user_id
    FROM ecommerce_jan_2021
    WHERE event_name = 'add_to_cart'
),
begin_checkout_users AS (
    SELECT DISTINCT user_id
    FROM ecommerce_jan_2021
    WHERE event_name = 'begin_checkout'
),
purchase_users AS (
    SELECT DISTINCT user_id
    FROM ecommerce_jan_2021
    WHERE event_name = 'purchase'
)

SELECT
    (SELECT COUNT(*) FROM page_view_users) AS page_view,
    (SELECT COUNT(*) FROM view_item_users) AS view_item,
    (SELECT COUNT(*) FROM add_to_cart_users) AS add_to_cart,
    (SELECT COUNT(*) FROM begin_checkout_users) AS begin_checkout,
    (SELECT COUNT(*) FROM purchase_users) AS purchase;
