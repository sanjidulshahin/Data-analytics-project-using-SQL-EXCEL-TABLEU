SELECT 
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS CUSTOMER,
    cus.city,
    cus.state,
    ord.order_date,
	SUM(ite.quantity) AS total_units,
	SUM(ite.quantity * ite.list_price) AS Revenue,
	pro.product_name,
	cat.category_name,
	br.brand_name,
	st.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) AS sales_rep
FROM sales.orders AS ord
JOIN sales.customers AS cus
    ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
	ON ord.order_id = ite.order_id
JOIN production.products pro
	ON pro.product_id = ite.product_id
JOIN production.categories cat
	ON cat.category_id = pro.category_id
JOIN production.brands br
	ON br.brand_id = pro.brand_id
JOIN sales.stores st
	ON st.store_id = ord.store_id
JOIN sales.staffs sta
	ON sta.staff_id = ord.staff_id
GROUP BY
	ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name),
    cus.city,
    cus.state,
    ord.order_date,
	pro.product_name,
	cat.category_name,
	br.brand_name,
	st.store_name,
	CONCAT(sta.first_name,' ',sta.last_name)
	
	
