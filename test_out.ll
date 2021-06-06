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

condition:                                        ; preds = %end206, %entry
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
  %tmp_var_value31 = load i8, i8* %tmpchar
  store i8 %tmp_var_value31, i8* %tmp_array_ptr
  %tmp_var_value32 = load i32, i32* %cnt2
  %addtmp = add i32 %tmp_var_value32, 1
  %tmp_var_value33 = load i32, i32* %cnt2
  store i32 %addtmp, i32* %cnt2
  %tmp_var_value34 = load i32, i32* %cnt1
  %tmp_var_value35 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr36 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value34
  %tmp_array_value = load i8, i8* %tmp_array_ptr36
  %tmp_var_value37 = load i8, i8* %sep
  store i8 %tmp_array_value, i8* %sep
  %tmp_var_value38 = load i32, i32* %part
  %eqtmp = icmp eq i32 %tmp_var_value38, 3
  %tmp_var_value39 = load i8, i8* %sep
  %eqtmp40 = icmp eq i8 %tmp_var_value39, 124
  %andtmp = and i1 %eqtmp, %eqtmp40
  %if_condition = icmp ne i1 %andtmp, false
  br i1 %if_condition, label %then, label %else

afterLoop:                                        ; preds = %condition
  br label %condition327

then:                                             ; preds = %loop
  %tmp_var_value41 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value42 = load i32, i32* @line
  %tmp_var_value43 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr44 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value42
  %tmp_var_value45 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_var_value45, [256 x i8]* %tmp_array_ptr44
  %tmp_var_value46 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value47 = load i32, i32* %part
  %subtmp = sub i32 %tmp_var_value47, 1
  %tmp_var_value48 = load i32, i32* %part
  store i32 %subtmp, i32* %part
  %tmp_var_value49 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  br label %end

else:                                             ; preds = %loop
  br label %end

end:                                              ; preds = %else, %then
  %tmp_var_value50 = load i32, i32* %part
  %eqtmp51 = icmp eq i32 %tmp_var_value50, 3
  %tmp_var_value52 = load i8, i8* %sep
  %netmp53 = icmp ne i8 %tmp_var_value52, 124
  %andtmp54 = and i1 %eqtmp51, %netmp53
  %if_condition55 = icmp ne i1 %andtmp54, false
  br i1 %if_condition55, label %then56, label %else57

then56:                                           ; preds = %end
  br label %condition59

else57:                                           ; preds = %end
  br label %end58

end58:                                            ; preds = %else57, %afterLoop61
  %tmp_var_value91 = load i32, i32* %part
  %eqtmp92 = icmp eq i32 %tmp_var_value91, 2
  %tmp_var_value93 = load i8, i8* %sep
  %eqtmp94 = icmp eq i8 %tmp_var_value93, 124
  %andtmp95 = and i1 %eqtmp92, %eqtmp94
  %if_condition96 = icmp ne i1 %andtmp95, false
  br i1 %if_condition96, label %then97, label %else98

condition59:                                      ; preds = %loop60, %then56
  %tmp_var_value62 = load i8, i8* %sep
  %netmp63 = icmp ne i8 %tmp_var_value62, 124
  %whileCond64 = icmp ne i1 %netmp63, false
  br i1 %whileCond64, label %loop60, label %afterLoop61

loop60:                                           ; preds = %condition59
  %tmp_var_value65 = load i8, i8* %sep
  %tmp_var_value66 = load i32, i32* %cnt2
  %tmp_var_value67 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr68 = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value66
  %tmp_var_value69 = load i8, i8* %sep
  store i8 %tmp_var_value69, i8* %tmp_array_ptr68
  %tmp_var_value70 = load i32, i32* %cnt2
  %addtmp71 = add i32 %tmp_var_value70, 1
  %tmp_var_value72 = load i32, i32* %cnt2
  store i32 %addtmp71, i32* %cnt2
  %tmp_var_value73 = load i32, i32* %cnt1
  %addtmp74 = add i32 %tmp_var_value73, 1
  %tmp_var_value75 = load i32, i32* %cnt1
  store i32 %addtmp74, i32* %cnt1
  %tmp_var_value76 = load i32, i32* %cnt1
  %tmp_var_value77 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr78 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value76
  %tmp_array_value79 = load i8, i8* %tmp_array_ptr78
  %tmp_var_value80 = load i8, i8* %sep
  store i8 %tmp_array_value79, i8* %sep
  br label %condition59

afterLoop61:                                      ; preds = %condition59
  %tmp_var_value81 = load i32, i32* %part
  %subtmp82 = sub i32 %tmp_var_value81, 1
  %tmp_var_value83 = load i32, i32* %part
  store i32 %subtmp82, i32* %part
  %tmp_var_value84 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value85 = load i32, i32* @line
  %tmp_var_value86 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr87 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value85
  %tmp_var_value88 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_var_value88, [256 x i8]* %tmp_array_ptr87
  %tmp_var_value89 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value90 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  br label %end58

then97:                                           ; preds = %end58
  %tmp_var_value100 = load i32, i32* %cnt1
  %addtmp101 = add i32 %tmp_var_value100, 1
  %tmp_var_value102 = load i32, i32* %cnt1
  store i32 %addtmp101, i32* %cnt1
  %tmp_var_value103 = load i32, i32* %cnt1
  %tmp_var_value104 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr105 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value103
  %tmp_array_value106 = load i8, i8* %tmp_array_ptr105
  %tmp_var_value107 = load i8, i8* %sep
  store i8 %tmp_array_value106, i8* %sep
  %tmp_var_value108 = load i8, i8* %sep
  %tmp_var_value109 = load i8, i8* %base
  %subtmp110 = sub i8 %tmp_var_value108, %tmp_var_value109
  %tmp_var_value111 = load i32, i32* %tmp_credit
  %0 = sext i8 %subtmp110 to i32
  store i32 %0, i32* %tmp_credit
  %tmp_var_value112 = load i32, i32* %tmp_credit
  %tmp_var_value113 = load i32, i32* @line
  %tmp_var_value114 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr115 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value113
  %tmp_var_value116 = load i32, i32* %tmp_credit
  store i32 %tmp_var_value116, i32* %tmp_array_ptr115
  %tmp_var_value117 = load i32, i32* %cnt1
  %addtmp118 = add i32 %tmp_var_value117, 1
  %tmp_var_value119 = load i32, i32* %cnt1
  store i32 %addtmp118, i32* %cnt1
  %tmp_var_value120 = load i32, i32* %part
  %subtmp121 = sub i32 %tmp_var_value120, 1
  %tmp_var_value122 = load i32, i32* %part
  store i32 %subtmp121, i32* %part
  %tmp_var_value123 = load i32, i32* %cnt1
  %addtmp124 = add i32 %tmp_var_value123, 1
  %tmp_var_value125 = load i32, i32* %cnt1
  store i32 %addtmp124, i32* %cnt1
  %tmp_var_value126 = load i32, i32* %cnt1
  %tmp_var_value127 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr128 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value126
  %tmp_array_value129 = load i8, i8* %tmp_array_ptr128
  %tmp_var_value130 = load i8, i8* %sep
  store i8 %tmp_array_value129, i8* %sep
  br label %end99

else98:                                           ; preds = %end58
  br label %end99

end99:                                            ; preds = %else98, %then97
  %tmp_var_value131 = load i32, i32* %part
  %eqtmp132 = icmp eq i32 %tmp_var_value131, 1
  %tmp_var_value133 = load i8, i8* %sep
  %netmp134 = icmp ne i8 %tmp_var_value133, 124
  %andtmp135 = and i1 %eqtmp132, %netmp134
  %if_condition136 = icmp ne i1 %andtmp135, false
  br i1 %if_condition136, label %then137, label %else138

then137:                                          ; preds = %end99
  br label %condition140

else138:                                          ; preds = %end99
  %tmp_var_value177 = load i32, i32* %part
  %eqtmp178 = icmp eq i32 %tmp_var_value177, 1
  %tmp_var_value179 = load i8, i8* %sep
  %eqtmp180 = icmp eq i8 %tmp_var_value179, 124
  %andtmp181 = and i1 %eqtmp178, %eqtmp180
  %if_condition182 = icmp ne i1 %andtmp181, false
  br i1 %if_condition182, label %then183, label %else184

end139:                                           ; preds = %end185, %afterLoop142
  %tmp_var_value198 = load i32, i32* %part
  %eqtmp199 = icmp eq i32 %tmp_var_value198, 0
  %tmp_var_value200 = load i8, i8* %sep
  %eqtmp201 = icmp eq i8 %tmp_var_value200, 124
  %andtmp202 = and i1 %eqtmp199, %eqtmp201
  %if_condition203 = icmp ne i1 %andtmp202, false
  br i1 %if_condition203, label %then204, label %else205

condition140:                                     ; preds = %loop141, %then137
  %tmp_var_value143 = load i8, i8* %sep
  %netmp144 = icmp ne i8 %tmp_var_value143, 124
  %whileCond145 = icmp ne i1 %netmp144, false
  br i1 %whileCond145, label %loop141, label %afterLoop142

loop141:                                          ; preds = %condition140
  %tmp_var_value146 = load i8, i8* %sep
  %tmp_var_value147 = load i32, i32* %cnt2
  %tmp_var_value148 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_array_ptr149 = getelementptr [256 x i8], [256 x i8]* %tmp_lc, i32 0, i32 %tmp_var_value147
  %tmp_var_value150 = load i8, i8* %sep
  store i8 %tmp_var_value150, i8* %tmp_array_ptr149
  %tmp_var_value151 = load i32, i32* %cnt2
  %addtmp152 = add i32 %tmp_var_value151, 1
  %tmp_var_value153 = load i32, i32* %cnt2
  store i32 %addtmp152, i32* %cnt2
  %tmp_var_value154 = load i32, i32* %cnt1
  %addtmp155 = add i32 %tmp_var_value154, 1
  %tmp_var_value156 = load i32, i32* %cnt1
  store i32 %addtmp155, i32* %cnt1
  %tmp_var_value157 = load i32, i32* %cnt1
  %tmp_var_value158 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr159 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value157
  %tmp_array_value160 = load i8, i8* %tmp_array_ptr159
  %tmp_var_value161 = load i8, i8* %sep
  store i8 %tmp_array_value160, i8* %sep
  br label %condition140

afterLoop142:                                     ; preds = %condition140
  %tmp_var_value162 = load i32, i32* %part
  %subtmp163 = sub i32 %tmp_var_value162, 1
  %tmp_var_value164 = load i32, i32* %part
  store i32 %subtmp163, i32* %part
  %tmp_var_value165 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value166 = load i32, i32* @line
  %tmp_var_value167 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr168 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value166
  %tmp_var_value169 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value169, [256 x i8]* %tmp_array_ptr168
  %tmp_var_value170 = load i32, i32* %cnt2
  %tmp_var_value171 = load i32, i32* @line
  %tmp_var_value172 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr173 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value171
  %tmp_var_value174 = load i32, i32* %cnt2
  store i32 %tmp_var_value174, i32* %tmp_array_ptr173
  %tmp_var_value175 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value176 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  br label %end139

then183:                                          ; preds = %else138
  %tmp_var_value186 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value187 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value188 = load i32, i32* @line
  %tmp_var_value189 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr190 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value188
  %tmp_var_value191 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value191, [256 x i8]* %tmp_array_ptr190
  %tmp_var_value192 = load i32, i32* @line
  %tmp_var_value193 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr194 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value192
  store i32 0, i32* %tmp_array_ptr194
  %tmp_var_value195 = load i32, i32* %part
  %subtmp196 = sub i32 %tmp_var_value195, 1
  %tmp_var_value197 = load i32, i32* %part
  store i32 %subtmp196, i32* %part
  br label %end185

else184:                                          ; preds = %else138
  br label %end185

end185:                                           ; preds = %else184, %then183
  br label %end139

then204:                                          ; preds = %end139
  %tmp_var_value207 = load i32, i32* %cnt1
  %addtmp208 = add i32 %tmp_var_value207, 1
  %tmp_var_value209 = load i32, i32* %cnt1
  store i32 %addtmp208, i32* %cnt1
  %tmp_var_value210 = load i32, i32* %cnt1
  %tmp_var_value211 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr212 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value210
  %tmp_array_value213 = load i8, i8* %tmp_array_ptr212
  %tmp_var_value214 = load i8, i8* %sep
  store i8 %tmp_array_value213, i8* %sep
  %tmp_var_value215 = load i8, i8* %sep
  %eqtmp216 = icmp eq i8 %tmp_var_value215, 65
  %if_condition217 = icmp ne i1 %eqtmp216, false
  br i1 %if_condition217, label %then218, label %else219

else205:                                          ; preds = %end139
  br label %end206

end206:                                           ; preds = %else205, %end220
  %tmp_var_value318 = load i32, i32* @line
  %addtmp319 = add i32 %tmp_var_value318, 1
  %tmp_var_value320 = load i32, i32* @line
  store i32 %addtmp319, i32* @line
  %tmp_var_value321 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp
  %tmp_var_value322 = load i32, i32* %part
  store i32 3, i32* %part
  %tmp_var_value323 = load i8, i8* %newline
  %scanf324 = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* %newline)
  %tmp_var_value325 = load i8, i8* %tmpchar
  %scanf326 = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %tmpchar)
  br label %condition

then218:                                          ; preds = %then204
  %tmp_var_value221 = load i32, i32* @line
  %tmp_var_value222 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr223 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value221
  store i32 4, i32* %tmp_array_ptr223
  %tmp_var_value224 = load i32, i32* @line
  %tmp_var_value225 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr226 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value224
  store i32 0, i32* %tmp_array_ptr226
  %tmp_var_value227 = load i32, i32* @line
  %tmp_var_value228 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr229 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value227
  store i32 1, i32* %tmp_array_ptr229
  %tmp_var_value230 = load i32, i32* @line
  %tmp_var_value231 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr232 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value230
  store i32 1, i32* %tmp_array_ptr232
  br label %end220

else219:                                          ; preds = %then204
  %tmp_var_value233 = load i8, i8* %sep
  %eqtmp234 = icmp eq i8 %tmp_var_value233, 66
  %if_condition235 = icmp ne i1 %eqtmp234, false
  br i1 %if_condition235, label %then236, label %else237

end220:                                           ; preds = %end238, %then218
  %tmp_var_value317 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  br label %end206

then236:                                          ; preds = %else219
  %tmp_var_value239 = load i32, i32* @line
  %tmp_var_value240 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr241 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value239
  store i32 3, i32* %tmp_array_ptr241
  %tmp_var_value242 = load i32, i32* @line
  %tmp_var_value243 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr244 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value242
  store i32 0, i32* %tmp_array_ptr244
  %tmp_var_value245 = load i32, i32* @line
  %tmp_var_value246 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr247 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value245
  store i32 1, i32* %tmp_array_ptr247
  %tmp_var_value248 = load i32, i32* @line
  %tmp_var_value249 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr250 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value248
  store i32 1, i32* %tmp_array_ptr250
  br label %end238

else237:                                          ; preds = %else219
  %tmp_var_value251 = load i8, i8* %sep
  %eqtmp252 = icmp eq i8 %tmp_var_value251, 67
  %if_condition253 = icmp ne i1 %eqtmp252, false
  br i1 %if_condition253, label %then254, label %else255

end238:                                           ; preds = %end256, %then236
  br label %end220

then254:                                          ; preds = %else237
  %tmp_var_value257 = load i32, i32* @line
  %tmp_var_value258 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr259 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value257
  store i32 2, i32* %tmp_array_ptr259
  %tmp_var_value260 = load i32, i32* @line
  %tmp_var_value261 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr262 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value260
  store i32 0, i32* %tmp_array_ptr262
  %tmp_var_value263 = load i32, i32* @line
  %tmp_var_value264 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr265 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value263
  store i32 1, i32* %tmp_array_ptr265
  %tmp_var_value266 = load i32, i32* @line
  %tmp_var_value267 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr268 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value266
  store i32 1, i32* %tmp_array_ptr268
  br label %end256

else255:                                          ; preds = %else237
  %tmp_var_value269 = load i8, i8* %sep
  %eqtmp270 = icmp eq i8 %tmp_var_value269, 68
  %if_condition271 = icmp ne i1 %eqtmp270, false
  br i1 %if_condition271, label %then272, label %else273

end256:                                           ; preds = %end274, %then254
  br label %end238

then272:                                          ; preds = %else255
  %tmp_var_value275 = load i32, i32* @line
  %tmp_var_value276 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr277 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value275
  store i32 1, i32* %tmp_array_ptr277
  %tmp_var_value278 = load i32, i32* @line
  %tmp_var_value279 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr280 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value278
  store i32 0, i32* %tmp_array_ptr280
  %tmp_var_value281 = load i32, i32* @line
  %tmp_var_value282 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr283 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value281
  store i32 1, i32* %tmp_array_ptr283
  %tmp_var_value284 = load i32, i32* @line
  %tmp_var_value285 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr286 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value284
  store i32 1, i32* %tmp_array_ptr286
  br label %end274

else273:                                          ; preds = %else255
  %tmp_var_value287 = load i8, i8* %sep
  %eqtmp288 = icmp eq i8 %tmp_var_value287, 70
  %if_condition289 = icmp ne i1 %eqtmp288, false
  br i1 %if_condition289, label %then290, label %else291

end274:                                           ; preds = %end292, %then272
  br label %end256

then290:                                          ; preds = %else273
  %tmp_var_value293 = load i32, i32* @line
  %tmp_var_value294 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr295 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value293
  store i32 0, i32* %tmp_array_ptr295
  %tmp_var_value296 = load i32, i32* @line
  %tmp_var_value297 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr298 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value296
  store i32 1, i32* %tmp_array_ptr298
  %tmp_var_value299 = load i32, i32* @line
  %tmp_var_value300 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr301 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value299
  store i32 1, i32* %tmp_array_ptr301
  %tmp_var_value302 = load i32, i32* @line
  %tmp_var_value303 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr304 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value302
  store i32 0, i32* %tmp_array_ptr304
  br label %end292

else291:                                          ; preds = %else273
  %tmp_var_value305 = load i32, i32* @line
  %tmp_var_value306 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr307 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value305
  store i32 0, i32* %tmp_array_ptr307
  %tmp_var_value308 = load i32, i32* @line
  %tmp_var_value309 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr310 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value308
  store i32 0, i32* %tmp_array_ptr310
  %tmp_var_value311 = load i32, i32* @line
  %tmp_var_value312 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr313 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value311
  store i32 0, i32* %tmp_array_ptr313
  %tmp_var_value314 = load i32, i32* @line
  %tmp_var_value315 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr316 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value314
  store i32 0, i32* %tmp_array_ptr316
  br label %end292

end292:                                           ; preds = %else291, %then290
  br label %end274

condition327:                                     ; preds = %end347, %afterLoop
  %tmp_var_value330 = load i32, i32* %cnt1
  %tmp_var_value331 = load i32, i32* @line
  %slttmp = icmp slt i32 %tmp_var_value330, %tmp_var_value331
  %whileCond332 = icmp ne i1 %slttmp, false
  br i1 %whileCond332, label %loop328, label %afterLoop329

loop328:                                          ; preds = %condition327
  %tmp_var_value333 = load i32, i32* %cnt1
  %tmp_var_value334 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr335 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value333
  %tmp_array_value336 = load i32, i32* %tmp_array_ptr335
  %eqtmp337 = icmp eq i32 %tmp_array_value336, 1
  %tmp_var_value338 = load i32, i32* %cnt1
  %tmp_var_value339 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr340 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value338
  %tmp_array_value341 = load i32, i32* %tmp_array_ptr340
  %eqtmp342 = icmp eq i32 %tmp_array_value341, 0
  %andtmp343 = and i1 %eqtmp337, %eqtmp342
  %if_condition344 = icmp ne i1 %andtmp343, false
  br i1 %if_condition344, label %then345, label %else346

afterLoop329:                                     ; preds = %condition327
  %tmp_var_value419 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value420 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value421 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value422 = load i32, i32* %cnt4
  store i32 0, i32* %cnt4
  %tmp_var_value423 = load i32, i32* %cnt5
  store i32 0, i32* %cnt5
  %tmp_var_value424 = load i32, i32* %cnt6
  store i32 0, i32* %cnt6
  %tmp_var_value425 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  %tmp_var_value426 = load i32, i32* %flag2
  store i32 1, i32* %flag2
  %tmp_var_value427 = load i32, i32* %total_grade
  %eqtmp428 = icmp eq i32 %tmp_var_value427, 0
  %if_condition429 = icmp ne i1 %eqtmp428, false
  br i1 %if_condition429, label %then430, label %else431

then345:                                          ; preds = %loop328
  %tmp_var_value348 = load i32, i32* %try_credit
  %tmp_var_value349 = load i32, i32* %cnt1
  %tmp_var_value350 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr351 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value349
  %tmp_array_value352 = load i32, i32* %tmp_array_ptr351
  %addtmp353 = add i32 %tmp_var_value348, %tmp_array_value352
  %tmp_var_value354 = load i32, i32* %try_credit
  store i32 %addtmp353, i32* %try_credit
  %tmp_var_value355 = load i32, i32* %total_credit
  %tmp_var_value356 = load i32, i32* %cnt1
  %tmp_var_value357 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr358 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value356
  %tmp_array_value359 = load i32, i32* %tmp_array_ptr358
  %addtmp360 = add i32 %tmp_var_value355, %tmp_array_value359
  %tmp_var_value361 = load i32, i32* %total_credit
  store i32 %addtmp360, i32* %total_credit
  %tmp_var_value362 = load i32, i32* %done_credit
  %tmp_var_value363 = load i32, i32* %cnt1
  %tmp_var_value364 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr365 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value363
  %tmp_array_value366 = load i32, i32* %tmp_array_ptr365
  %addtmp367 = add i32 %tmp_var_value362, %tmp_array_value366
  %tmp_var_value368 = load i32, i32* %done_credit
  store i32 %addtmp367, i32* %done_credit
  %tmp_var_value369 = load i32, i32* %total_grade
  %tmp_var_value370 = load i32, i32* %cnt1
  %tmp_var_value371 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr372 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value370
  %tmp_array_value373 = load i32, i32* %tmp_array_ptr372
  %tmp_var_value374 = load i32, i32* %cnt1
  %tmp_var_value375 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr376 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value374
  %tmp_array_value377 = load i32, i32* %tmp_array_ptr376
  %multmp = mul i32 %tmp_array_value373, %tmp_array_value377
  %addtmp378 = add i32 %tmp_var_value369, %multmp
  %tmp_var_value379 = load i32, i32* %total_grade
  store i32 %addtmp378, i32* %total_grade
  br label %end347

else346:                                          ; preds = %loop328
  %tmp_var_value380 = load i32, i32* %cnt1
  %tmp_var_value381 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr382 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value380
  %tmp_array_value383 = load i32, i32* %tmp_array_ptr382
  %eqtmp384 = icmp eq i32 %tmp_array_value383, 1
  %tmp_var_value385 = load i32, i32* %cnt1
  %tmp_var_value386 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr387 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value385
  %tmp_array_value388 = load i32, i32* %tmp_array_ptr387
  %eqtmp389 = icmp eq i32 %tmp_array_value388, 1
  %andtmp390 = and i1 %eqtmp384, %eqtmp389
  %if_condition391 = icmp ne i1 %andtmp390, false
  br i1 %if_condition391, label %then392, label %else393

end347:                                           ; preds = %end394, %then345
  %tmp_var_value416 = load i32, i32* %cnt1
  %addtmp417 = add i32 %tmp_var_value416, 1
  %tmp_var_value418 = load i32, i32* %cnt1
  store i32 %addtmp417, i32* %cnt1
  br label %condition327

then392:                                          ; preds = %else346
  %tmp_var_value395 = load i32, i32* %total_credit
  %tmp_var_value396 = load i32, i32* %cnt1
  %tmp_var_value397 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr398 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value396
  %tmp_array_value399 = load i32, i32* %tmp_array_ptr398
  %addtmp400 = add i32 %tmp_var_value395, %tmp_array_value399
  %tmp_var_value401 = load i32, i32* %total_credit
  store i32 %addtmp400, i32* %total_credit
  %tmp_var_value402 = load i32, i32* %try_credit
  %tmp_var_value403 = load i32, i32* %cnt1
  %tmp_var_value404 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr405 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value403
  %tmp_array_value406 = load i32, i32* %tmp_array_ptr405
  %addtmp407 = add i32 %tmp_var_value402, %tmp_array_value406
  %tmp_var_value408 = load i32, i32* %try_credit
  store i32 %addtmp407, i32* %try_credit
  br label %end394

else393:                                          ; preds = %else346
  %tmp_var_value409 = load i32, i32* %total_credit
  %tmp_var_value410 = load i32, i32* %cnt1
  %tmp_var_value411 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr412 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value410
  %tmp_array_value413 = load i32, i32* %tmp_array_ptr412
  %addtmp414 = add i32 %tmp_var_value409, %tmp_array_value413
  %tmp_var_value415 = load i32, i32* %total_credit
  store i32 %addtmp414, i32* %total_credit
  br label %end394

end394:                                           ; preds = %else393, %then392
  br label %end347

then430:                                          ; preds = %afterLoop329
  %tmp_var_value433 = load double, double* %avg_grade
  store double 0.000000e+00, double* %avg_grade
  br label %end432

else431:                                          ; preds = %afterLoop329
  %tmp_var_value434 = load i32, i32* %total_grade
  %tmp_var_value435 = load i32, i32* %try_credit
  %1 = sitofp i32 %tmp_var_value434 to double
  %2 = sitofp i32 %tmp_var_value435 to double
  %div_d_tmp = fdiv double %1, %2
  %tmp_var_value436 = load double, double* %avg_grade
  store double %div_d_tmp, double* %avg_grade
  br label %end432

end432:                                           ; preds = %else431, %then430
  %tmp_var_value437 = load i32, i32* %total_credit
  %tmp_var_value438 = load i32, i32* %done_credit
  %subtmp439 = sub i32 %tmp_var_value437, %tmp_var_value438
  %tmp_var_value440 = load i32, i32* %remain_credit
  store i32 %subtmp439, i32* %remain_credit
  br label %condition441

condition441:                                     ; preds = %end456, %end432
  %tmp_var_value444 = load i32, i32* %cnt1
  %tmp_var_value445 = load i32, i32* @line
  %slttmp446 = icmp slt i32 %tmp_var_value444, %tmp_var_value445
  %whileCond447 = icmp ne i1 %slttmp446, false
  br i1 %whileCond447, label %loop442, label %afterLoop443

loop442:                                          ; preds = %condition441
  %tmp_var_value448 = load i32, i32* %cnt1
  %tmp_var_value449 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr450 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value448
  %tmp_array_value451 = load i32, i32* %tmp_array_ptr450
  %eqtmp452 = icmp eq i32 %tmp_array_value451, 0
  %if_condition453 = icmp ne i1 %eqtmp452, false
  br i1 %if_condition453, label %then454, label %else455

afterLoop443:                                     ; preds = %condition441
  %tmp_var_value650 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value651 = load [256 x i8], [256 x i8]* %outl1
  %printstringsameline = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), [256 x i8]* %outl1, [256 x i8] %tmp_var_value651)
  %tmp_var_value652 = load double, double* %avg_grade
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), double %tmp_var_value652)
  %tmp_var_value653 = load [256 x i8], [256 x i8]* %outl2
  %printstringsameline654 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), [256 x i8]* %outl2, [256 x i8] %tmp_var_value653)
  %tmp_var_value655 = load i32, i32* %try_credit
  %printf656 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %tmp_var_value655)
  %tmp_var_value657 = load [256 x i8], [256 x i8]* %outl3
  %printstringsameline658 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), [256 x i8]* %outl3, [256 x i8] %tmp_var_value657)
  %tmp_var_value659 = load i32, i32* %done_credit
  %printf660 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %tmp_var_value659)
  %tmp_var_value661 = load [256 x i8], [256 x i8]* %outl4
  %printstringsameline662 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), [256 x i8]* %outl4, [256 x i8] %tmp_var_value661)
  %tmp_var_value663 = load i32, i32* %remain_credit
  %printf664 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 %tmp_var_value663)
  %tmp_var_value665 = load [256 x i8], [256 x i8]* %outl5
  %printstring = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), [256 x i8]* %outl5, [256 x i8] %tmp_var_value665)
  %tmp_var_value666 = load [256 x i8], [256 x i8]* %outl6
  %printstring667 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), [256 x i8]* %outl6, [256 x i8] %tmp_var_value666)
  %tmp_var_value668 = load i32, i32* %total_credit
  %tmp_var_value669 = load i32, i32* %done_credit
  %eqtmp670 = icmp eq i32 %tmp_var_value668, %tmp_var_value669
  %if_condition671 = icmp ne i1 %eqtmp670, false
  br i1 %if_condition671, label %then672, label %else673

then454:                                          ; preds = %loop442
  %tmp_var_value457 = load i32, i32* %cnt1
  %tmp_var_value458 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr459 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value457
  %tmp_array_value460 = load i32, i32* %tmp_array_ptr459
  %eqtmp461 = icmp eq i32 %tmp_array_value460, 0
  %if_condition462 = icmp ne i1 %eqtmp461, false
  br i1 %if_condition462, label %then463, label %else464

else455:                                          ; preds = %loop442
  br label %end456

end456:                                           ; preds = %else455, %end465
  %tmp_var_value647 = load i32, i32* %cnt1
  %addtmp648 = add i32 %tmp_var_value647, 1
  %tmp_var_value649 = load i32, i32* %cnt1
  store i32 %addtmp648, i32* %cnt1
  br label %condition441

then463:                                          ; preds = %then454
  %tmp_var_value466 = load i32, i32* %cnt1
  %tmp_var_value467 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr468 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value466
  %tmp_array_value469 = load [256 x i8], [256 x i8]* %tmp_array_ptr468
  %tmp_var_value470 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_array_value469, [256 x i8]* %tmp_lc
  %tmp_var_value471 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value472 = load i32, i32* %cnt5
  %tmp_var_value473 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr474 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value472
  %tmp_var_value475 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value475, [256 x i8]* %tmp_array_ptr474
  %tmp_var_value476 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value477 = load i32, i32* %cnt5
  %addtmp478 = add i32 %tmp_var_value477, 1
  %tmp_var_value479 = load i32, i32* %cnt5
  store i32 %addtmp478, i32* %cnt5
  br label %end465

else464:                                          ; preds = %then454
  %tmp_var_value480 = load i32, i32* %cnt1
  %tmp_var_value481 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr482 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value480
  %tmp_array_value483 = load [256 x i8], [256 x i8]* %tmp_array_ptr482
  %tmp_var_value484 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] %tmp_array_value483, [256 x i8]* %tmp
  %tmp_var_value485 = load i32, i32* %cnt2
  %tmp_var_value486 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr487 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value485
  %tmp_array_value488 = load i8, i8* %tmp_array_ptr487
  %tmp_var_value489 = load i8, i8* %sep
  store i8 %tmp_array_value488, i8* %sep
  br label %condition490

end465:                                           ; preds = %end629, %then463
  br label %end456

condition490:                                     ; preds = %end615, %else464
  %tmp_var_value493 = load i32, i32* %cnt2
  %tmp_var_value494 = load i32, i32* %cnt1
  %tmp_var_value495 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr496 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value494
  %tmp_array_value497 = load i32, i32* %tmp_array_ptr496
  %slttmp498 = icmp slt i32 %tmp_var_value493, %tmp_array_value497
  %tmp_var_value499 = load i32, i32* %flag2
  %eqtmp500 = icmp eq i32 %tmp_var_value499, 1
  %andtmp501 = and i1 %slttmp498, %eqtmp500
  %whileCond502 = icmp ne i1 %andtmp501, false
  br i1 %whileCond502, label %loop491, label %afterLoop492

loop491:                                          ; preds = %condition490
  br label %condition503

afterLoop492:                                     ; preds = %condition490
  %tmp_var_value624 = load i32, i32* %flag2
  %eqtmp625 = icmp eq i32 %tmp_var_value624, 0
  %if_condition626 = icmp ne i1 %eqtmp625, false
  br i1 %if_condition626, label %then627, label %else628

condition503:                                     ; preds = %end563, %loop491
  %tmp_var_value506 = load i8, i8* %sep
  %netmp507 = icmp ne i8 %tmp_var_value506, 59
  %tmp_var_value508 = load i32, i32* %cnt2
  %tmp_var_value509 = load i32, i32* %cnt1
  %tmp_var_value510 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr511 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value509
  %tmp_array_value512 = load i32, i32* %tmp_array_ptr511
  %slttmp513 = icmp slt i32 %tmp_var_value508, %tmp_array_value512
  %andtmp514 = and i1 %netmp507, %slttmp513
  %whileCond515 = icmp ne i1 %andtmp514, false
  br i1 %whileCond515, label %loop504, label %afterLoop505

loop504:                                          ; preds = %condition503
  br label %condition516

afterLoop505:                                     ; preds = %condition503
  br label %condition572

condition516:                                     ; preds = %loop517, %loop504
  %tmp_var_value519 = load i8, i8* %sep
  %netmp520 = icmp ne i8 %tmp_var_value519, 59
  %tmp_var_value521 = load i8, i8* %sep
  %netmp522 = icmp ne i8 %tmp_var_value521, 44
  %andtmp523 = and i1 %netmp520, %netmp522
  %tmp_var_value524 = load i32, i32* %cnt2
  %tmp_var_value525 = load i32, i32* %cnt1
  %tmp_var_value526 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr527 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value525
  %tmp_array_value528 = load i32, i32* %tmp_array_ptr527
  %slttmp529 = icmp slt i32 %tmp_var_value524, %tmp_array_value528
  %andtmp530 = and i1 %andtmp523, %slttmp529
  %whileCond531 = icmp ne i1 %andtmp530, false
  br i1 %whileCond531, label %loop517, label %afterLoop518

loop517:                                          ; preds = %condition516
  %tmp_var_value532 = load i8, i8* %sep
  %tmp_var_value533 = load i32, i32* %cnt3
  %tmp_var_value534 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr535 = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value533
  %tmp_var_value536 = load i8, i8* %sep
  store i8 %tmp_var_value536, i8* %tmp_array_ptr535
  %tmp_var_value537 = load i32, i32* %cnt3
  %addtmp538 = add i32 %tmp_var_value537, 1
  %tmp_var_value539 = load i32, i32* %cnt3
  store i32 %addtmp538, i32* %cnt3
  %tmp_var_value540 = load i32, i32* %cnt2
  %addtmp541 = add i32 %tmp_var_value540, 1
  %tmp_var_value542 = load i32, i32* %cnt2
  store i32 %addtmp541, i32* %cnt2
  %tmp_var_value543 = load i32, i32* %cnt2
  %tmp_var_value544 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr545 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value543
  %tmp_array_value546 = load i8, i8* %tmp_array_ptr545
  %tmp_var_value547 = load i8, i8* %sep
  store i8 %tmp_array_value546, i8* %sep
  br label %condition516

afterLoop518:                                     ; preds = %condition516
  %tmp_var_value548 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value549 = load i32, i32* %cnt4
  %tmp_var_value550 = load [100 x [256 x i8]], [100 x [256 x i8]]* @l_list
  %tmp_array_ptr551 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @l_list, i32 0, i32 %tmp_var_value549
  %tmp_var_value552 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_var_value552, [256 x i8]* %tmp_array_ptr551
  %tmp_var_value553 = load i32, i32* %cnt4
  %addtmp554 = add i32 %tmp_var_value553, 1
  %tmp_var_value555 = load i32, i32* %cnt4
  store i32 %addtmp554, i32* %cnt4
  %tmp_var_value556 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value557 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value558 = load i8, i8* %sep
  %eqtmp559 = icmp eq i8 %tmp_var_value558, 44
  %if_condition560 = icmp ne i1 %eqtmp559, false
  br i1 %if_condition560, label %then561, label %else562

then561:                                          ; preds = %afterLoop518
  %tmp_var_value564 = load i32, i32* %cnt2
  %addtmp565 = add i32 %tmp_var_value564, 1
  %tmp_var_value566 = load i32, i32* %cnt2
  store i32 %addtmp565, i32* %cnt2
  br label %end563

else562:                                          ; preds = %afterLoop518
  br label %end563

end563:                                           ; preds = %else562, %then561
  %tmp_var_value567 = load i32, i32* %cnt2
  %tmp_var_value568 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr569 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value567
  %tmp_array_value570 = load i8, i8* %tmp_array_ptr569
  %tmp_var_value571 = load i8, i8* %sep
  store i8 %tmp_array_value570, i8* %sep
  br label %condition503

condition572:                                     ; preds = %end594, %afterLoop505
  %tmp_var_value575 = load i32, i32* %cnt6
  %tmp_var_value576 = load i32, i32* %cnt4
  %slttmp577 = icmp slt i32 %tmp_var_value575, %tmp_var_value576
  %tmp_var_value578 = load i32, i32* %flag1
  %eqtmp579 = icmp eq i32 %tmp_var_value578, 1
  %andtmp580 = and i1 %slttmp577, %eqtmp579
  %whileCond581 = icmp ne i1 %andtmp580, false
  br i1 %whileCond581, label %loop573, label %afterLoop574

loop573:                                          ; preds = %condition572
  %tmp_var_value582 = load i32, i32* %cnt6
  %tmp_var_value583 = load [100 x [256 x i8]], [100 x [256 x i8]]* @l_list
  %tmp_array_ptr584 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @l_list, i32 0, i32 %tmp_var_value582
  %tmp_array_value585 = load [256 x i8], [256 x i8]* %tmp_array_ptr584
  %tmp_var_value586 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_array_value585, [256 x i8]* %tmp_class
  %tmp_var_value587 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_call = call i32 @str_find([256 x i8] %tmp_var_value587)
  %tmp_var_value588 = load i32, i32* %index
  store i32 %tmp_call, i32* %index
  %tmp_var_value589 = load i32, i32* %index
  %eqtmp590 = icmp eq i32 %tmp_var_value589, 200
  %if_condition591 = icmp ne i1 %eqtmp590, false
  br i1 %if_condition591, label %then592, label %else593

afterLoop574:                                     ; preds = %condition572
  %tmp_var_value599 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value600 = load i32, i32* %flag1
  %eqtmp601 = icmp eq i32 %tmp_var_value600, 1
  %if_condition602 = icmp ne i1 %eqtmp601, false
  br i1 %if_condition602, label %then603, label %else604

then592:                                          ; preds = %loop573
  %tmp_var_value595 = load i32, i32* %flag1
  store i32 0, i32* %flag1
  br label %end594

else593:                                          ; preds = %loop573
  br label %end594

end594:                                           ; preds = %else593, %then592
  %tmp_var_value596 = load i32, i32* %cnt6
  %addtmp597 = add i32 %tmp_var_value596, 1
  %tmp_var_value598 = load i32, i32* %cnt6
  store i32 %addtmp597, i32* %cnt6
  br label %condition572

then603:                                          ; preds = %afterLoop574
  %tmp_var_value606 = load i32, i32* %flag2
  store i32 0, i32* %flag2
  br label %end605

else604:                                          ; preds = %afterLoop574
  %tmp_var_value607 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  br label %end605

end605:                                           ; preds = %else604, %then603
  %tmp_var_value608 = load i32, i32* %cnt6
  store i32 0, i32* %cnt6
  %tmp_var_value609 = load i32, i32* %cnt4
  store i32 0, i32* %cnt4
  %tmp_var_value610 = load i8, i8* %sep
  %eqtmp611 = icmp eq i8 %tmp_var_value610, 59
  %if_condition612 = icmp ne i1 %eqtmp611, false
  br i1 %if_condition612, label %then613, label %else614

then613:                                          ; preds = %end605
  %tmp_var_value616 = load i32, i32* %cnt2
  %addtmp617 = add i32 %tmp_var_value616, 1
  %tmp_var_value618 = load i32, i32* %cnt2
  store i32 %addtmp617, i32* %cnt2
  br label %end615

else614:                                          ; preds = %end605
  br label %end615

end615:                                           ; preds = %else614, %then613
  %tmp_var_value619 = load i32, i32* %cnt2
  %tmp_var_value620 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr621 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value619
  %tmp_array_value622 = load i8, i8* %tmp_array_ptr621
  %tmp_var_value623 = load i8, i8* %sep
  store i8 %tmp_array_value622, i8* %sep
  br label %condition490

then627:                                          ; preds = %afterLoop492
  %tmp_var_value630 = load i32, i32* %cnt1
  %tmp_var_value631 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr632 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value630
  %tmp_array_value633 = load [256 x i8], [256 x i8]* %tmp_array_ptr632
  %tmp_var_value634 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_array_value633, [256 x i8]* %tmp_lc
  %tmp_var_value635 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value636 = load i32, i32* %cnt5
  %tmp_var_value637 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr638 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value636
  %tmp_var_value639 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value639, [256 x i8]* %tmp_array_ptr638
  %tmp_var_value640 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value641 = load i32, i32* %cnt5
  %addtmp642 = add i32 %tmp_var_value641, 1
  %tmp_var_value643 = load i32, i32* %cnt5
  store i32 %addtmp642, i32* %cnt5
  br label %end629

else628:                                          ; preds = %afterLoop492
  br label %end629

end629:                                           ; preds = %else628, %then627
  %tmp_var_value644 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  %tmp_var_value645 = load i32, i32* %flag2
  store i32 1, i32* %flag2
  %tmp_var_value646 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  br label %end465

then672:                                          ; preds = %afterLoop443
  %tmp_var_value675 = load [256 x i8], [256 x i8]* %outl8
  %printstring676 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), [256 x i8]* %outl8, [256 x i8] %tmp_var_value675)
  br label %end674

else673:                                          ; preds = %afterLoop443
  br label %end674

end674:                                           ; preds = %else673, %then672
  %tmp_var_value677 = load i32, i32* %total_credit
  %tmp_var_value678 = load i32, i32* %done_credit
  %netmp679 = icmp ne i32 %tmp_var_value677, %tmp_var_value678
  %if_condition680 = icmp ne i1 %netmp679, false
  br i1 %if_condition680, label %then681, label %else682

then681:                                          ; preds = %end674
  br label %condition684

else682:                                          ; preds = %end674
  br label %end683

end683:                                           ; preds = %else682, %afterLoop686
  ret i32 0
  ret i32 -1

condition684:                                     ; preds = %loop685, %then681
  %tmp_var_value687 = load i32, i32* %cnt1
  %tmp_var_value688 = load i32, i32* %cnt5
  %slttmp689 = icmp slt i32 %tmp_var_value687, %tmp_var_value688
  %whileCond690 = icmp ne i1 %slttmp689, false
  br i1 %whileCond690, label %loop685, label %afterLoop686

loop685:                                          ; preds = %condition684
  %tmp_var_value691 = load i32, i32* %cnt1
  %tmp_var_value692 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr693 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value691
  %tmp_array_value694 = load [256 x i8], [256 x i8]* %tmp_array_ptr693
  %tmp_var_value695 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] %tmp_array_value694, [256 x i8]* %tmp
  %tmp_var_value696 = load [256 x i8], [256 x i8]* %outl7
  %printstringsameline697 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), [256 x i8]* %outl7, [256 x i8] %tmp_var_value696)
  %tmp_var_value698 = load [256 x i8], [256 x i8]* %tmp
  %printstring699 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), [256 x i8]* %tmp, [256 x i8] %tmp_var_value698)
  %tmp_var_value700 = load i32, i32* %cnt1
  %addtmp701 = add i32 %tmp_var_value700, 1
  %tmp_var_value702 = load i32, i32* %cnt1
  store i32 %addtmp701, i32* %cnt1
  br label %condition684

afterLoop686:                                     ; preds = %condition684
  br label %end683
}
