-- ========================================
-- BALANCED TREE CLOTHING CO. SQL QUERIES
-- ========================================

-- ========================================
-- HIGH LEVEL SALES ANALYSIS
-- ========================================

-- Q1: What was the total quantity sold for all products?
SELECT SUM(qty) AS total_quantity_sold
FROM balanced_tree.sales;

-- Q2: What is the total generated revenue for all products before discounts?
SELECT SUM(price * qty) AS total_revenue_before_discount
FROM balanced_tree.sales;

-- Q3: What was the total discount amount for all products?
SELECT SUM(price * qty * discount/100) AS total_discount_amount
FROM balanced_tree.sales;

-- ========================================
-- TRANSACTION ANALYSIS
-- ========================================

-- Q1: How many unique transactions were there?
SELECT COUNT(DISTINCT txn_id) AS unique_transactions
FROM balanced_tree.sales;

-- Q2: What is the average unique products purchased in each transaction?
SELECT ROUND(AVG(product_count), 2) AS avg_unique_products_per_transaction
FROM (
    SELECT txn_id, COUNT(DISTINCT prod_id) AS product_count
    FROM balanced_tree.sales
    GROUP BY txn_id
) AS transaction_products;

-- Q3: What are the 25th, 50th and 75th percentile values for the revenue per transaction?
WITH transaction_revenue AS (
    SELECT 
        txn_id,
        SUM(price * qty * (1 - discount/100.0)) AS net_revenue
    FROM balanced_tree.sales
    GROUP BY txn_id
)
SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY net_revenue) AS percentile_25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY net_revenue) AS percentile_50,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY net_revenue) AS percentile_75
FROM transaction_revenue;

-- Q4: What is the average discount value per transaction?
WITH transaction_discounts AS (
    SELECT 
        txn_id,
        SUM(price * qty * discount/100.0) AS transaction_discount
    FROM balanced_tree.sales
    GROUP BY txn_id
)
SELECT ROUND(AVG(transaction_discount), 2) AS avg_discount_per_transaction
FROM transaction_discounts;

-- Q5: What is the percentage split of all transactions for members vs non-members?
WITH member_split AS (
    SELECT 
        member,
        COUNT(DISTINCT txn_id) AS transaction_count
    FROM balanced_tree.sales
    GROUP BY member
)
SELECT 
    member,
    transaction_count,
    ROUND(100.0 * transaction_count / SUM(transaction_count) OVER(), 2) AS percentage
FROM member_split;

-- Q6: What is the average revenue for member transactions and non-member transactions?
WITH transaction_revenue AS (
    SELECT 
        txn_id,
        member,
        SUM(price * qty * (1 - discount/100.0)) AS net_revenue
    FROM balanced_tree.sales
    GROUP BY txn_id, member
)
SELECT 
    member,
    ROUND(AVG(net_revenue), 2) AS avg_revenue_per_transaction
FROM transaction_revenue
GROUP BY member;

-- ========================================
-- PRODUCT ANALYSIS
-- ========================================

-- Q1: What are the top 3 products by total revenue before discount?
SELECT 
    s.prod_id,
    p.product_name,
    SUM(s.price * s.qty) AS total_revenue_before_discount
FROM balanced_tree.sales s
JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY s.prod_id, p.product_name
ORDER BY total_revenue_before_discount DESC
LIMIT 3;

-- Q2: What is the total quantity, revenue and discount for each segment?
SELECT 
    p.segment_name,
    SUM(s.qty) AS total_quantity,
    SUM(s.price * s.qty) AS total_revenue_before_discount,
    SUM(s.price * s.qty * s.discount/100.0) AS total_discount
FROM balanced_tree.sales s
JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY p.segment_name
ORDER BY total_revenue_before_discount DESC;

-- Q3: What is the top selling product for each segment?
WITH segment_product_sales AS (
    SELECT 
        p.segment_name,
        p.product_name,
        SUM(s.qty) AS total_quantity,
        ROW_NUMBER() OVER (PARTITION BY p.segment_name ORDER BY SUM(s.qty) DESC) AS rank
    FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
    GROUP BY p.segment_name, p.product_name
)
SELECT 
    segment_name,
    product_name,
    total_quantity
FROM segment_product_sales
WHERE rank = 1;

-- Q4: What is the total quantity, revenue and discount for each category?
SELECT 
    p.category_name,
    SUM(s.qty) AS total_quantity,
    SUM(s.price * s.qty) AS total_revenue_before_discount,
    SUM(s.price * s.qty * s.discount/100.0) AS total_discount
FROM balanced_tree.sales s
JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY p.category_name
ORDER BY total_revenue_before_discount DESC;

-- Q5: What is the top selling product for each category?
WITH category_product_sales AS (
    SELECT 
        p.category_name,
        p.product_name,
        SUM(s.qty) AS total_quantity,
        ROW_NUMBER() OVER (PARTITION BY p.category_name ORDER BY SUM(s.qty) DESC) AS rank
    FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
    GROUP BY p.category_name, p.product_name
)
SELECT 
    category_name,
    product_name,
    total_quantity
FROM category_product_sales
WHERE rank = 1;

-- Q6: What is the percentage split of revenue by product for each segment?
WITH segment_revenue AS (
    SELECT 
        p.segment_name,
        p.product_name,
        SUM(s.price * s.qty) AS product_revenue
    FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
    GROUP BY p.segment_name, p.product_name
),
segment_totals AS (
    SELECT 
        segment_name,
        SUM(product_revenue) AS segment_total_revenue
    FROM segment_revenue
    GROUP BY segment_name
)
SELECT 
    sr.segment_name,
    sr.product_name,
    sr.product_revenue,
    ROUND(100.0 * sr.product_revenue / st.segment_total_revenue, 2) AS revenue_percentage
FROM segment_revenue sr
JOIN segment_totals st ON sr.segment_name = st.segment_name
ORDER BY sr.segment_name, revenue_percentage DESC;

-- Q7: What is the percentage split of revenue by segment for each category?
WITH category_segment_revenue AS (
    SELECT 
        p.category_name,
        p.segment_name,
        SUM(s.price * s.qty) AS segment_revenue
    FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
    GROUP BY p.category_name, p.segment_name
),
category_totals AS (
    SELECT 
        category_name,
        SUM(segment_revenue) AS category_total_revenue
    FROM category_segment_revenue
    GROUP BY category_name
)
SELECT 
    csr.category_name,
    csr.segment_name,
    csr.segment_revenue,
    ROUND(100.0 * csr.segment_revenue / ct.category_total_revenue, 2) AS revenue_percentage
FROM category_segment_revenue csr
JOIN category_totals ct ON csr.category_name = ct.category_name
ORDER BY csr.category_name, revenue_percentage DESC;

-- Q8: What is the percentage split of total revenue by category?
WITH category_revenue AS (
    SELECT 
        p.category_name,
        SUM(s.price * s.qty) AS category_revenue
    FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
    GROUP BY p.category_name
),
total_revenue AS (
    SELECT SUM(category_revenue) AS total_revenue
    FROM category_revenue
)
SELECT 
    cr.category_name,
    cr.category_revenue,
    ROUND(100.0 * cr.category_revenue / tr.total_revenue, 2) AS revenue_percentage
FROM category_revenue cr
CROSS JOIN total_revenue tr
ORDER BY revenue_percentage DESC;

-- Q9: What is the total transaction "penetration" for each product?
WITH product_transactions AS (
    SELECT 
        s.prod_id,
        p.product_name,
        COUNT(DISTINCT s.txn_id) AS product_transactions
    FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
    GROUP BY s.prod_id, p.product_name
),
total_transactions AS (
    SELECT COUNT(DISTINCT txn_id) AS total_transactions
    FROM balanced_tree.sales
)
SELECT 
    pt.prod_id,
    pt.product_name,
    pt.product_transactions,
    tt.total_transactions,
    ROUND(100.0 * pt.product_transactions / tt.total_transactions, 2) AS penetration_percentage
FROM product_transactions pt
CROSS JOIN total_transactions tt
ORDER BY penetration_percentage DESC;

-- Q10: What is the most common combination of at least 1 quantity of any 3 products in a single transaction?
WITH transaction_products AS (
    SELECT 
        txn_id,
        prod_id
    FROM balanced_tree.sales
    WHERE qty >= 1
),
product_combinations AS (
    SELECT 
        t1.txn_id,
        t1.prod_id AS product_1,
        t2.prod_id AS product_2,
        t3.prod_id AS product_3
    FROM transaction_products t1
    JOIN transaction_products t2 ON t1.txn_id = t2.txn_id AND t1.prod_id < t2.prod_id
    JOIN transaction_products t3 ON t2.txn_id = t3.txn_id AND t2.prod_id < t3.prod_id
)
SELECT 
    product_1,
    product_2,
    product_3,
    COUNT(*) AS combination_count
FROM product_combinations
GROUP BY product_1, product_2, product_3
ORDER BY combination_count DESC
LIMIT 1;

-- ========================================
-- BONUS: REPORTING CHALLENGE (DIDN'T USE THAT ONE IT'S JUST A BONUS THAT'S AVAIABLE TO USE)
-- ========================================

-- Monthly Report Template (January 2021)
-- This can be easily modified for any month by changing the date filter

SELECT 'JANUARY 2021 SALES REPORT' AS report_title;

-- Monthly Sales Summary
SELECT 
    'Monthly Sales Summary' AS metric_category,
    SUM(qty) AS total_quantity_sold,
    SUM(price * qty) AS total_revenue_before_discount,
    SUM(price * qty * (1 - discount/100.0)) AS total_net_revenue,
    SUM(price * qty * discount/100.0) AS total_discount_amount,
    COUNT(DISTINCT txn_id) AS total_transactions
FROM balanced_tree.sales
WHERE DATE_TRUNC('month', start_txn_time) = '2021-01-01';

-- Top Products by Revenue (January 2021)
SELECT 
    'Top 5 Products by Revenue' AS metric_category,
    s.prod_id,
    p.product_name,
    SUM(s.price * s.qty) AS total_revenue,
    RANK() OVER (ORDER BY SUM(s.price * s.qty) DESC) AS revenue_rank
FROM balanced_tree.sales s
JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
WHERE DATE_TRUNC('month', s.start_txn_time) = '2021-01-01'
GROUP BY s.prod_id, p.product_name
ORDER BY total_revenue DESC

LIMIT 5;
