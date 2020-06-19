SELECT
    ROW_NUMBER() OVER (ORDER BY store_id) AS store_id
  , store_id AS store_number
  , name
  , address
  , suburb
  , state
  , postcode
  , latitude
  , longitude
  , ST_GEOGPOINT(longitude, latitude) AS geo
FROM (SELECT
          store_id
        , name
        , address
        , suburb
        , state
        , postcode
        , latitude
        , longitude
        , ROW_NUMBER() OVER (PARTITION BY postcode ORDER BY store_id) AS one_per_postcode
      FROM {{ source('staging', 'store_locations') }}
      WHERE state = 'VIC'
        AND name = suburb) AS T1
WHERE T1.one_per_postcode = 1
