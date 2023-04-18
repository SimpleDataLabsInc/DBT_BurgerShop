WITH stg_customers AS (

  SELECT * 
  
  FROM {{ ref('stg_customers')}}

),

stg_orders AS (

  SELECT * 
  
  FROM {{ ref('stg_orders')}}

),

stg_payments AS (

  SELECT * 
  
  FROM {{ ref('stg_payments')}}

),

by_cust_id AS (

  SELECT 
    in0.order_id AS order_id,
    in1.customer_id AS customer_id,
    in0.order_date AS order_date,
    in0.status AS status,
    in1.first_name AS first_name,
    in1.last_name AS last_name,
    in2.payment_method AS payment_method,
    in2.amount AS amount
  
  FROM stg_orders AS in0
  INNER JOIN stg_customers AS in1
     ON in0.customer_id = in1.customer_id
  INNER JOIN stg_payments AS in2
     ON in1.customer_id = in2.payment_id

)

SELECT *

FROM by_cust_id
