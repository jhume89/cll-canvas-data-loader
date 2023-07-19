explain select timestamp_month, count(*) from requests where timestamp_month < '2020-01' GROUP BY timestamp_month;

begin;
explain delete quick from requests where timestamp_month < '2020-01';
rollback;