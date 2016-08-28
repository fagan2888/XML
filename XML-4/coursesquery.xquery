xquery version "1.0" encoding "UTF-8";
declare namespace saxon = "http://saxon.sf.net/";
declare option saxon:output "method=xml";
declare variable $col := doc('../assignment4/data/courses.xml');

declare variable $keyword := '';
declare variable $course_group := 'ECON';
declare variable $term_pattern := '1';
declare variable $course_level := '';
declare variable $offered := 'Y';
declare variable $day := '1';
declare variable $begin_time := '1000';

<results>
{
for $c in ($col/courses/course[contains(lower-case(.) ,$keyword) or contains(upper-case(.),$keyword) or contains(.,$keyword)])

where  $c
[
   (course_group[@code eq $course_group or ($course_group eq '*' or $course_group eq '')])
   and (term[@term_pattern_code eq $term_pattern or ($term_pattern eq '*' or $term_pattern eq '')])
   and (@offered eq $offered or $offered eq '*' or ($offered eq ''))
   and (course_level[@code eq $course_level or ($course_level eq '*' or $course_level eq '')])
   and (schedule/meeting[@day eq $day or ($day eq '*' or $day eq '')] )
   and (schedule/meeting[@begin_time eq $begin_time or ($begin_time eq '*' or $begin_time eq '')])
]

return $c
}
</results>









