SELECT ku_user.id AS user_id, ku_user.name AS username, ku_user.email AS user_email, ku_user.phone AS user_phone_number, ku_order_detail.delivery_date AS delivery_date, ku_product.name AS delivery_product_name, group_concat(ku_product_category.category_id) AS product_category, ku_order_detail.quantity AS quantity, ku_user_location.address AS delivery_address
FROM ku_user
JOIN ku_user_location ON ku_user.id = ku_user_location.user_id
JOin ku_order_detail ON ku_user_location.id = ku_order_detail.user_location_id
JOIN ku_product ON ku_order_detail.product_id = ku_product.id
JOIN ku_product_category ON ku_product.id = ku_product_category.product_id
JOIN ku_order_detail ON ku_order_detail_status.id = ku_order_detail.status
WHERE MONTH(ku_order_detail.delivery_date) = 9 AND YEAR(ku_order_detail.delivery_date) = 2019 AND ku_order_detail_status.name = "success"
GROUP BY ku_order_detail.id
ORDER BY delivery_date, user_id;
