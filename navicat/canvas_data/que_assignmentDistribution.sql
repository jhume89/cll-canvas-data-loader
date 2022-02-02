select date(vw_assignment_due_dates.original_due_at) as `date`, count(distinct assignment_id)
from vw_assignment_due_dates
where original_due_at between "2021-09-01" AND "2021-12-31"
group by `date`;