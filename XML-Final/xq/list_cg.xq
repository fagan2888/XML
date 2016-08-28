

declare variable $col := collection('FAS_Courses');
declare variable $dept := 'NELC';

<course_groups>  
     {
       for $course_group_code
        in distinct-values($col/courses/course[department/@code=$dept]/course_group/@code)
        let $course_group := distinct-values($col/courses/course/course_group[@code=$course_group_code]) 
        order by $course_group
        return
                   
 <course_group name="{$course_group}" code ="{$course_group_code}">
                     
 </course_group>
    }
            

</course_groups>