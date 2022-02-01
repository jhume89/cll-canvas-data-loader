SET @currentTermId := (SELECT id from enrollment_term_dim where `name` = 'T3 2021');

SET @findDatesRegex :=
'(?msx)(.{0,16})(                         # Uses "x" mode so regex whitespace and comments are allowed.
			[Ww]eek\W?\d\d? | 									# Any mention of weekN thru Week NN
			(\d{1,4}\W\d{1,2}\W\d{1,4}) | 			# variations of d/m/yy thru yyyy-dd-mm
			(January|February|March|April|May[\d\W]|June|July|August|September|October|November|December) |
			(Jan[\d\W]|Feb[\d\W]|Mar[\d\W]|Apr[\d\W]|Jun[\d\W]|Jul[\d\W]|Aug[\d\W]|Sept?[\d\W]|Oct[\d\W]|Nov[\d\W]|Dec[\d\W])
		)(.{0,16})';
		
select a2.assignment_id,
	a2.assignment_title,
	a2.assignment_description,
	@matchingText := CAST(REGEXP_SUBSTR(BINARY a2.description, @findDatesRegex) AS VARCHAR(256)) as `match`
from assignment_dim a2
join course_dim c2 on a2.course_id = c2.id
where c2.enrollment_term_id = @currentTermId
having `match` <> "";