select database_name,
       index_name,
       ROUND((1.0*stat_value*@@innodb_page_size/1024/1024), 2) as size_in_MB,
       table_name
from mysql.innodb_index_stats
where stat_name = 'size'
      and index_name not in ('PRIMARY', 'GEN_CLUST_INDEX')
      -- and database_name = 'put your database name here'
order by size_in_MB desc;