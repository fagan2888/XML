import module namespace request = "http://exquery.org/ns/request";

declare variable $col := collection('FAS_Courses');

declare variable $cat_num := request:parameter('cat_num
','5085');

<courses>
{
for $c in $col/courses/course
where  $c[@cat_num eq $cat_num ]

return $c
}

</courses>