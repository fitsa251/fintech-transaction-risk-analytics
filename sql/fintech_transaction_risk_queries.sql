-- FinTech Customer Transaction & Risk Analytics
-- SQL Analysis Queries
-- Purpose: Analyze transaction volume, fee revenue, failed payments,
-- customer segments, payment channels, merchant categories, and risk indicators.

-- NOTE:
-- Expected tables:
-- 1. fintech_transactions
-- 2. customer_profiles


-- 1. Preview transaction data
SELECT *
FROM fintech_transactions
LIMIT 20;


-- 2. Preview customer profile data
SELECT *
FROM customer_profiles
LIMIT 20;


-- 3. Executive KPI summary
SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Completed' THEN 1 ELSE 0 END) AS completed_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Completed' THEN transaction_amount ELSE 0 END),
        2
    ) AS completed_transaction_volume,
    ROUND(SUM(fee_amount), 2) AS total_fee_revenue,
    ROUND(
        AVG(CASE WHEN transaction_status = 'Completed' THEN transaction_amount END),
        2
    ) AS average_completed_transaction_value,
    SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_transactions
FROM fintech_transactions;


-- 4. Monthly transaction and revenue trend
SELECT
    SUBSTR(transaction_date, 1, 7) AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Completed' THEN 1 ELSE 0 END) AS completed_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_volume,
    ROUND(SUM(fee_amount), 2) AS total_fee_revenue
FROM fintech_transactions
GROUP BY SUBSTR(transaction_date, 1, 7)
ORDER BY transaction_month;


-- 5. Payment channel performance
SELECT
    payment_channel,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Completed' THEN 1 ELSE 0 END) AS completed_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY payment_channel
ORDER BY failure_rate_pct DESC;


-- 6. Payment method performance
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY payment_method
ORDER BY fee_revenue DESC;


-- 7. Merchant category performance
SELECT
    merchant_category,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY merchant_category
ORDER BY transaction_volume DESC;


-- 8. Customer segment performance
SELECT
    customer_segment,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(AVG(transaction_amount), 2) AS avg_transaction_amount,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY customer_segment
ORDER BY transaction_volume DESC;


-- 9. Risk flag summary
SELECT
    risk_flag,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(AVG(transaction_amount), 2) AS avg_transaction_amount,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY risk_flag
ORDER BY avg_risk_score DESC;


-- 10. Failed transaction reasons
SELECT
    failure_reason,
    COUNT(*) AS failed_transactions,
    ROUND(AVG(transaction_amount), 2) AS avg_transaction_amount,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
WHERE transaction_status = 'Failed'
GROUP BY failure_reason
ORDER BY failed_transactions DESC;


-- 11. Top states by transaction volume
SELECT
    state,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct
FROM fintech_transactions
GROUP BY state
ORDER BY transaction_volume DESC;


-- 12. High-risk transaction review queue
SELECT
    transaction_id,
    transaction_date,
    customer_id,
    state,
    customer_segment,
    risk_tier,
    merchant_category,
    payment_channel,
    payment_method,
    transaction_amount,
    transaction_status,
    failure_reason,
    risk_score,
    risk_flag
FROM fintech_transactions
WHERE risk_flag = 'High Risk'
ORDER BY risk_score DESC, transaction_amount DESC
LIMIT 50;


-- 13. Customers with highest transaction volume
SELECT
    customer_id,
    customer_segment,
    state,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    SUM(CASE WHEN risk_flag = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_transactions,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY customer_id, customer_segment, state
ORDER BY transaction_volume DESC
LIMIT 25;


-- 14. Customers with high failure rates
SELECT
    customer_id,
    customer_segment,
    state,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY customer_id, customer_segment, state
HAVING COUNT(*) >= 5
ORDER BY failure_rate_pct DESC, total_transactions DESC
LIMIT 25;


-- 15. Customer profile summary
SELECT
    customer_segment,
    risk_tier,
    COUNT(*) AS customer_count
FROM customer_profiles
GROUP BY customer_segment, risk_tier
ORDER BY customer_segment, risk_tier;


-- 16. Join customer profiles with transaction activity
SELECT
    c.customer_id,
    c.signup_date,
    c.state,
    c.age_group,
    c.customer_segment,
    c.risk_tier,
    COUNT(t.transaction_id) AS total_transactions,
    ROUND(SUM(t.transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(t.fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN t.transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    SUM(CASE WHEN t.risk_flag = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_transactions,
    ROUND(AVG(t.risk_score), 2) AS avg_risk_score
FROM customer_profiles c
LEFT JOIN fintech_transactions t
    ON c.customer_id = t.customer_id
GROUP BY
    c.customer_id,
    c.signup_date,
    c.state,
    c.age_group,
    c.customer_segment,
    c.risk_tier
ORDER BY transaction_volume DESC
LIMIT 25;


-- 17. Monthly revenue by customer segment
SELECT
    SUBSTR(transaction_date, 1, 7) AS transaction_month,
    customer_segment,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    COUNT(*) AS total_transactions
FROM fintech_transactions
GROUP BY SUBSTR(transaction_date, 1, 7), customer_segment
ORDER BY transaction_month, fee_revenue DESC;


-- 18. Monthly failure rate by payment channel
SELECT
    SUBSTR(transaction_date, 1, 7) AS transaction_month,
    payment_channel,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct
FROM fintech_transactions
GROUP BY SUBSTR(transaction_date, 1, 7), payment_channel
ORDER BY transaction_month, failure_rate_pct DESC;


-- 19. Transactions that may require operations review
SELECT
    transaction_id,
    transaction_date,
    customer_id,
    customer_segment,
    risk_tier,
    merchant_category,
    payment_channel,
    payment_method,
    transaction_amount,
    transaction_status,
    failure_reason,
    risk_score,
    risk_flag
FROM fintech_transactions
WHERE
    risk_flag = 'High Risk'
    OR transaction_status = 'Failed'
    OR transaction_amount >= 1000
ORDER BY risk_score DESC, transaction_amount DESC;


-- 20. Business performance summary by segment and channel
SELECT
    customer_segment,
    payment_channel,
    COUNT(*) AS total_transactions,
    ROUND(SUM(transaction_amount), 2) AS transaction_volume,
    ROUND(SUM(fee_amount), 2) AS fee_revenue,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_pct,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM fintech_transactions
GROUP BY customer_segment, payment_channel
ORDER BY customer_segment, transaction_volume DESC;