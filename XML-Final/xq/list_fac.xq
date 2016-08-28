declare variable $col := collection('FAS_Courses');


<faculty_list>
{
for $fac
in distinct-values($col/courses/course/faculty_list/faculty/@id)
let $facnode := $col/courses/course/faculty_list/faculty[@id = $fac]
return $facnode[1]
}
</faculty_list>