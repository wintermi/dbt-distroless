SELECT
    Q1.customer_id
  , Q1.first_name
  , Q1.last_name
  , T2.suburb
  , T2.state
  , T2.postcode
  , Q1.member_since
  , Q1.store_id AS local_store_id
FROM (SELECT
          id AS customer_id
        , first_name
        , last_name
        , member_since
        , CAST((RAND() * 139) AS INT64) + 1 AS store_id
      FROM {{ source('staging', 'random_users') }}
      UNION ALL
      SELECT
          id + 206209 AS customer_id
        , first_name
        , last_name
        , member_since
        , CAST((RAND() * 139) AS INT64) + 1 AS store_id
      FROM {{ source('staging', 'random_users') }}
      UNION ALL
      SELECT
          id + 412418 AS customer_id
        , first_name
        , last_name
        , member_since
        , CAST((RAND() * 139) AS INT64) + 1 AS store_id
      FROM {{ source('staging', 'random_users') }}
      UNION ALL
      SELECT
          id + 618627 AS customer_id
        , first_name
        , last_name
        , member_since
        , CAST((RAND() * 139) AS INT64) + 1 AS store_id
      FROM {{ source('staging', 'random_users') }}
      UNION ALL
      SELECT
          id + 824836 AS customer_id
        , first_name
        , last_name
        , member_since
        , CAST((RAND() * 139) AS INT64) + 1 AS store_id
      FROM {{ source('staging', 'random_users') }} ) AS Q1
  INNER JOIN {{ ref('store_locations') }} AS T2
    ON Q1.store_id = T2.store_id
