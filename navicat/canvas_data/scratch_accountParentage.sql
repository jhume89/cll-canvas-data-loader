select acc.name as account_name, acc.grandparent_account, acc.parent_account, acc.canvas_id as account_canvas_id
from account_dim acc
where acc.workflow_state <> 'deleted'
order by acc.parent_account, acc.grandparent_account, acc.name