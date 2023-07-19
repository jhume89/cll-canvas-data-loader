SELECT table_name AS "Table",
ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
FROM information_schema.TABLES
WHERE table_schema in ("canvas_data", "canvas_data_requests")
ORDER BY (data_length + index_length) DESC;