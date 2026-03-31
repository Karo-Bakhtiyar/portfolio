---

**Query #1**

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

| prod_id | product_name                 | total_revenue_before_discount |
| ------- | ---------------------------- | ----------------------------- |
| 2a2353  | Blue Polo Shirt - Mens       | 217683                        |
| 9ec847  | Grey Fashion Jacket - Womens | 209304                        |
| 5d267b  | White Tee Shirt - Mens       | 152000                        |

---
**Query #2**

    
    
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

| segment_name | total_quantity | total_revenue_before_discount | total_discount             |
| ------------ | -------------- | ----------------------------- | -------------------------- |
| Shirt        | 11265          | 406143                        | 49594.27000000000000000000 |
| Jacket       | 11385          | 366983                        | 44277.46000000000000000000 |
| Socks        | 11217          | 307977                        | 37013.44000000000000000000 |
| Jeans        | 11349          | 208350                        | 25343.97000000000000000000 |

---
**Query #3**

    
    
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

| segment_name | product_name                  | total_quantity |
| ------------ | ----------------------------- | -------------- |
| Jacket       | Grey Fashion Jacket - Womens  | 3876           |
| Jeans        | Navy Oversized Jeans - Womens | 3856           |
| Shirt        | Blue Polo Shirt - Mens        | 3819           |
| Socks        | Navy Solid Socks - Mens       | 3792           |

---
**Query #4**

    
    
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

| category_name | total_quantity | total_revenue_before_discount | total_discount             |
| ------------- | -------------- | ----------------------------- | -------------------------- |
| Mens          | 22482          | 714120                        | 86607.71000000000000000000 |
| Womens        | 22734          | 575333                        | 69621.43000000000000000000 |

---
**Query #5**

    
    
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

| category_name | product_name                 | total_quantity |
| ------------- | ---------------------------- | -------------- |
| Mens          | Blue Polo Shirt - Mens       | 3819           |
| Womens        | Grey Fashion Jacket - Womens | 3876           |

---
**Query #6**

    
    
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

| segment_name | product_name                     | product_revenue | revenue_percentage |
| ------------ | -------------------------------- | --------------- | ------------------ |
| Jacket       | Grey Fashion Jacket - Womens     | 209304          | 57.03              |
| Jacket       | Khaki Suit Jacket - Womens       | 86296           | 23.51              |
| Jacket       | Indigo Rain Jacket - Womens      | 71383           | 19.45              |
| Jeans        | Black Straight Jeans - Womens    | 121152          | 58.15              |
| Jeans        | Navy Oversized Jeans - Womens    | 50128           | 24.06              |
| Jeans        | Cream Relaxed Jeans - Womens     | 37070           | 17.79              |
| Shirt        | Blue Polo Shirt - Mens           | 217683          | 53.60              |
| Shirt        | White Tee Shirt - Mens           | 152000          | 37.43              |
| Shirt        | Teal Button Up Shirt - Mens      | 36460           | 8.98               |
| Socks        | Navy Solid Socks - Mens          | 136512          | 44.33              |
| Socks        | Pink Fluro Polkadot Socks - Mens | 109330          | 35.50              |
| Socks        | White Striped Socks - Mens       | 62135           | 20.18              |

---
**Query #7**

    
    
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

| category_name | segment_name | segment_revenue | revenue_percentage |
| ------------- | ------------ | --------------- | ------------------ |
| Mens          | Shirt        | 406143          | 56.87              |
| Mens          | Socks        | 307977          | 43.13              |
| Womens        | Jacket       | 366983          | 63.79              |
| Womens        | Jeans        | 208350          | 36.21              |

---
**Query #8**

    
    
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

| category_name | category_revenue | revenue_percentage |
| ------------- | ---------------- | ------------------ |
| Mens          | 714120           | 55.38              |
| Womens        | 575333           | 44.62              |

---
**Query #9**

    
    
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

| prod_id | product_name                     | product_transactions | total_transactions | penetration_percentage |
| ------- | -------------------------------- | -------------------- | ------------------ | ---------------------- |
| f084eb  | Navy Solid Socks - Mens          | 1281                 | 2500               | 51.24                  |
| 9ec847  | Grey Fashion Jacket - Womens     | 1275                 | 2500               | 51.00                  |
| c4a632  | Navy Oversized Jeans - Womens    | 1274                 | 2500               | 50.96                  |
| 2a2353  | Blue Polo Shirt - Mens           | 1268                 | 2500               | 50.72                  |
| 5d267b  | White Tee Shirt - Mens           | 1268                 | 2500               | 50.72                  |
| 2feb6b  | Pink Fluro Polkadot Socks - Mens | 1258                 | 2500               | 50.32                  |
| 72f5d4  | Indigo Rain Jacket - Womens      | 1250                 | 2500               | 50.00                  |
| d5e9a6  | Khaki Suit Jacket - Womens       | 1247                 | 2500               | 49.88                  |
| e83aa3  | Black Straight Jeans - Womens    | 1246                 | 2500               | 49.84                  |
| e31d39  | Cream Relaxed Jeans - Womens     | 1243                 | 2500               | 49.72                  |
| b9a74d  | White Striped Socks - Mens       | 1243                 | 2500               | 49.72                  |
| c8d436  | Teal Button Up Shirt - Mens      | 1242                 | 2500               | 49.68                  |

---
**Query #10**

    
    
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

| product_1 | product_2 | product_3 | combination_count |
| --------- | --------- | --------- | ----------------- |
| 5d267b    | 9ec847    | c8d436    | 352               |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/dkhULDEjGib3K58MvDjYJr/8)