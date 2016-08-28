declare variable $col := collection('FAS_Courses');


<departments>
{
for $dept
in distinct-values($col/courses/course/department/@code)
let $deptnode := $col/courses/course/department[@code = $dept]
order by $dept
return $deptnode[1]
}
</departments>