xquery version "1.0" encoding "UTF-8";
declare namespace saxon = "http://saxon.sf.net/";
declare option saxon:output "method=text";

let $col := doc('../assignment4/data/enrollment.xml')

let $ugrad := $col/enrollment/course/@ugrad

let $sum := sum($ugrad)

return concat("Number of Undergraduate enrollments is: ",$sum)
