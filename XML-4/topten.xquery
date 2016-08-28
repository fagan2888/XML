xquery version "1.0" encoding "UTF-8";
declare namespace saxon = "http://saxon.sf.net/";
declare option saxon:output "method=xml";
declare variable $course_col := doc('../assignment4/data/courses.xml');
declare variable $enroll_col := doc('../assignment4/data/enrollment.xml');

<topten>

{
for $output in (
for $en_course in $enroll_col/enrollment/course
for $c_course in $course_col/courses/course

let $total := xs:integer($en_course/@total)
where $en_course/@cat_num eq $c_course/@cat_num

order by $total descending

return <course cat_num="{$en_course/@cat_num}" course_group="{$en_course/@course_group}" course_number="{$en_course/@course_number}" emp="{$en_course/@emp}" grad="{$en_course/@grad}" prof="{$en_course/@prof}" total="{$en_course/@total}" ugrad="{$en_course/@ugrad}" xreg="{$en_course/@xreg}"> {$c_course/title/text()} </course>
)[position() = 1 to 10]

return $output
}

</topten>