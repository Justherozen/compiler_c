; ModuleID = 'main'
source_filename = "main"

@class = global [100 x [256 x i8]] zeroinitializer
@leading_course = global [100 x [256 x i8]] zeroinitializer
@l_list = global [100 x [256 x i8]] zeroinitializer
@acc_course = global [100 x [256 x i8]] zeroinitializer
@nullstr = global [256 x i8] zeroinitializer
@credit = global [100 x i32] zeroinitializer
@grade = global [100 x i32] zeroinitializer
@has_grade = global [100 x i32] zeroinitializer
@is_f = global [100 x i32] zeroinitializer
@is_learned = global [100 x i32] zeroinitializer
@c_length = global [100 x i32] zeroinitializer
@line = global i32 0
@.str = constant [3 x i8] c"%c\00"
@.str.1 = constant [6 x i8] c"%[^\0A]\00"
@.str.2 = constant [3 x i8] c"%c\00"
@.str.3 = constant [3 x i8] c"%c\00"
@.str.4 = constant [3 x i8] c"%s\00"
@.str.5 = constant [7 x i8] c"%.1lf\0A\00"
@.str.6 = constant [3 x i8] c"%s\00"
@.str.7 = constant [4 x i8] c"%d\0A\00"
@.str.8 = constant [3 x i8] c"%s\00"
@.str.9 = constant [4 x i8] c"%d\0A\00"
@.str.10 = constant [3 x i8] c"%s\00"
@.str.11 = constant [4 x i8] c"%d\0A\00"
@.str.12 = constant [4 x i8] c"%s\0A\00"
@.str.13 = constant [4 x i8] c"%s\0A\00"
@.str.14 = constant [4 x i8] c"%s\0A\00"
@.str.15 = constant [3 x i8] c"%s\00"
@.str.16 = constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @scanf(...)

define i32 @strcmp([256 x i8] %0, [256 x i8] %1) {
entry:
  %a = alloca [256 x i8]
  store [256 x i8] %0, [256 x i8]* %a
  %b = alloca [256 x i8]
  store [256 x i8] %1, [256 x i8]* %b
  %c = alloca i8
  %d = alloca i8
  %i = alloca i32
  %tmp_var_value = load i32, i32* %i
  store i32 0, i32* %i
  br label %condition

condition:                                        ; preds = %end, %entry
  %tmp_var_value1 = load i32, i32* %i
  %slttmp = icmp slt i32 %tmp_var_value1, 50
  %whileCond = icmp ne i1 %slttmp, false
  br i1 %whileCond, label %loop, label %afterLoop

loop:                                             ; preds = %condition
  %tmp_var_value2 = load i32, i32* %i
  %tmp_var_value3 = load [256 x i8], [256 x i8]* %a
  %tmp_array_ptr = getelementptr [256 x i8], [256 x i8]* %a, i32 0, i32 %tmp_var_value2
  %tmp_array_value = load i8, i8* %tmp_array_ptr
  %tmp_var_value4 = load i8, i8* %c
  store i8 %tmp_array_value, i8* %c
  %tmp_var_value5 = load i32, i32* %i
  %tmp_var_value6 = load [256 x i8], [256 x i8]* %b
  %tmp_array_ptr7 = getelementptr [256 x i8], [256 x i8]* %b, i32 0, i32 %tmp_var_value5
  %tmp_array_value8 = load i8, i8* %tmp_array_ptr7
  %tmp_var_value9 = load i8, i8* %d
  store i8 %tmp_array_value8, i8* %d
  %tmp_var_value10 = load i8, i8* %c
  %tmp_var_value11 = load i8, i8* %d
  %netmp = icmp ne i8 %tmp_var_value10, %tmp_var_value11
  %if_condition = icmp ne i1 %netmp, false
  br i1 %if_condition, label %then, label %else

afterLoop:                                        ; preds = %condition
  ret i32 0
  ret i32 -1

then:                                             ; preds = %loop
  ret i32 1
  br label %end

else:                                             ; preds = %loop
  br label %end

end:                                              ; preds = %else, %then
  %tmp_var_value12 = load i32, i32* %i
  %addtmp = add i32 %tmp_var_value12, 1
  %tmp_var_value13 = load i32, i32* %i
  store i32 %addtmp, i32* %i
  br label %condition
}

define i32 @str_find([256 x i8] %0) {
entry:
  %f = alloca [256 x i8]
  store [256 x i8] %0, [256 x i8]* %f
  %g = alloca [256 x i8]
  %adder = alloca i32
  %tmp_var_value = load i32, i32* %adder
  store i32 0, i32* %adder
  br label %condition

condition:                                        ; preds = %end, %entry
  %tmp_var_value1 = load i32, i32* %adder
  %tmp_var_value2 = load i32, i32* @line
  %slttmp = icmp slt i32 %tmp_var_value1, %tmp_var_value2
  %whileCond = icmp ne i1 %slttmp, false
  br i1 %whileCond, label %loop, label %afterLoop

loop:                                             ; preds = %condition
  %tmp_var_value3 = load i32, i32* %adder
  %tmp_var_value4 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value3
  %tmp_array_value = load [256 x i8], [256 x i8]* %tmp_array_ptr
  %tmp_var_value5 = load [256 x i8], [256 x i8]* %g
  store [256 x i8] %tmp_array_value, [256 x i8]* %g
  %tmp_var_value6 = load [256 x i8], [256 x i8]* %g
  %tmp_var_value7 = load [256 x i8], [256 x i8]* %f
  %tmp_call = call i32 @strcmp([256 x i8] %tmp_var_value6, [256 x i8] %tmp_var_value7)
  %eqtmp = icmp eq i32 %tmp_call, 0
  %tmp_var_value8 = load i32, i32* %adder
  %tmp_var_value9 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr10 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value8
  %tmp_array_value11 = load i32, i32* %tmp_array_ptr10
  %eqtmp12 = icmp eq i32 %tmp_array_value11, 1
  %andtmp = and i1 %eqtmp, %eqtmp12
  %if_condition = icmp ne i1 %andtmp, false
  br i1 %if_condition, label %then, label %else

afterLoop:                                        ; preds = %condition
  ret i32 200
  ret i32 -1

then:                                             ; preds = %loop
  %tmp_var_value13 = load i32, i32* %adder
  ret i32 %tmp_var_value13
  br label %end

else:                                             ; preds = %loop
  br label %end

end:                                              ; preds = %else, %then
  %tmp_var_value14 = load i32, i32* %adder
  %addtmp = add i32 %tmp_var_value14, 1
  %tmp_var_value15 = load i32, i32* %adder
  store i32 %addtmp, i32* %adder
  br label %condition
}

define i32 @main() {
entry:
  %testint = alloca i32
  %tmp = alloca [256 x i8]
  %tmp_class = alloca [256 x i8]
  %tmp_lc = alloca [256 x i8]
  %sep = alloca i8
  %base = alloca i8
  %tmpchar = alloca i8
  %newline = alloca i8
  %flag1 = alloca i32
  %flag2 = alloca i32
  %flag3 = alloca i32
  %cnt1 = alloca i32
  %cnt2 = alloca i32
  %cnt3 = alloca i32
  %cnt4 = alloca i32
  %cnt5 = alloca i32
  %cnt6 = alloca i32
  %part = alloca i32
  %index = alloca i32
  %total_credit = alloca i32
  %done_credit = alloca i32
  %try_credit = alloca i32
  %total_grade = alloca i32
  %tmp_credit = alloca i32
  %remain_credit = alloca i32
  %avg_grade = alloca double
  %outl1 = alloca [256 x i8]
  %outl2 = alloca [256 x i8]
  %outl3 = alloca [256 x i8]
  %outl4 = alloca [256 x i8]
  %outl5 = alloca [256 x i8]
  %outl6 = alloca [256 x i8]
  %outl7 = alloca [256 x i8]
  %outl8 = alloca [256 x i8]
  %newnew = alloca [256 x i8]
  %tmp_var_value = load [256 x i8], [256 x i8]* %newnew
  store [256 x i8] c"hhhhh\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %newnew
  %tmp_var_value1 = load [256 x i8], [256 x i8]* %outl1
  store [256 x i8] c"GPA: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl1
  %tmp_var_value2 = load [256 x i8], [256 x i8]* %outl2
  store [256 x i8] c"Hours Attempted: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl2
  %tmp_var_value3 = load [256 x i8], [256 x i8]* %outl3
  store [256 x i8] c"Hours Completed: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl3
  %tmp_var_value4 = load [256 x i8], [256 x i8]* %outl4
  store [256 x i8] c"Credits Remaining: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl4
  %tmp_var_value5 = load [256 x i8], [256 x i8]* %outl5
  store [256 x i8] zeroinitializer, [256 x i8]* %outl5
  %tmp_var_value6 = load [256 x i8], [256 x i8]* %outl6
  store [256 x i8] c"Possible Courses to Take Next\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl6
  %tmp_var_value7 = load [256 x i8], [256 x i8]* %outl7
  store [256 x i8] c"  \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl7
  %tmp_var_value8 = load [256 x i8], [256 x i8]* %outl8
  store [256 x i8] c"  None - Congratulations!\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl8
  %tmp_var_value9 = load i32, i32* %total_credit
  store i32 0, i32* %total_credit
  %tmp_var_value10 = load i32, i32* %try_credit
  store i32 0, i32* %try_credit
  %tmp_var_value11 = load i32, i32* %total_grade
  store i32 0, i32* %total_grade
  %tmp_var_value12 = load i32, i32* %done_credit
  store i32 0, i32* %done_credit
  %tmp_var_value13 = load i32, i32* %remain_credit
  store i32 0, i32* %remain_credit
  %tmp_var_value14 = load [256 x i8], [256 x i8]* @nullstr
  store [256 x i8] zeroinitializer, [256 x i8]* @nullstr
  %tmp_var_value15 = load i8, i8* %base
  store i8 48, i8* %base
  %tmp_var_value16 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value17 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value18 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value19 = load i32, i32* %part
  store i32 3, i32* %part
  %tmp_var_value20 = load i32, i32* @line
  store i32 0, i32* @line
  %tmp_var_value21 = load i32, i32* %flag1
  store i32 0, i32* %flag1
  %tmp_var_value22 = load i32, i32* %flag2
  store i32 0, i32* %flag2
  %tmp_var_value23 = load i8, i8* %newline
  store i8 10, i8* %newline
  %tmp_var_value24 = load i8, i8* %tmpchar
  %scanf = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %tmpchar)
  br label %condition

condition:                                        ; preds = %end197, %entry
  %tmp_var_value25 = load i8, i8* %tmpchar
  %tmp_var_value26 = load i8, i8* %newline
  %netmp = icmp ne i8 %tmp_var_value25, %tmp_var_value26
  %whileCond = icmp ne i1 %netmp, false
  br i1 %whileCond, label %loop, label %afterLoop

loop:                                             ; preds = %condition
  %tmp_var_value27 = load [256 x i8], [256 x i8]* %tmp
  %scanfstring = call i32 (...) @scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), [256 x i8]* %tmp, [256 x i8] %tmp_var_value27)
  %tmp_var_value28 = load i8, i8* %tmpchar
  %tmp_var_value29 = load i32, i32* %cnt2
  %tmp_var_value30 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value29
  store i8 %tmp_var_value28, i8* %tmp_array_ptr
  %tmp_var_value31 = load i32, i32* %cnt2
  %addtmp = add i32 %tmp_var_value31, 1
  %tmp_var_value32 = load i32, i32* %cnt2
  store i32 %addtmp, i32* %cnt2
  %tmp_var_value33 = load i32, i32* %cnt1
  %tmp_var_value34 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr35 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value33
  %tmp_array_value = load i8, i8* %tmp_array_ptr35
  %tmp_var_value36 = load i8, i8* %sep
  store i8 %tmp_array_value, i8* %sep
  %tmp_var_value37 = load i32, i32* %part
  %eqtmp = icmp eq i32 %tmp_var_value37, 3
  %tmp_var_value38 = load i8, i8* %sep
  %eqtmp39 = icmp eq i8 %tmp_var_value38, 124
  %andtmp = and i1 %eqtmp, %eqtmp39
  %if_condition = icmp ne i1 %andtmp, false
  br i1 %if_condition, label %then, label %else

afterLoop:                                        ; preds = %condition
  br label %condition318

then:                                             ; preds = %loop
  %tmp_var_value40 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value41 = load i32, i32* @line
  %tmp_var_value42 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr43 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value41
  store [256 x i8] %tmp_var_value40, [256 x i8]* %tmp_array_ptr43
  %tmp_var_value44 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value45 = load i32, i32* %part
  %subtmp = sub i32 %tmp_var_value45, 1
  %tmp_var_value46 = load i32, i32* %part
  store i32 %subtmp, i32* %part
  %tmp_var_value47 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  br label %end

else:                                             ; preds = %loop
  br label %end

end:                                              ; preds = %else, %then
  %tmp_var_value48 = load i32, i32* %part
  %eqtmp49 = icmp eq i32 %tmp_var_value48, 3
  %tmp_var_value50 = load i8, i8* %sep
  %netmp51 = icmp ne i8 %tmp_var_value50, 124
  %andtmp52 = and i1 %eqtmp49, %netmp51
  %if_condition53 = icmp ne i1 %andtmp52, false
  br i1 %if_condition53, label %then54, label %else55

then54:                                           ; preds = %end
  br label %condition57

else55:                                           ; preds = %end
  br label %end56

end56:                                            ; preds = %else55, %afterLoop59
  %tmp_var_value87 = load i32, i32* %part
  %eqtmp88 = icmp eq i32 %tmp_var_value87, 2
  %tmp_var_value89 = load i8, i8* %sep
  %eqtmp90 = icmp eq i8 %tmp_var_value89, 124
  %andtmp91 = and i1 %eqtmp88, %eqtmp90
  %if_condition92 = icmp ne i1 %andtmp91, false
  br i1 %if_condition92, label %then93, label %else94

condition57:                                      ; preds = %loop58, %then54
  %tmp_var_value60 = load i8, i8* %sep
  %netmp61 = icmp ne i8 %tmp_var_value60, 124
  %whileCond62 = icmp ne i1 %netmp61, false
  br i1 %whileCond62, label %loop58, label %afterLoop59

loop58:                                           ; preds = %condition57
  %tmp_var_value63 = load i8, i8* %sep
  %tmp_var_value64 = load i32, i32* %cnt2
  %tmp_var_value65 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr66 = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value64
  store i8 %tmp_var_value63, i8* %tmp_array_ptr66
  %tmp_var_value67 = load i32, i32* %cnt2
  %addtmp68 = add i32 %tmp_var_value67, 1
  %tmp_var_value69 = load i32, i32* %cnt2
  store i32 %addtmp68, i32* %cnt2
  %tmp_var_value70 = load i32, i32* %cnt1
  %addtmp71 = add i32 %tmp_var_value70, 1
  %tmp_var_value72 = load i32, i32* %cnt1
  store i32 %addtmp71, i32* %cnt1
  %tmp_var_value73 = load i32, i32* %cnt1
  %tmp_var_value74 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr75 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value73
  %tmp_array_value76 = load i8, i8* %tmp_array_ptr75
  %tmp_var_value77 = load i8, i8* %sep
  store i8 %tmp_array_value76, i8* %sep
  br label %condition57

afterLoop59:                                      ; preds = %condition57
  %tmp_var_value78 = load i32, i32* %part
  %subtmp79 = sub i32 %tmp_var_value78, 1
  %tmp_var_value80 = load i32, i32* %part
  store i32 %subtmp79, i32* %part
  %tmp_var_value81 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value82 = load i32, i32* @line
  %tmp_var_value83 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr84 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value82
  store [256 x i8] %tmp_var_value81, [256 x i8]* %tmp_array_ptr84
  %tmp_var_value85 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value86 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  br label %end56

then93:                                           ; preds = %end56
  %tmp_var_value96 = load i32, i32* %cnt1
  %addtmp97 = add i32 %tmp_var_value96, 1
  %tmp_var_value98 = load i32, i32* %cnt1
  store i32 %addtmp97, i32* %cnt1
  %tmp_var_value99 = load i32, i32* %cnt1
  %tmp_var_value100 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr101 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value99
  %tmp_array_value102 = load i8, i8* %tmp_array_ptr101
  %tmp_var_value103 = load i8, i8* %sep
  store i8 %tmp_array_value102, i8* %sep
  %tmp_var_value104 = load i8, i8* %sep
  %tmp_var_value105 = load i8, i8* %base
  %subtmp106 = sub i8 %tmp_var_value104, %tmp_var_value105
  %tmp_var_value107 = load i32, i32* %tmp_credit
  %0 = sext i8 %subtmp106 to i32
  store i32 %0, i32* %tmp_credit
  %tmp_var_value108 = load i32, i32* %tmp_credit
  %tmp_var_value109 = load i32, i32* @line
  %tmp_var_value110 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr111 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value109
  store i32 %tmp_var_value108, i32* %tmp_array_ptr111
  %tmp_var_value112 = load i32, i32* %cnt1
  %addtmp113 = add i32 %tmp_var_value112, 1
  %tmp_var_value114 = load i32, i32* %cnt1
  store i32 %addtmp113, i32* %cnt1
  %tmp_var_value115 = load i32, i32* %part
  %subtmp116 = sub i32 %tmp_var_value115, 1
  %tmp_var_value117 = load i32, i32* %part
  store i32 %subtmp116, i32* %part
  %tmp_var_value118 = load i32, i32* %cnt1
  %addtmp119 = add i32 %tmp_var_value118, 1
  %tmp_var_value120 = load i32, i32* %cnt1
  store i32 %addtmp119, i32* %cnt1
  %tmp_var_value121 = load i32, i32* %cnt1
  %tmp_var_value122 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr123 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value121
  %tmp_array_value124 = load i8, i8* %tmp_array_ptr123
  %tmp_var_value125 = load i8, i8* %sep
  store i8 %tmp_array_value124, i8* %sep
  br label %end95

else94:                                           ; preds = %end56
  br label %end95

end95:                                            ; preds = %else94, %then93
  %tmp_var_value126 = load i32, i32* %part
  %eqtmp127 = icmp eq i32 %tmp_var_value126, 1
  %tmp_var_value128 = load i8, i8* %sep
  %netmp129 = icmp ne i8 %tmp_var_value128, 124
  %andtmp130 = and i1 %eqtmp127, %netmp129
  %if_condition131 = icmp ne i1 %andtmp130, false
  br i1 %if_condition131, label %then132, label %else133

then132:                                          ; preds = %end95
  br label %condition135

else133:                                          ; preds = %end95
  %tmp_var_value169 = load i32, i32* %part
  %eqtmp170 = icmp eq i32 %tmp_var_value169, 1
  %tmp_var_value171 = load i8, i8* %sep
  %eqtmp172 = icmp eq i8 %tmp_var_value171, 124
  %andtmp173 = and i1 %eqtmp170, %eqtmp172
  %if_condition174 = icmp ne i1 %andtmp173, false
  br i1 %if_condition174, label %then175, label %else176

end134:                                           ; preds = %end177, %afterLoop137
  %tmp_var_value189 = load i32, i32* %part
  %eqtmp190 = icmp eq i32 %tmp_var_value189, 0
  %tmp_var_value191 = load i8, i8* %sep
  %eqtmp192 = icmp eq i8 %tmp_var_value191, 124
  %andtmp193 = and i1 %eqtmp190, %eqtmp192
  %if_condition194 = icmp ne i1 %andtmp193, false
  br i1 %if_condition194, label %then195, label %else196

condition135:                                     ; preds = %loop136, %then132
  %tmp_var_value138 = load i8, i8* %sep
  %netmp139 = icmp ne i8 %tmp_var_value138, 124
  %whileCond140 = icmp ne i1 %netmp139, false
  br i1 %whileCond140, label %loop136, label %afterLoop137

loop136:                                          ; preds = %condition135
  %tmp_var_value141 = load i8, i8* %sep
  %tmp_var_value142 = load i32, i32* %cnt2
  %tmp_var_value143 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_array_ptr144 = getelementptr [256 x i8], [256 x i8]* %tmp_lc, i32 0, i32 %tmp_var_value142
  store i8 %tmp_var_value141, i8* %tmp_array_ptr144
  %tmp_var_value145 = load i32, i32* %cnt2
  %addtmp146 = add i32 %tmp_var_value145, 1
  %tmp_var_value147 = load i32, i32* %cnt2
  store i32 %addtmp146, i32* %cnt2
  %tmp_var_value148 = load i32, i32* %cnt1
  %addtmp149 = add i32 %tmp_var_value148, 1
  %tmp_var_value150 = load i32, i32* %cnt1
  store i32 %addtmp149, i32* %cnt1
  %tmp_var_value151 = load i32, i32* %cnt1
  %tmp_var_value152 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr153 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value151
  %tmp_array_value154 = load i8, i8* %tmp_array_ptr153
  %tmp_var_value155 = load i8, i8* %sep
  store i8 %tmp_array_value154, i8* %sep
  br label %condition135

afterLoop137:                                     ; preds = %condition135
  %tmp_var_value156 = load i32, i32* %part
  %subtmp157 = sub i32 %tmp_var_value156, 1
  %tmp_var_value158 = load i32, i32* %part
  store i32 %subtmp157, i32* %part
  %tmp_var_value159 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value160 = load i32, i32* @line
  %tmp_var_value161 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr162 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value160
  store [256 x i8] %tmp_var_value159, [256 x i8]* %tmp_array_ptr162
  %tmp_var_value163 = load i32, i32* %cnt2
  %tmp_var_value164 = load i32, i32* @line
  %tmp_var_value165 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr166 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value164
  store i32 %tmp_var_value163, i32* %tmp_array_ptr166
  %tmp_var_value167 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value168 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  br label %end134

then175:                                          ; preds = %else133
  %tmp_var_value178 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value179 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value180 = load i32, i32* @line
  %tmp_var_value181 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr182 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value180
  store [256 x i8] %tmp_var_value179, [256 x i8]* %tmp_array_ptr182
  %tmp_var_value183 = load i32, i32* @line
  %tmp_var_value184 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr185 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value183
  store i32 0, i32* %tmp_array_ptr185
  %tmp_var_value186 = load i32, i32* %part
  %subtmp187 = sub i32 %tmp_var_value186, 1
  %tmp_var_value188 = load i32, i32* %part
  store i32 %subtmp187, i32* %part
  br label %end177

else176:                                          ; preds = %else133
  br label %end177

end177:                                           ; preds = %else176, %then175
  br label %end134

then195:                                          ; preds = %end134
  %tmp_var_value198 = load i32, i32* %cnt1
  %addtmp199 = add i32 %tmp_var_value198, 1
  %tmp_var_value200 = load i32, i32* %cnt1
  store i32 %addtmp199, i32* %cnt1
  %tmp_var_value201 = load i32, i32* %cnt1
  %tmp_var_value202 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr203 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value201
  %tmp_array_value204 = load i8, i8* %tmp_array_ptr203
  %tmp_var_value205 = load i8, i8* %sep
  store i8 %tmp_array_value204, i8* %sep
  %tmp_var_value206 = load i8, i8* %sep
  %eqtmp207 = icmp eq i8 %tmp_var_value206, 65
  %if_condition208 = icmp ne i1 %eqtmp207, false
  br i1 %if_condition208, label %then209, label %else210

else196:                                          ; preds = %end134
  br label %end197

end197:                                           ; preds = %else196, %end211
  %tmp_var_value309 = load i32, i32* @line
  %addtmp310 = add i32 %tmp_var_value309, 1
  %tmp_var_value311 = load i32, i32* @line
  store i32 %addtmp310, i32* @line
  %tmp_var_value312 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp
  %tmp_var_value313 = load i32, i32* %part
  store i32 3, i32* %part
  %tmp_var_value314 = load i8, i8* %newline
  %scanf315 = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* %newline)
  %tmp_var_value316 = load i8, i8* %tmpchar
  %scanf317 = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %tmpchar)
  br label %condition

then209:                                          ; preds = %then195
  %tmp_var_value212 = load i32, i32* @line
  %tmp_var_value213 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr214 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value212
  store i32 4, i32* %tmp_array_ptr214
  %tmp_var_value215 = load i32, i32* @line
  %tmp_var_value216 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr217 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value215
  store i32 0, i32* %tmp_array_ptr217
  %tmp_var_value218 = load i32, i32* @line
  %tmp_var_value219 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr220 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value218
  store i32 1, i32* %tmp_array_ptr220
  %tmp_var_value221 = load i32, i32* @line
  %tmp_var_value222 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr223 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value221
  store i32 1, i32* %tmp_array_ptr223
  br label %end211

else210:                                          ; preds = %then195
  %tmp_var_value224 = load i8, i8* %sep
  %eqtmp225 = icmp eq i8 %tmp_var_value224, 66
  %if_condition226 = icmp ne i1 %eqtmp225, false
  br i1 %if_condition226, label %then227, label %else228

end211:                                           ; preds = %end229, %then209
  %tmp_var_value308 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  br label %end197

then227:                                          ; preds = %else210
  %tmp_var_value230 = load i32, i32* @line
  %tmp_var_value231 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr232 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value230
  store i32 3, i32* %tmp_array_ptr232
  %tmp_var_value233 = load i32, i32* @line
  %tmp_var_value234 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr235 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value233
  store i32 0, i32* %tmp_array_ptr235
  %tmp_var_value236 = load i32, i32* @line
  %tmp_var_value237 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr238 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value236
  store i32 1, i32* %tmp_array_ptr238
  %tmp_var_value239 = load i32, i32* @line
  %tmp_var_value240 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr241 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value239
  store i32 1, i32* %tmp_array_ptr241
  br label %end229

else228:                                          ; preds = %else210
  %tmp_var_value242 = load i8, i8* %sep
  %eqtmp243 = icmp eq i8 %tmp_var_value242, 67
  %if_condition244 = icmp ne i1 %eqtmp243, false
  br i1 %if_condition244, label %then245, label %else246

end229:                                           ; preds = %end247, %then227
  br label %end211

then245:                                          ; preds = %else228
  %tmp_var_value248 = load i32, i32* @line
  %tmp_var_value249 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr250 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value248
  store i32 2, i32* %tmp_array_ptr250
  %tmp_var_value251 = load i32, i32* @line
  %tmp_var_value252 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr253 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value251
  store i32 0, i32* %tmp_array_ptr253
  %tmp_var_value254 = load i32, i32* @line
  %tmp_var_value255 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr256 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value254
  store i32 1, i32* %tmp_array_ptr256
  %tmp_var_value257 = load i32, i32* @line
  %tmp_var_value258 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr259 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value257
  store i32 1, i32* %tmp_array_ptr259
  br label %end247

else246:                                          ; preds = %else228
  %tmp_var_value260 = load i8, i8* %sep
  %eqtmp261 = icmp eq i8 %tmp_var_value260, 68
  %if_condition262 = icmp ne i1 %eqtmp261, false
  br i1 %if_condition262, label %then263, label %else264

end247:                                           ; preds = %end265, %then245
  br label %end229

then263:                                          ; preds = %else246
  %tmp_var_value266 = load i32, i32* @line
  %tmp_var_value267 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr268 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value266
  store i32 1, i32* %tmp_array_ptr268
  %tmp_var_value269 = load i32, i32* @line
  %tmp_var_value270 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr271 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value269
  store i32 0, i32* %tmp_array_ptr271
  %tmp_var_value272 = load i32, i32* @line
  %tmp_var_value273 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr274 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value272
  store i32 1, i32* %tmp_array_ptr274
  %tmp_var_value275 = load i32, i32* @line
  %tmp_var_value276 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr277 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value275
  store i32 1, i32* %tmp_array_ptr277
  br label %end265

else264:                                          ; preds = %else246
  %tmp_var_value278 = load i8, i8* %sep
  %eqtmp279 = icmp eq i8 %tmp_var_value278, 70
  %if_condition280 = icmp ne i1 %eqtmp279, false
  br i1 %if_condition280, label %then281, label %else282

end265:                                           ; preds = %end283, %then263
  br label %end247

then281:                                          ; preds = %else264
  %tmp_var_value284 = load i32, i32* @line
  %tmp_var_value285 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr286 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value284
  store i32 0, i32* %tmp_array_ptr286
  %tmp_var_value287 = load i32, i32* @line
  %tmp_var_value288 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr289 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value287
  store i32 1, i32* %tmp_array_ptr289
  %tmp_var_value290 = load i32, i32* @line
  %tmp_var_value291 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr292 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value290
  store i32 1, i32* %tmp_array_ptr292
  %tmp_var_value293 = load i32, i32* @line
  %tmp_var_value294 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr295 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value293
  store i32 0, i32* %tmp_array_ptr295
  br label %end283

else282:                                          ; preds = %else264
  %tmp_var_value296 = load i32, i32* @line
  %tmp_var_value297 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr298 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value296
  store i32 0, i32* %tmp_array_ptr298
  %tmp_var_value299 = load i32, i32* @line
  %tmp_var_value300 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr301 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value299
  store i32 0, i32* %tmp_array_ptr301
  %tmp_var_value302 = load i32, i32* @line
  %tmp_var_value303 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr304 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value302
  store i32 0, i32* %tmp_array_ptr304
  %tmp_var_value305 = load i32, i32* @line
  %tmp_var_value306 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr307 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value305
  store i32 0, i32* %tmp_array_ptr307
  br label %end283

end283:                                           ; preds = %else282, %then281
  br label %end265

condition318:                                     ; preds = %end338, %afterLoop
  %tmp_var_value321 = load i32, i32* %cnt1
  %tmp_var_value322 = load i32, i32* @line
  %slttmp = icmp slt i32 %tmp_var_value321, %tmp_var_value322
  %whileCond323 = icmp ne i1 %slttmp, false
  br i1 %whileCond323, label %loop319, label %afterLoop320

loop319:                                          ; preds = %condition318
  %tmp_var_value324 = load i32, i32* %cnt1
  %tmp_var_value325 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr326 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value324
  %tmp_array_value327 = load i32, i32* %tmp_array_ptr326
  %eqtmp328 = icmp eq i32 %tmp_array_value327, 1
  %tmp_var_value329 = load i32, i32* %cnt1
  %tmp_var_value330 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr331 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value329
  %tmp_array_value332 = load i32, i32* %tmp_array_ptr331
  %eqtmp333 = icmp eq i32 %tmp_array_value332, 0
  %andtmp334 = and i1 %eqtmp328, %eqtmp333
  %if_condition335 = icmp ne i1 %andtmp334, false
  br i1 %if_condition335, label %then336, label %else337

afterLoop320:                                     ; preds = %condition318
  %tmp_var_value410 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value411 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value412 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value413 = load i32, i32* %cnt4
  store i32 0, i32* %cnt4
  %tmp_var_value414 = load i32, i32* %cnt5
  store i32 0, i32* %cnt5
  %tmp_var_value415 = load i32, i32* %cnt6
  store i32 0, i32* %cnt6
  %tmp_var_value416 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  %tmp_var_value417 = load i32, i32* %flag2
  store i32 1, i32* %flag2
  %tmp_var_value418 = load i32, i32* %total_grade
  %eqtmp419 = icmp eq i32 %tmp_var_value418, 0
  %if_condition420 = icmp ne i1 %eqtmp419, false
  br i1 %if_condition420, label %then421, label %else422

then336:                                          ; preds = %loop319
  %tmp_var_value339 = load i32, i32* %try_credit
  %tmp_var_value340 = load i32, i32* %cnt1
  %tmp_var_value341 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr342 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value340
  %tmp_array_value343 = load i32, i32* %tmp_array_ptr342
  %addtmp344 = add i32 %tmp_var_value339, %tmp_array_value343
  %tmp_var_value345 = load i32, i32* %try_credit
  store i32 %addtmp344, i32* %try_credit
  %tmp_var_value346 = load i32, i32* %total_credit
  %tmp_var_value347 = load i32, i32* %cnt1
  %tmp_var_value348 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr349 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value347
  %tmp_array_value350 = load i32, i32* %tmp_array_ptr349
  %addtmp351 = add i32 %tmp_var_value346, %tmp_array_value350
  %tmp_var_value352 = load i32, i32* %total_credit
  store i32 %addtmp351, i32* %total_credit
  %tmp_var_value353 = load i32, i32* %done_credit
  %tmp_var_value354 = load i32, i32* %cnt1
  %tmp_var_value355 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr356 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value354
  %tmp_array_value357 = load i32, i32* %tmp_array_ptr356
  %addtmp358 = add i32 %tmp_var_value353, %tmp_array_value357
  %tmp_var_value359 = load i32, i32* %done_credit
  store i32 %addtmp358, i32* %done_credit
  %tmp_var_value360 = load i32, i32* %total_grade
  %tmp_var_value361 = load i32, i32* %cnt1
  %tmp_var_value362 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr363 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value361
  %tmp_array_value364 = load i32, i32* %tmp_array_ptr363
  %tmp_var_value365 = load i32, i32* %cnt1
  %tmp_var_value366 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr367 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value365
  %tmp_array_value368 = load i32, i32* %tmp_array_ptr367
  %multmp = mul i32 %tmp_array_value364, %tmp_array_value368
  %addtmp369 = add i32 %tmp_var_value360, %multmp
  %tmp_var_value370 = load i32, i32* %total_grade
  store i32 %addtmp369, i32* %total_grade
  br label %end338

else337:                                          ; preds = %loop319
  %tmp_var_value371 = load i32, i32* %cnt1
  %tmp_var_value372 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr373 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value371
  %tmp_array_value374 = load i32, i32* %tmp_array_ptr373
  %eqtmp375 = icmp eq i32 %tmp_array_value374, 1
  %tmp_var_value376 = load i32, i32* %cnt1
  %tmp_var_value377 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr378 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value376
  %tmp_array_value379 = load i32, i32* %tmp_array_ptr378
  %eqtmp380 = icmp eq i32 %tmp_array_value379, 1
  %andtmp381 = and i1 %eqtmp375, %eqtmp380
  %if_condition382 = icmp ne i1 %andtmp381, false
  br i1 %if_condition382, label %then383, label %else384

end338:                                           ; preds = %end385, %then336
  %tmp_var_value407 = load i32, i32* %cnt1
  %addtmp408 = add i32 %tmp_var_value407, 1
  %tmp_var_value409 = load i32, i32* %cnt1
  store i32 %addtmp408, i32* %cnt1
  br label %condition318

then383:                                          ; preds = %else337
  %tmp_var_value386 = load i32, i32* %total_credit
  %tmp_var_value387 = load i32, i32* %cnt1
  %tmp_var_value388 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr389 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value387
  %tmp_array_value390 = load i32, i32* %tmp_array_ptr389
  %addtmp391 = add i32 %tmp_var_value386, %tmp_array_value390
  %tmp_var_value392 = load i32, i32* %total_credit
  store i32 %addtmp391, i32* %total_credit
  %tmp_var_value393 = load i32, i32* %try_credit
  %tmp_var_value394 = load i32, i32* %cnt1
  %tmp_var_value395 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr396 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value394
  %tmp_array_value397 = load i32, i32* %tmp_array_ptr396
  %addtmp398 = add i32 %tmp_var_value393, %tmp_array_value397
  %tmp_var_value399 = load i32, i32* %try_credit
  store i32 %addtmp398, i32* %try_credit
  br label %end385

else384:                                          ; preds = %else337
  %tmp_var_value400 = load i32, i32* %total_credit
  %tmp_var_value401 = load i32, i32* %cnt1
  %tmp_var_value402 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr403 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value401
  %tmp_array_value404 = load i32, i32* %tmp_array_ptr403
  %addtmp405 = add i32 %tmp_var_value400, %tmp_array_value404
  %tmp_var_value406 = load i32, i32* %total_credit
  store i32 %addtmp405, i32* %total_credit
  br label %end385

end385:                                           ; preds = %else384, %then383
  br label %end338

then421:                                          ; preds = %afterLoop320
  %tmp_var_value424 = load double, double* %avg_grade
  store double 0.000000e+00, double* %avg_grade
  br label %end423

else422:                                          ; preds = %afterLoop320
  %tmp_var_value425 = load i32, i32* %total_grade
  %tmp_var_value426 = load i32, i32* %try_credit
  %1 = sitofp i32 %tmp_var_value425 to double
  %2 = sitofp i32 %tmp_var_value426 to double
  %div_d_tmp = fdiv double %1, %2
  %tmp_var_value427 = load double, double* %avg_grade
  store double %div_d_tmp, double* %avg_grade
  br label %end423

end423:                                           ; preds = %else422, %then421
  %tmp_var_value428 = load i32, i32* %total_credit
  %tmp_var_value429 = load i32, i32* %done_credit
  %subtmp430 = sub i32 %tmp_var_value428, %tmp_var_value429
  %tmp_var_value431 = load i32, i32* %remain_credit
  store i32 %subtmp430, i32* %remain_credit
  br label %condition432

condition432:                                     ; preds = %end447, %end423
  %tmp_var_value435 = load i32, i32* %cnt1
  %tmp_var_value436 = load i32, i32* @line
  %slttmp437 = icmp slt i32 %tmp_var_value435, %tmp_var_value436
  %whileCond438 = icmp ne i1 %slttmp437, false
  br i1 %whileCond438, label %loop433, label %afterLoop434

loop433:                                          ; preds = %condition432
  %tmp_var_value439 = load i32, i32* %cnt1
  %tmp_var_value440 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr441 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value439
  %tmp_array_value442 = load i32, i32* %tmp_array_ptr441
  %eqtmp443 = icmp eq i32 %tmp_array_value442, 0
  %if_condition444 = icmp ne i1 %eqtmp443, false
  br i1 %if_condition444, label %then445, label %else446

afterLoop434:                                     ; preds = %condition432
  %tmp_var_value637 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value638 = load [256 x i8], [256 x i8]* %outl1
  %printstringsameline = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), [256 x i8]* %outl1, [256 x i8] %tmp_var_value638)
  %tmp_var_value639 = load double, double* %avg_grade
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), double %tmp_var_value639)
  %tmp_var_value640 = load [256 x i8], [256 x i8]* %outl2
  %printstringsameline641 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), [256 x i8]* %outl2, [256 x i8] %tmp_var_value640)
  %tmp_var_value642 = load i32, i32* %try_credit
  %printf643 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %tmp_var_value642)
  %tmp_var_value644 = load [256 x i8], [256 x i8]* %outl3
  %printstringsameline645 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), [256 x i8]* %outl3, [256 x i8] %tmp_var_value644)
  %tmp_var_value646 = load i32, i32* %done_credit
  %printf647 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %tmp_var_value646)
  %tmp_var_value648 = load [256 x i8], [256 x i8]* %outl4
  %printstringsameline649 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), [256 x i8]* %outl4, [256 x i8] %tmp_var_value648)
  %tmp_var_value650 = load i32, i32* %remain_credit
  %printf651 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 %tmp_var_value650)
  %tmp_var_value652 = load [256 x i8], [256 x i8]* %outl5
  %printstring = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), [256 x i8]* %outl5, [256 x i8] %tmp_var_value652)
  %tmp_var_value653 = load [256 x i8], [256 x i8]* %outl6
  %printstring654 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), [256 x i8]* %outl6, [256 x i8] %tmp_var_value653)
  %tmp_var_value655 = load i32, i32* %total_credit
  %tmp_var_value656 = load i32, i32* %done_credit
  %eqtmp657 = icmp eq i32 %tmp_var_value655, %tmp_var_value656
  %if_condition658 = icmp ne i1 %eqtmp657, false
  br i1 %if_condition658, label %then659, label %else660

then445:                                          ; preds = %loop433
  %tmp_var_value448 = load i32, i32* %cnt1
  %tmp_var_value449 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr450 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value448
  %tmp_array_value451 = load i32, i32* %tmp_array_ptr450
  %eqtmp452 = icmp eq i32 %tmp_array_value451, 0
  %if_condition453 = icmp ne i1 %eqtmp452, false
  br i1 %if_condition453, label %then454, label %else455

else446:                                          ; preds = %loop433
  br label %end447

end447:                                           ; preds = %else446, %end456
  %tmp_var_value634 = load i32, i32* %cnt1
  %addtmp635 = add i32 %tmp_var_value634, 1
  %tmp_var_value636 = load i32, i32* %cnt1
  store i32 %addtmp635, i32* %cnt1
  br label %condition432

then454:                                          ; preds = %then445
  %tmp_var_value457 = load i32, i32* %cnt1
  %tmp_var_value458 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr459 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value457
  %tmp_array_value460 = load [256 x i8], [256 x i8]* %tmp_array_ptr459
  %tmp_var_value461 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_array_value460, [256 x i8]* %tmp_lc
  %tmp_var_value462 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value463 = load i32, i32* %cnt5
  %tmp_var_value464 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr465 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value463
  store [256 x i8] %tmp_var_value462, [256 x i8]* %tmp_array_ptr465
  %tmp_var_value466 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value467 = load i32, i32* %cnt5
  %addtmp468 = add i32 %tmp_var_value467, 1
  %tmp_var_value469 = load i32, i32* %cnt5
  store i32 %addtmp468, i32* %cnt5
  br label %end456

else455:                                          ; preds = %then445
  %tmp_var_value470 = load i32, i32* %cnt1
  %tmp_var_value471 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr472 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value470
  %tmp_array_value473 = load [256 x i8], [256 x i8]* %tmp_array_ptr472
  %tmp_var_value474 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] %tmp_array_value473, [256 x i8]* %tmp
  %tmp_var_value475 = load i32, i32* %cnt2
  %tmp_var_value476 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr477 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value475
  %tmp_array_value478 = load i8, i8* %tmp_array_ptr477
  %tmp_var_value479 = load i8, i8* %sep
  store i8 %tmp_array_value478, i8* %sep
  br label %condition480

end456:                                           ; preds = %end617, %then454
  br label %end447

condition480:                                     ; preds = %end603, %else455
  %tmp_var_value483 = load i32, i32* %cnt2
  %tmp_var_value484 = load i32, i32* %cnt1
  %tmp_var_value485 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr486 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value484
  %tmp_array_value487 = load i32, i32* %tmp_array_ptr486
  %slttmp488 = icmp slt i32 %tmp_var_value483, %tmp_array_value487
  %tmp_var_value489 = load i32, i32* %flag2
  %eqtmp490 = icmp eq i32 %tmp_var_value489, 1
  %andtmp491 = and i1 %slttmp488, %eqtmp490
  %whileCond492 = icmp ne i1 %andtmp491, false
  br i1 %whileCond492, label %loop481, label %afterLoop482

loop481:                                          ; preds = %condition480
  br label %condition493

afterLoop482:                                     ; preds = %condition480
  %tmp_var_value612 = load i32, i32* %flag2
  %eqtmp613 = icmp eq i32 %tmp_var_value612, 0
  %if_condition614 = icmp ne i1 %eqtmp613, false
  br i1 %if_condition614, label %then615, label %else616

condition493:                                     ; preds = %end551, %loop481
  %tmp_var_value496 = load i8, i8* %sep
  %netmp497 = icmp ne i8 %tmp_var_value496, 59
  %tmp_var_value498 = load i32, i32* %cnt2
  %tmp_var_value499 = load i32, i32* %cnt1
  %tmp_var_value500 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr501 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value499
  %tmp_array_value502 = load i32, i32* %tmp_array_ptr501
  %slttmp503 = icmp slt i32 %tmp_var_value498, %tmp_array_value502
  %andtmp504 = and i1 %netmp497, %slttmp503
  %whileCond505 = icmp ne i1 %andtmp504, false
  br i1 %whileCond505, label %loop494, label %afterLoop495

loop494:                                          ; preds = %condition493
  br label %condition506

afterLoop495:                                     ; preds = %condition493
  br label %condition560

condition506:                                     ; preds = %loop507, %loop494
  %tmp_var_value509 = load i8, i8* %sep
  %netmp510 = icmp ne i8 %tmp_var_value509, 59
  %tmp_var_value511 = load i8, i8* %sep
  %netmp512 = icmp ne i8 %tmp_var_value511, 44
  %andtmp513 = and i1 %netmp510, %netmp512
  %tmp_var_value514 = load i32, i32* %cnt2
  %tmp_var_value515 = load i32, i32* %cnt1
  %tmp_var_value516 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr517 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value515
  %tmp_array_value518 = load i32, i32* %tmp_array_ptr517
  %slttmp519 = icmp slt i32 %tmp_var_value514, %tmp_array_value518
  %andtmp520 = and i1 %andtmp513, %slttmp519
  %whileCond521 = icmp ne i1 %andtmp520, false
  br i1 %whileCond521, label %loop507, label %afterLoop508

loop507:                                          ; preds = %condition506
  %tmp_var_value522 = load i8, i8* %sep
  %tmp_var_value523 = load i32, i32* %cnt3
  %tmp_var_value524 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr525 = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value523
  store i8 %tmp_var_value522, i8* %tmp_array_ptr525
  %tmp_var_value526 = load i32, i32* %cnt3
  %addtmp527 = add i32 %tmp_var_value526, 1
  %tmp_var_value528 = load i32, i32* %cnt3
  store i32 %addtmp527, i32* %cnt3
  %tmp_var_value529 = load i32, i32* %cnt2
  %addtmp530 = add i32 %tmp_var_value529, 1
  %tmp_var_value531 = load i32, i32* %cnt2
  store i32 %addtmp530, i32* %cnt2
  %tmp_var_value532 = load i32, i32* %cnt2
  %tmp_var_value533 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr534 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value532
  %tmp_array_value535 = load i8, i8* %tmp_array_ptr534
  %tmp_var_value536 = load i8, i8* %sep
  store i8 %tmp_array_value535, i8* %sep
  br label %condition506

afterLoop508:                                     ; preds = %condition506
  %tmp_var_value537 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value538 = load i32, i32* %cnt4
  %tmp_var_value539 = load [100 x [256 x i8]], [100 x [256 x i8]]* @l_list
  %tmp_array_ptr540 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @l_list, i32 0, i32 %tmp_var_value538
  store [256 x i8] %tmp_var_value537, [256 x i8]* %tmp_array_ptr540
  %tmp_var_value541 = load i32, i32* %cnt4
  %addtmp542 = add i32 %tmp_var_value541, 1
  %tmp_var_value543 = load i32, i32* %cnt4
  store i32 %addtmp542, i32* %cnt4
  %tmp_var_value544 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value545 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value546 = load i8, i8* %sep
  %eqtmp547 = icmp eq i8 %tmp_var_value546, 44
  %if_condition548 = icmp ne i1 %eqtmp547, false
  br i1 %if_condition548, label %then549, label %else550

then549:                                          ; preds = %afterLoop508
  %tmp_var_value552 = load i32, i32* %cnt2
  %addtmp553 = add i32 %tmp_var_value552, 1
  %tmp_var_value554 = load i32, i32* %cnt2
  store i32 %addtmp553, i32* %cnt2
  br label %end551

else550:                                          ; preds = %afterLoop508
  br label %end551

end551:                                           ; preds = %else550, %then549
  %tmp_var_value555 = load i32, i32* %cnt2
  %tmp_var_value556 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr557 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value555
  %tmp_array_value558 = load i8, i8* %tmp_array_ptr557
  %tmp_var_value559 = load i8, i8* %sep
  store i8 %tmp_array_value558, i8* %sep
  br label %condition493

condition560:                                     ; preds = %end582, %afterLoop495
  %tmp_var_value563 = load i32, i32* %cnt6
  %tmp_var_value564 = load i32, i32* %cnt4
  %slttmp565 = icmp slt i32 %tmp_var_value563, %tmp_var_value564
  %tmp_var_value566 = load i32, i32* %flag1
  %eqtmp567 = icmp eq i32 %tmp_var_value566, 1
  %andtmp568 = and i1 %slttmp565, %eqtmp567
  %whileCond569 = icmp ne i1 %andtmp568, false
  br i1 %whileCond569, label %loop561, label %afterLoop562

loop561:                                          ; preds = %condition560
  %tmp_var_value570 = load i32, i32* %cnt6
  %tmp_var_value571 = load [100 x [256 x i8]], [100 x [256 x i8]]* @l_list
  %tmp_array_ptr572 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @l_list, i32 0, i32 %tmp_var_value570
  %tmp_array_value573 = load [256 x i8], [256 x i8]* %tmp_array_ptr572
  %tmp_var_value574 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_array_value573, [256 x i8]* %tmp_class
  %tmp_var_value575 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_call = call i32 @str_find([256 x i8] %tmp_var_value575)
  %tmp_var_value576 = load i32, i32* %index
  store i32 %tmp_call, i32* %index
  %tmp_var_value577 = load i32, i32* %index
  %eqtmp578 = icmp eq i32 %tmp_var_value577, 200
  %if_condition579 = icmp ne i1 %eqtmp578, false
  br i1 %if_condition579, label %then580, label %else581

afterLoop562:                                     ; preds = %condition560
  %tmp_var_value587 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value588 = load i32, i32* %flag1
  %eqtmp589 = icmp eq i32 %tmp_var_value588, 1
  %if_condition590 = icmp ne i1 %eqtmp589, false
  br i1 %if_condition590, label %then591, label %else592

then580:                                          ; preds = %loop561
  %tmp_var_value583 = load i32, i32* %flag1
  store i32 0, i32* %flag1
  br label %end582

else581:                                          ; preds = %loop561
  br label %end582

end582:                                           ; preds = %else581, %then580
  %tmp_var_value584 = load i32, i32* %cnt6
  %addtmp585 = add i32 %tmp_var_value584, 1
  %tmp_var_value586 = load i32, i32* %cnt6
  store i32 %addtmp585, i32* %cnt6
  br label %condition560

then591:                                          ; preds = %afterLoop562
  %tmp_var_value594 = load i32, i32* %flag2
  store i32 0, i32* %flag2
  br label %end593

else592:                                          ; preds = %afterLoop562
  %tmp_var_value595 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  br label %end593

end593:                                           ; preds = %else592, %then591
  %tmp_var_value596 = load i32, i32* %cnt6
  store i32 0, i32* %cnt6
  %tmp_var_value597 = load i32, i32* %cnt4
  store i32 0, i32* %cnt4
  %tmp_var_value598 = load i8, i8* %sep
  %eqtmp599 = icmp eq i8 %tmp_var_value598, 59
  %if_condition600 = icmp ne i1 %eqtmp599, false
  br i1 %if_condition600, label %then601, label %else602

then601:                                          ; preds = %end593
  %tmp_var_value604 = load i32, i32* %cnt2
  %addtmp605 = add i32 %tmp_var_value604, 1
  %tmp_var_value606 = load i32, i32* %cnt2
  store i32 %addtmp605, i32* %cnt2
  br label %end603

else602:                                          ; preds = %end593
  br label %end603

end603:                                           ; preds = %else602, %then601
  %tmp_var_value607 = load i32, i32* %cnt2
  %tmp_var_value608 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr609 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value607
  %tmp_array_value610 = load i8, i8* %tmp_array_ptr609
  %tmp_var_value611 = load i8, i8* %sep
  store i8 %tmp_array_value610, i8* %sep
  br label %condition480

then615:                                          ; preds = %afterLoop482
  %tmp_var_value618 = load i32, i32* %cnt1
  %tmp_var_value619 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr620 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value618
  %tmp_array_value621 = load [256 x i8], [256 x i8]* %tmp_array_ptr620
  %tmp_var_value622 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_array_value621, [256 x i8]* %tmp_lc
  %tmp_var_value623 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value624 = load i32, i32* %cnt5
  %tmp_var_value625 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr626 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value624
  store [256 x i8] %tmp_var_value623, [256 x i8]* %tmp_array_ptr626
  %tmp_var_value627 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value628 = load i32, i32* %cnt5
  %addtmp629 = add i32 %tmp_var_value628, 1
  %tmp_var_value630 = load i32, i32* %cnt5
  store i32 %addtmp629, i32* %cnt5
  br label %end617

else616:                                          ; preds = %afterLoop482
  br label %end617

end617:                                           ; preds = %else616, %then615
  %tmp_var_value631 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  %tmp_var_value632 = load i32, i32* %flag2
  store i32 1, i32* %flag2
  %tmp_var_value633 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  br label %end456

then659:                                          ; preds = %afterLoop434
  %tmp_var_value662 = load [256 x i8], [256 x i8]* %outl8
  %printstring663 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), [256 x i8]* %outl8, [256 x i8] %tmp_var_value662)
  br label %end661

else660:                                          ; preds = %afterLoop434
  br label %end661

end661:                                           ; preds = %else660, %then659
  %tmp_var_value664 = load i32, i32* %total_credit
  %tmp_var_value665 = load i32, i32* %done_credit
  %netmp666 = icmp ne i32 %tmp_var_value664, %tmp_var_value665
  %if_condition667 = icmp ne i1 %netmp666, false
  br i1 %if_condition667, label %then668, label %else669

then668:                                          ; preds = %end661
  br label %condition671

else669:                                          ; preds = %end661
  br label %end670

end670:                                           ; preds = %else669, %afterLoop673
  ret i32 0
  ret i32 -1

condition671:                                     ; preds = %loop672, %then668
  %tmp_var_value674 = load i32, i32* %cnt1
  %tmp_var_value675 = load i32, i32* %cnt5
  %slttmp676 = icmp slt i32 %tmp_var_value674, %tmp_var_value675
  %whileCond677 = icmp ne i1 %slttmp676, false
  br i1 %whileCond677, label %loop672, label %afterLoop673

loop672:                                          ; preds = %condition671
  %tmp_var_value678 = load i32, i32* %cnt1
  %tmp_var_value679 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr680 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value678
  %tmp_array_value681 = load [256 x i8], [256 x i8]* %tmp_array_ptr680
  %tmp_var_value682 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] %tmp_array_value681, [256 x i8]* %tmp
  %tmp_var_value683 = load [256 x i8], [256 x i8]* %outl7
  %printstringsameline684 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), [256 x i8]* %outl7, [256 x i8] %tmp_var_value683)
  %tmp_var_value685 = load [256 x i8], [256 x i8]* %tmp
  %printstring686 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), [256 x i8]* %tmp, [256 x i8] %tmp_var_value685)
  %tmp_var_value687 = load i32, i32* %cnt1
  %addtmp688 = add i32 %tmp_var_value687, 1
  %tmp_var_value689 = load i32, i32* %cnt1
  store i32 %addtmp688, i32* %cnt1
  br label %condition671

afterLoop673:                                     ; preds = %condition671
  br label %end670
}
