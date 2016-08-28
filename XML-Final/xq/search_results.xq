import module namespace request = "http://exquery.org/ns/request";

declare variable $col := collection('FAS_Courses');

declare variable $dept := request:parameter('dept','');
declare variable $day := request:parameter('day','');
declare variable $term_patt := request:parameter('term_patt','');
declare variable $course_group := request:parameter('course_group','');
declare variable $faculty := request:parameter('course_group','');
declare variable $keyword :=request:parameter('keyword','');
declare variable $sort := request:parameter('sort','');

<courses>
{
for $c in $col/courses/course
let $sort := $c/department/@code
where contains($c, $keyword) and $c[
   (department[@code eq $dept or $dept eq '*' or $dept eq ''])
   and (term[@term_pattern_code eq $term_patt or $term_patt eq '*' or $term_patt eq '']) and (schedule/meeting[@day eq $day or $day eq '*' or $day eq '']) and (course_group[@code eq $course_group or $course_group eq '*' or $course_group eq '']) and (faculty_list/faculty[@id eq $faculty or $faculty eq '*' or $faculty eq ''])
 ] 

order by $sort
return $c
}

</courses>