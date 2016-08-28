
declare variable $col := collection('FAS_Courses');

declare variable $dept := 'No_Results';
declare variable $day := '';
declare variable $term_patt := '';
declare variable $faculty := '';
declare variable $course_group := '';       
declare variable $keyword :='';
declare variable $sort := $course_group;

<courses>
{
for $c in $col/courses/course
where  $c[
   (department[@code eq $dept or $dept eq '*' or $dept eq ''])
   and (term[@term_pattern_code eq $term_patt or $term_patt eq '*' or $term_patt eq '']) and (schedule/meeting[@day eq $day or ($day eq '*' or $day eq '')]) and (course_group[@code eq $course_group or ($course_group eq '*' or $course_group eq '')]) and (faculty_list/faculty[@id eq $faculty or ($faculty eq '*' or $faculty eq '')]) ] and (contains($c, '$keyword') or contains($c, ''))

order by $sort
return $c
}

</courses>