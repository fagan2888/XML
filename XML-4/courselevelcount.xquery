xquery version "1.0" encoding "UTF-8";
declare namespace saxon = "http://saxon.sf.net/";
declare option saxon:output "method=xml";
declare variable $col := doc('../assignment4/data/courses.xml');

<counts>
{
for $code in distinct-values($col/courses/course/course_level/@code)  
let $course := $col/courses/course/course_level[@code = $code]
let $count := count($course)
return <level code="{$code}">{$count}</level>
}
</counts>