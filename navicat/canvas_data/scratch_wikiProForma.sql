select * from wiki_page_dim where body like "%due%" AND title like "Assignment%";

select * from assignment_dim where title like "Assignment%" and description like "%Due date%" and description NOT like "%(Weighting%";