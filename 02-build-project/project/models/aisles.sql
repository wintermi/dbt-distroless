SELECT
    aisle_id
  , aisle
FROM {{ source('staging', 'aisles') }}
