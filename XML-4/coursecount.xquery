xquery version "1.0" encoding "UTF-8";
declare namespace saxon = "http://saxon.sf.net/";
declare option saxon:output "method=text";

let $col := doc('../assignment4/data/courses.xml')
let $courses := $col/courses/course[@acad_year eq '2014' and @offered eq 'Y' and term/@spring_term eq 'Y']
let $numcourses := count($courses)
 
return concat("Number of Courses: ",$numcourses)
