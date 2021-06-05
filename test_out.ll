; ModuleID = 'main'
source_filename = "main"

@class = global [100 x [256 x i8]] zeroinitializer
@leading_course = global [100 x [256 x i8]] zeroinitializer
@l_list = global [100 x [256 x i8]] zeroinitializer
@acc_course = global [100 x [256 x i8]] zeroinitializer
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
@.str.14 = constant [3 x i8] c"%s\00"
@.str.15 = constant [4 x i8] c"%s\0A\00"

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
  %slttmp = icmp slt i32 %tmp_var_value1, 256
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
  %tmp_var_value = load [256 x i8], [256 x i8]* %outl1
  store [256 x i8] c"GPA: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl1
  %tmp_var_value1 = load [256 x i8], [256 x i8]* %outl2
  store [256 x i8] c"Hours Attempted: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl2
  %tmp_var_value2 = load [256 x i8], [256 x i8]* %outl3
  store [256 x i8] c"Hours Completed: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl3
  %tmp_var_value3 = load [256 x i8], [256 x i8]* %outl4
  store [256 x i8] c"Credits Remaining: \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl4
  %tmp_var_value4 = load [256 x i8], [256 x i8]* %outl5
  store [256 x i8] zeroinitializer, [256 x i8]* %outl5
  %tmp_var_value5 = load [256 x i8], [256 x i8]* %outl6
  store [256 x i8] c"Possible Courses to Take Next\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl6
  %tmp_var_value6 = load [256 x i8], [256 x i8]* %outl7
  store [256 x i8] c"  \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [256 x i8]* %outl7
  %tmp_var_value7 = load i32, i32* %total_credit
  store i32 0, i32* %total_credit
  %tmp_var_value8 = load i32, i32* %try_credit
  store i32 0, i32* %try_credit
  %tmp_var_value9 = load i32, i32* %total_grade
  store i32 0, i32* %total_grade
  %tmp_var_value10 = load i32, i32* %done_credit
  store i32 0, i32* %done_credit
  %tmp_var_value11 = load i32, i32* %remain_credit
  store i32 0, i32* %remain_credit
  %tmp_var_value12 = load i8, i8* %base
  store i8 48, i8* %base
  %tmp_var_value13 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value14 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value15 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value16 = load i32, i32* %part
  store i32 3, i32* %part
  %tmp_var_value17 = load i32, i32* @line
  store i32 0, i32* @line
  %tmp_var_value18 = load i32, i32* %flag1
  store i32 0, i32* %flag1
  %tmp_var_value19 = load i32, i32* %flag2
  store i32 0, i32* %flag2
  %tmp_var_value20 = load i8, i8* %tmpchar
  %scanf = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %tmpchar)
  br label %condition

condition:                                        ; preds = %end183, %entry
  %tmp_var_value21 = load i8, i8* %tmpchar
  %tmp_var_value22 = load i8, i8* %newline
  %netmp = icmp ne i8 %tmp_var_value21, %tmp_var_value22
  %whileCond = icmp ne i1 %netmp, false
  br i1 %whileCond, label %loop, label %afterLoop

loop:                                             ; preds = %condition
  %tmp_var_value23 = load [256 x i8], [256 x i8]* %tmp
  %scanfstring = call i32 (...) @scanf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), [256 x i8]* %tmp, [256 x i8] %tmp_var_value23)
  %tmp_var_value24 = load i8, i8* %tmpchar
  %tmp_var_value25 = load i32, i32* %cnt2
  %tmp_var_value26 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value25
  %tmp_var_value27 = load i8, i8* %tmpchar
  store i8 %tmp_var_value27, i8* %tmp_array_ptr
  %tmp_var_value28 = load i32, i32* %cnt2
  %addtmp = add i32 %tmp_var_value28, 1
  %tmp_var_value29 = load i32, i32* %cnt2
  store i32 %addtmp, i32* %cnt2
  %tmp_var_value30 = load i32, i32* %cnt1
  %tmp_var_value31 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr32 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value30
  %tmp_array_value = load i8, i8* %tmp_array_ptr32
  %tmp_var_value33 = load i8, i8* %sep
  store i8 %tmp_array_value, i8* %sep
  %tmp_var_value34 = load i32, i32* %part
  %eqtmp = icmp eq i32 %tmp_var_value34, 3
  %tmp_var_value35 = load i8, i8* %sep
  %netmp36 = icmp ne i8 %tmp_var_value35, 124
  %andtmp = and i1 %eqtmp, %netmp36
  %if_condition = icmp ne i1 %andtmp, false
  br i1 %if_condition, label %then, label %else

afterLoop:                                        ; preds = %condition
  br label %condition304

then:                                             ; preds = %loop
  br label %condition37

else:                                             ; preds = %loop
  br label %end

end:                                              ; preds = %else, %afterLoop39
  %tmp_var_value68 = load i32, i32* %part
  %eqtmp69 = icmp eq i32 %tmp_var_value68, 2
  %tmp_var_value70 = load i8, i8* %sep
  %eqtmp71 = icmp eq i8 %tmp_var_value70, 124
  %andtmp72 = and i1 %eqtmp69, %eqtmp71
  %if_condition73 = icmp ne i1 %andtmp72, false
  br i1 %if_condition73, label %then74, label %else75

condition37:                                      ; preds = %loop38, %then
  %tmp_var_value40 = load i8, i8* %sep
  %netmp41 = icmp ne i8 %tmp_var_value40, 124
  %whileCond42 = icmp ne i1 %netmp41, false
  br i1 %whileCond42, label %loop38, label %afterLoop39

loop38:                                           ; preds = %condition37
  %tmp_var_value43 = load i8, i8* %sep
  %tmp_var_value44 = load i32, i32* %cnt2
  %tmp_var_value45 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr46 = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value44
  %tmp_var_value47 = load i8, i8* %sep
  store i8 %tmp_var_value47, i8* %tmp_array_ptr46
  %tmp_var_value48 = load i32, i32* %cnt2
  %addtmp49 = add i32 %tmp_var_value48, 1
  %tmp_var_value50 = load i32, i32* %cnt2
  store i32 %addtmp49, i32* %cnt2
  %tmp_var_value51 = load i32, i32* %cnt1
  %addtmp52 = add i32 %tmp_var_value51, 1
  %tmp_var_value53 = load i32, i32* %cnt1
  store i32 %addtmp52, i32* %cnt1
  %tmp_var_value54 = load i32, i32* %cnt1
  %tmp_var_value55 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr56 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value54
  %tmp_array_value57 = load i8, i8* %tmp_array_ptr56
  %tmp_var_value58 = load i8, i8* %sep
  store i8 %tmp_array_value57, i8* %sep
  br label %condition37

afterLoop39:                                      ; preds = %condition37
  %tmp_var_value59 = load i32, i32* %part
  %subtmp = sub i32 %tmp_var_value59, 1
  %tmp_var_value60 = load i32, i32* %part
  store i32 %subtmp, i32* %part
  %tmp_var_value61 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value62 = load i32, i32* @line
  %tmp_var_value63 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr64 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value62
  %tmp_var_value65 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_var_value65, [256 x i8]* %tmp_array_ptr64
  %tmp_var_value66 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value67 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  br label %end

then74:                                           ; preds = %end
  %tmp_var_value77 = load i32, i32* %cnt1
  %addtmp78 = add i32 %tmp_var_value77, 1
  %tmp_var_value79 = load i32, i32* %cnt1
  store i32 %addtmp78, i32* %cnt1
  %tmp_var_value80 = load i32, i32* %cnt1
  %tmp_var_value81 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr82 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value80
  %tmp_array_value83 = load i8, i8* %tmp_array_ptr82
  %tmp_var_value84 = load i8, i8* %sep
  store i8 %tmp_array_value83, i8* %sep
  %tmp_var_value85 = load i8, i8* %sep
  %tmp_var_value86 = load i8, i8* %base
  %subtmp87 = sub i8 %tmp_var_value85, %tmp_var_value86
  %tmp_var_value88 = load i32, i32* %tmp_credit
  %0 = sext i8 %subtmp87 to i32
  store i32 %0, i32* %tmp_credit
  %tmp_var_value89 = load i32, i32* %tmp_credit
  %tmp_var_value90 = load i32, i32* @line
  %tmp_var_value91 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr92 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value90
  %tmp_var_value93 = load i32, i32* %tmp_credit
  store i32 %tmp_var_value93, i32* %tmp_array_ptr92
  %tmp_var_value94 = load i32, i32* %cnt1
  %addtmp95 = add i32 %tmp_var_value94, 1
  %tmp_var_value96 = load i32, i32* %cnt1
  store i32 %addtmp95, i32* %cnt1
  %tmp_var_value97 = load i32, i32* %part
  %subtmp98 = sub i32 %tmp_var_value97, 1
  %tmp_var_value99 = load i32, i32* %part
  store i32 %subtmp98, i32* %part
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
  br label %end76

else75:                                           ; preds = %end
  br label %end76

end76:                                            ; preds = %else75, %then74
  %tmp_var_value108 = load i32, i32* %part
  %eqtmp109 = icmp eq i32 %tmp_var_value108, 1
  %tmp_var_value110 = load i8, i8* %sep
  %netmp111 = icmp ne i8 %tmp_var_value110, 124
  %andtmp112 = and i1 %eqtmp109, %netmp111
  %if_condition113 = icmp ne i1 %andtmp112, false
  br i1 %if_condition113, label %then114, label %else115

then114:                                          ; preds = %end76
  br label %condition117

else115:                                          ; preds = %end76
  %tmp_var_value154 = load i32, i32* %part
  %eqtmp155 = icmp eq i32 %tmp_var_value154, 1
  %tmp_var_value156 = load i8, i8* %sep
  %eqtmp157 = icmp eq i8 %tmp_var_value156, 124
  %andtmp158 = and i1 %eqtmp155, %eqtmp157
  %if_condition159 = icmp ne i1 %andtmp158, false
  br i1 %if_condition159, label %then160, label %else161

end116:                                           ; preds = %end162, %afterLoop119
  %tmp_var_value175 = load i32, i32* %part
  %eqtmp176 = icmp eq i32 %tmp_var_value175, 0
  %tmp_var_value177 = load i8, i8* %sep
  %eqtmp178 = icmp eq i8 %tmp_var_value177, 124
  %andtmp179 = and i1 %eqtmp176, %eqtmp178
  %if_condition180 = icmp ne i1 %andtmp179, false
  br i1 %if_condition180, label %then181, label %else182

condition117:                                     ; preds = %loop118, %then114
  %tmp_var_value120 = load i8, i8* %sep
  %netmp121 = icmp ne i8 %tmp_var_value120, 124
  %whileCond122 = icmp ne i1 %netmp121, false
  br i1 %whileCond122, label %loop118, label %afterLoop119

loop118:                                          ; preds = %condition117
  %tmp_var_value123 = load i8, i8* %sep
  %tmp_var_value124 = load i32, i32* %cnt2
  %tmp_var_value125 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_array_ptr126 = getelementptr [256 x i8], [256 x i8]* %tmp_lc, i32 0, i32 %tmp_var_value124
  %tmp_var_value127 = load i8, i8* %sep
  store i8 %tmp_var_value127, i8* %tmp_array_ptr126
  %tmp_var_value128 = load i32, i32* %cnt2
  %addtmp129 = add i32 %tmp_var_value128, 1
  %tmp_var_value130 = load i32, i32* %cnt2
  store i32 %addtmp129, i32* %cnt2
  %tmp_var_value131 = load i32, i32* %cnt1
  %addtmp132 = add i32 %tmp_var_value131, 1
  %tmp_var_value133 = load i32, i32* %cnt1
  store i32 %addtmp132, i32* %cnt1
  %tmp_var_value134 = load i32, i32* %cnt1
  %tmp_var_value135 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr136 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value134
  %tmp_array_value137 = load i8, i8* %tmp_array_ptr136
  %tmp_var_value138 = load i8, i8* %sep
  store i8 %tmp_array_value137, i8* %sep
  br label %condition117

afterLoop119:                                     ; preds = %condition117
  %tmp_var_value139 = load i32, i32* %part
  %subtmp140 = sub i32 %tmp_var_value139, 1
  %tmp_var_value141 = load i32, i32* %part
  store i32 %subtmp140, i32* %part
  %tmp_var_value142 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value143 = load i32, i32* @line
  %tmp_var_value144 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr145 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value143
  %tmp_var_value146 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value146, [256 x i8]* %tmp_array_ptr145
  %tmp_var_value147 = load i32, i32* %cnt2
  %tmp_var_value148 = load i32, i32* @line
  %tmp_var_value149 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr150 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value148
  %tmp_var_value151 = load i32, i32* %cnt2
  store i32 %tmp_var_value151, i32* %tmp_array_ptr150
  %tmp_var_value152 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value153 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  br label %end116

then160:                                          ; preds = %else115
  %tmp_var_value163 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value164 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value165 = load i32, i32* @line
  %tmp_var_value166 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr167 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value165
  %tmp_var_value168 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value168, [256 x i8]* %tmp_array_ptr167
  %tmp_var_value169 = load i32, i32* @line
  %tmp_var_value170 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr171 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value169
  store i32 0, i32* %tmp_array_ptr171
  %tmp_var_value172 = load i32, i32* %part
  %subtmp173 = sub i32 %tmp_var_value172, 1
  %tmp_var_value174 = load i32, i32* %part
  store i32 %subtmp173, i32* %part
  br label %end162

else161:                                          ; preds = %else115
  br label %end162

end162:                                           ; preds = %else161, %then160
  br label %end116

then181:                                          ; preds = %end116
  %tmp_var_value184 = load i32, i32* %cnt1
  %addtmp185 = add i32 %tmp_var_value184, 1
  %tmp_var_value186 = load i32, i32* %cnt1
  store i32 %addtmp185, i32* %cnt1
  %tmp_var_value187 = load i32, i32* %cnt1
  %tmp_var_value188 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr189 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value187
  %tmp_array_value190 = load i8, i8* %tmp_array_ptr189
  %tmp_var_value191 = load i8, i8* %sep
  store i8 %tmp_array_value190, i8* %sep
  %tmp_var_value192 = load i8, i8* %sep
  %eqtmp193 = icmp eq i8 %tmp_var_value192, 65
  %if_condition194 = icmp ne i1 %eqtmp193, false
  br i1 %if_condition194, label %then195, label %else196

else182:                                          ; preds = %end116
  br label %end183

end183:                                           ; preds = %else182, %end197
  %tmp_var_value295 = load i32, i32* @line
  %addtmp296 = add i32 %tmp_var_value295, 1
  %tmp_var_value297 = load i32, i32* @line
  store i32 %addtmp296, i32* @line
  %tmp_var_value298 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp
  %tmp_var_value299 = load i32, i32* %part
  store i32 3, i32* %part
  %tmp_var_value300 = load i8, i8* %newline
  %scanf301 = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* %newline)
  %tmp_var_value302 = load i8, i8* %tmpchar
  %scanf303 = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* %tmpchar)
  br label %condition

then195:                                          ; preds = %then181
  %tmp_var_value198 = load i32, i32* @line
  %tmp_var_value199 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr200 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value198
  store i32 4, i32* %tmp_array_ptr200
  %tmp_var_value201 = load i32, i32* @line
  %tmp_var_value202 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr203 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value201
  store i32 0, i32* %tmp_array_ptr203
  %tmp_var_value204 = load i32, i32* @line
  %tmp_var_value205 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr206 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value204
  store i32 1, i32* %tmp_array_ptr206
  %tmp_var_value207 = load i32, i32* @line
  %tmp_var_value208 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr209 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value207
  store i32 1, i32* %tmp_array_ptr209
  br label %end197

else196:                                          ; preds = %then181
  %tmp_var_value210 = load i8, i8* %sep
  %eqtmp211 = icmp eq i8 %tmp_var_value210, 66
  %if_condition212 = icmp ne i1 %eqtmp211, false
  br i1 %if_condition212, label %then213, label %else214

end197:                                           ; preds = %end215, %then195
  %tmp_var_value294 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  br label %end183

then213:                                          ; preds = %else196
  %tmp_var_value216 = load i32, i32* @line
  %tmp_var_value217 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr218 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value216
  store i32 3, i32* %tmp_array_ptr218
  %tmp_var_value219 = load i32, i32* @line
  %tmp_var_value220 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr221 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value219
  store i32 0, i32* %tmp_array_ptr221
  %tmp_var_value222 = load i32, i32* @line
  %tmp_var_value223 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr224 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value222
  store i32 1, i32* %tmp_array_ptr224
  %tmp_var_value225 = load i32, i32* @line
  %tmp_var_value226 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr227 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value225
  store i32 1, i32* %tmp_array_ptr227
  br label %end215

else214:                                          ; preds = %else196
  %tmp_var_value228 = load i8, i8* %sep
  %eqtmp229 = icmp eq i8 %tmp_var_value228, 67
  %if_condition230 = icmp ne i1 %eqtmp229, false
  br i1 %if_condition230, label %then231, label %else232

end215:                                           ; preds = %end233, %then213
  br label %end197

then231:                                          ; preds = %else214
  %tmp_var_value234 = load i32, i32* @line
  %tmp_var_value235 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr236 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value234
  store i32 2, i32* %tmp_array_ptr236
  %tmp_var_value237 = load i32, i32* @line
  %tmp_var_value238 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr239 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value237
  store i32 0, i32* %tmp_array_ptr239
  %tmp_var_value240 = load i32, i32* @line
  %tmp_var_value241 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr242 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value240
  store i32 1, i32* %tmp_array_ptr242
  %tmp_var_value243 = load i32, i32* @line
  %tmp_var_value244 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr245 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value243
  store i32 1, i32* %tmp_array_ptr245
  br label %end233

else232:                                          ; preds = %else214
  %tmp_var_value246 = load i8, i8* %sep
  %eqtmp247 = icmp eq i8 %tmp_var_value246, 68
  %if_condition248 = icmp ne i1 %eqtmp247, false
  br i1 %if_condition248, label %then249, label %else250

end233:                                           ; preds = %end251, %then231
  br label %end215

then249:                                          ; preds = %else232
  %tmp_var_value252 = load i32, i32* @line
  %tmp_var_value253 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr254 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value252
  store i32 1, i32* %tmp_array_ptr254
  %tmp_var_value255 = load i32, i32* @line
  %tmp_var_value256 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr257 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value255
  store i32 0, i32* %tmp_array_ptr257
  %tmp_var_value258 = load i32, i32* @line
  %tmp_var_value259 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr260 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value258
  store i32 1, i32* %tmp_array_ptr260
  %tmp_var_value261 = load i32, i32* @line
  %tmp_var_value262 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr263 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value261
  store i32 1, i32* %tmp_array_ptr263
  br label %end251

else250:                                          ; preds = %else232
  %tmp_var_value264 = load i8, i8* %sep
  %eqtmp265 = icmp eq i8 %tmp_var_value264, 70
  %if_condition266 = icmp ne i1 %eqtmp265, false
  br i1 %if_condition266, label %then267, label %else268

end251:                                           ; preds = %end269, %then249
  br label %end233

then267:                                          ; preds = %else250
  %tmp_var_value270 = load i32, i32* @line
  %tmp_var_value271 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr272 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value270
  store i32 0, i32* %tmp_array_ptr272
  %tmp_var_value273 = load i32, i32* @line
  %tmp_var_value274 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr275 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value273
  store i32 1, i32* %tmp_array_ptr275
  %tmp_var_value276 = load i32, i32* @line
  %tmp_var_value277 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr278 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value276
  store i32 1, i32* %tmp_array_ptr278
  %tmp_var_value279 = load i32, i32* @line
  %tmp_var_value280 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr281 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value279
  store i32 0, i32* %tmp_array_ptr281
  br label %end269

else268:                                          ; preds = %else250
  %tmp_var_value282 = load i32, i32* @line
  %tmp_var_value283 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr284 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value282
  store i32 0, i32* %tmp_array_ptr284
  %tmp_var_value285 = load i32, i32* @line
  %tmp_var_value286 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr287 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value285
  store i32 0, i32* %tmp_array_ptr287
  %tmp_var_value288 = load i32, i32* @line
  %tmp_var_value289 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr290 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value288
  store i32 0, i32* %tmp_array_ptr290
  %tmp_var_value291 = load i32, i32* @line
  %tmp_var_value292 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr293 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value291
  store i32 0, i32* %tmp_array_ptr293
  br label %end269

end269:                                           ; preds = %else268, %then267
  br label %end251

condition304:                                     ; preds = %end324, %afterLoop
  %tmp_var_value307 = load i32, i32* %cnt1
  %tmp_var_value308 = load i32, i32* @line
  %slttmp = icmp slt i32 %tmp_var_value307, %tmp_var_value308
  %whileCond309 = icmp ne i1 %slttmp, false
  br i1 %whileCond309, label %loop305, label %afterLoop306

loop305:                                          ; preds = %condition304
  %tmp_var_value310 = load i32, i32* %cnt1
  %tmp_var_value311 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr312 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value310
  %tmp_array_value313 = load i32, i32* %tmp_array_ptr312
  %eqtmp314 = icmp eq i32 %tmp_array_value313, 1
  %tmp_var_value315 = load i32, i32* %cnt1
  %tmp_var_value316 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr317 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value315
  %tmp_array_value318 = load i32, i32* %tmp_array_ptr317
  %eqtmp319 = icmp eq i32 %tmp_array_value318, 0
  %andtmp320 = and i1 %eqtmp314, %eqtmp319
  %if_condition321 = icmp ne i1 %andtmp320, false
  br i1 %if_condition321, label %then322, label %else323

afterLoop306:                                     ; preds = %condition304
  %tmp_var_value396 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value397 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  %tmp_var_value398 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value399 = load i32, i32* %cnt4
  store i32 0, i32* %cnt4
  %tmp_var_value400 = load i32, i32* %cnt5
  store i32 0, i32* %cnt5
  %tmp_var_value401 = load i32, i32* %cnt6
  store i32 0, i32* %cnt6
  %tmp_var_value402 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  %tmp_var_value403 = load i32, i32* %flag2
  store i32 1, i32* %flag2
  %tmp_var_value404 = load i32, i32* %total_grade
  %eqtmp405 = icmp eq i32 %tmp_var_value404, 0
  %if_condition406 = icmp ne i1 %eqtmp405, false
  br i1 %if_condition406, label %then407, label %else408

then322:                                          ; preds = %loop305
  %tmp_var_value325 = load i32, i32* %try_credit
  %tmp_var_value326 = load i32, i32* %cnt1
  %tmp_var_value327 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr328 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value326
  %tmp_array_value329 = load i32, i32* %tmp_array_ptr328
  %addtmp330 = add i32 %tmp_var_value325, %tmp_array_value329
  %tmp_var_value331 = load i32, i32* %try_credit
  store i32 %addtmp330, i32* %try_credit
  %tmp_var_value332 = load i32, i32* %total_credit
  %tmp_var_value333 = load i32, i32* %cnt1
  %tmp_var_value334 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr335 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value333
  %tmp_array_value336 = load i32, i32* %tmp_array_ptr335
  %addtmp337 = add i32 %tmp_var_value332, %tmp_array_value336
  %tmp_var_value338 = load i32, i32* %total_credit
  store i32 %addtmp337, i32* %total_credit
  %tmp_var_value339 = load i32, i32* %done_credit
  %tmp_var_value340 = load i32, i32* %cnt1
  %tmp_var_value341 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr342 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value340
  %tmp_array_value343 = load i32, i32* %tmp_array_ptr342
  %addtmp344 = add i32 %tmp_var_value339, %tmp_array_value343
  %tmp_var_value345 = load i32, i32* %done_credit
  store i32 %addtmp344, i32* %done_credit
  %tmp_var_value346 = load i32, i32* %total_grade
  %tmp_var_value347 = load i32, i32* %cnt1
  %tmp_var_value348 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr349 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value347
  %tmp_array_value350 = load i32, i32* %tmp_array_ptr349
  %tmp_var_value351 = load i32, i32* %cnt1
  %tmp_var_value352 = load [100 x i32], [100 x i32]* @grade
  %tmp_array_ptr353 = getelementptr [100 x i32], [100 x i32]* @grade, i32 0, i32 %tmp_var_value351
  %tmp_array_value354 = load i32, i32* %tmp_array_ptr353
  %multmp = mul i32 %tmp_array_value350, %tmp_array_value354
  %addtmp355 = add i32 %tmp_var_value346, %multmp
  %tmp_var_value356 = load i32, i32* %total_grade
  store i32 %addtmp355, i32* %total_grade
  br label %end324

else323:                                          ; preds = %loop305
  %tmp_var_value357 = load i32, i32* %cnt1
  %tmp_var_value358 = load [100 x i32], [100 x i32]* @has_grade
  %tmp_array_ptr359 = getelementptr [100 x i32], [100 x i32]* @has_grade, i32 0, i32 %tmp_var_value357
  %tmp_array_value360 = load i32, i32* %tmp_array_ptr359
  %eqtmp361 = icmp eq i32 %tmp_array_value360, 1
  %tmp_var_value362 = load i32, i32* %cnt1
  %tmp_var_value363 = load [100 x i32], [100 x i32]* @is_f
  %tmp_array_ptr364 = getelementptr [100 x i32], [100 x i32]* @is_f, i32 0, i32 %tmp_var_value362
  %tmp_array_value365 = load i32, i32* %tmp_array_ptr364
  %eqtmp366 = icmp eq i32 %tmp_array_value365, 1
  %andtmp367 = and i1 %eqtmp361, %eqtmp366
  %if_condition368 = icmp ne i1 %andtmp367, false
  br i1 %if_condition368, label %then369, label %else370

end324:                                           ; preds = %end371, %then322
  %tmp_var_value393 = load i32, i32* %cnt1
  %addtmp394 = add i32 %tmp_var_value393, 1
  %tmp_var_value395 = load i32, i32* %cnt1
  store i32 %addtmp394, i32* %cnt1
  br label %condition304

then369:                                          ; preds = %else323
  %tmp_var_value372 = load i32, i32* %total_credit
  %tmp_var_value373 = load i32, i32* %cnt1
  %tmp_var_value374 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr375 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value373
  %tmp_array_value376 = load i32, i32* %tmp_array_ptr375
  %addtmp377 = add i32 %tmp_var_value372, %tmp_array_value376
  %tmp_var_value378 = load i32, i32* %total_credit
  store i32 %addtmp377, i32* %total_credit
  %tmp_var_value379 = load i32, i32* %try_credit
  %tmp_var_value380 = load i32, i32* %cnt1
  %tmp_var_value381 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr382 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value380
  %tmp_array_value383 = load i32, i32* %tmp_array_ptr382
  %addtmp384 = add i32 %tmp_var_value379, %tmp_array_value383
  %tmp_var_value385 = load i32, i32* %try_credit
  store i32 %addtmp384, i32* %try_credit
  br label %end371

else370:                                          ; preds = %else323
  %tmp_var_value386 = load i32, i32* %total_credit
  %tmp_var_value387 = load i32, i32* %cnt1
  %tmp_var_value388 = load [100 x i32], [100 x i32]* @credit
  %tmp_array_ptr389 = getelementptr [100 x i32], [100 x i32]* @credit, i32 0, i32 %tmp_var_value387
  %tmp_array_value390 = load i32, i32* %tmp_array_ptr389
  %addtmp391 = add i32 %tmp_var_value386, %tmp_array_value390
  %tmp_var_value392 = load i32, i32* %total_credit
  store i32 %addtmp391, i32* %total_credit
  br label %end371

end371:                                           ; preds = %else370, %then369
  br label %end324

then407:                                          ; preds = %afterLoop306
  %tmp_var_value410 = load double, double* %avg_grade
  store double 0.000000e+00, double* %avg_grade
  br label %end409

else408:                                          ; preds = %afterLoop306
  %tmp_var_value411 = load i32, i32* %total_grade
  %tmp_var_value412 = load i32, i32* %try_credit
  %1 = sitofp i32 %tmp_var_value411 to double
  %2 = sitofp i32 %tmp_var_value412 to double
  %div_d_tmp = fdiv double %1, %2
  %tmp_var_value413 = load double, double* %avg_grade
  store double %div_d_tmp, double* %avg_grade
  br label %end409

end409:                                           ; preds = %else408, %then407
  %tmp_var_value414 = load i32, i32* %total_credit
  %tmp_var_value415 = load i32, i32* %done_credit
  %subtmp416 = sub i32 %tmp_var_value414, %tmp_var_value415
  %tmp_var_value417 = load i32, i32* %remain_credit
  store i32 %subtmp416, i32* %remain_credit
  br label %condition418

condition418:                                     ; preds = %end433, %end409
  %tmp_var_value421 = load i32, i32* %cnt1
  %tmp_var_value422 = load i32, i32* @line
  %slttmp423 = icmp slt i32 %tmp_var_value421, %tmp_var_value422
  %whileCond424 = icmp ne i1 %slttmp423, false
  br i1 %whileCond424, label %loop419, label %afterLoop420

loop419:                                          ; preds = %condition418
  %tmp_var_value425 = load i32, i32* %cnt1
  %tmp_var_value426 = load [100 x i32], [100 x i32]* @is_learned
  %tmp_array_ptr427 = getelementptr [100 x i32], [100 x i32]* @is_learned, i32 0, i32 %tmp_var_value425
  %tmp_array_value428 = load i32, i32* %tmp_array_ptr427
  %eqtmp429 = icmp eq i32 %tmp_array_value428, 0
  %if_condition430 = icmp ne i1 %eqtmp429, false
  br i1 %if_condition430, label %then431, label %else432

afterLoop420:                                     ; preds = %condition418
  %tmp_var_value621 = load i32, i32* %cnt1
  store i32 0, i32* %cnt1
  %tmp_var_value622 = load [256 x i8], [256 x i8]* %outl1
  %printstringsameline = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), [256 x i8]* %outl1, [256 x i8] %tmp_var_value622)
  %tmp_var_value623 = load double, double* %avg_grade
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), double %tmp_var_value623)
  %tmp_var_value624 = load [256 x i8], [256 x i8]* %outl2
  %printstringsameline625 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), [256 x i8]* %outl2, [256 x i8] %tmp_var_value624)
  %tmp_var_value626 = load i32, i32* %try_credit
  %printf627 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i32 0, i32 0), i32 %tmp_var_value626)
  %tmp_var_value628 = load [256 x i8], [256 x i8]* %outl3
  %printstringsameline629 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), [256 x i8]* %outl3, [256 x i8] %tmp_var_value628)
  %tmp_var_value630 = load i32, i32* %done_credit
  %printf631 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 %tmp_var_value630)
  %tmp_var_value632 = load [256 x i8], [256 x i8]* %outl4
  %printstringsameline633 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), [256 x i8]* %outl4, [256 x i8] %tmp_var_value632)
  %tmp_var_value634 = load i32, i32* %remain_credit
  %printf635 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 %tmp_var_value634)
  %tmp_var_value636 = load [256 x i8], [256 x i8]* %outl5
  %printstring = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), [256 x i8]* %outl5, [256 x i8] %tmp_var_value636)
  %tmp_var_value637 = load [256 x i8], [256 x i8]* %outl6
  %printstring638 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), [256 x i8]* %outl6, [256 x i8] %tmp_var_value637)
  br label %condition639

then431:                                          ; preds = %loop419
  %tmp_var_value434 = load i32, i32* %cnt1
  %tmp_var_value435 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr436 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value434
  %tmp_array_value437 = load i32, i32* %tmp_array_ptr436
  %eqtmp438 = icmp eq i32 %tmp_array_value437, 0
  %if_condition439 = icmp ne i1 %eqtmp438, false
  br i1 %if_condition439, label %then440, label %else441

else432:                                          ; preds = %loop419
  br label %end433

end433:                                           ; preds = %else432, %end442
  %tmp_var_value618 = load i32, i32* %cnt1
  %addtmp619 = add i32 %tmp_var_value618, 1
  %tmp_var_value620 = load i32, i32* %cnt1
  store i32 %addtmp619, i32* %cnt1
  br label %condition418

then440:                                          ; preds = %then431
  %tmp_var_value443 = load i32, i32* %cnt1
  %tmp_var_value444 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr445 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value443
  %tmp_array_value446 = load [256 x i8], [256 x i8]* %tmp_array_ptr445
  %tmp_var_value447 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_array_value446, [256 x i8]* %tmp_lc
  %tmp_var_value448 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value449 = load i32, i32* %cnt5
  %tmp_var_value450 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr451 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value449
  %tmp_var_value452 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value452, [256 x i8]* %tmp_array_ptr451
  %tmp_var_value453 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value454 = load i32, i32* %cnt5
  %addtmp455 = add i32 %tmp_var_value454, 1
  %tmp_var_value456 = load i32, i32* %cnt5
  store i32 %addtmp455, i32* %cnt5
  br label %end442

else441:                                          ; preds = %then431
  %tmp_var_value457 = load i32, i32* %cnt1
  %tmp_var_value458 = load [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course
  %tmp_array_ptr459 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @leading_course, i32 0, i32 %tmp_var_value457
  %tmp_array_value460 = load [256 x i8], [256 x i8]* %tmp_array_ptr459
  %tmp_var_value461 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] %tmp_array_value460, [256 x i8]* %tmp
  %tmp_var_value462 = load i32, i32* %cnt2
  %tmp_var_value463 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr464 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value462
  %tmp_array_value465 = load i8, i8* %tmp_array_ptr464
  %tmp_var_value466 = load i8, i8* %sep
  store i8 %tmp_array_value465, i8* %sep
  br label %condition467

end442:                                           ; preds = %end600, %then440
  br label %end433

condition467:                                     ; preds = %end591, %else441
  %tmp_var_value470 = load i32, i32* %cnt2
  %tmp_var_value471 = load i32, i32* %cnt1
  %tmp_var_value472 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr473 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value471
  %tmp_array_value474 = load i32, i32* %tmp_array_ptr473
  %slttmp475 = icmp slt i32 %tmp_var_value470, %tmp_array_value474
  %tmp_var_value476 = load i32, i32* %flag2
  %eqtmp477 = icmp eq i32 %tmp_var_value476, 1
  %andtmp478 = and i1 %slttmp475, %eqtmp477
  %whileCond479 = icmp ne i1 %andtmp478, false
  br i1 %whileCond479, label %loop468, label %afterLoop469

loop468:                                          ; preds = %condition467
  br label %condition480

afterLoop469:                                     ; preds = %condition467
  %tmp_var_value595 = load i32, i32* %flag2
  %eqtmp596 = icmp eq i32 %tmp_var_value595, 0
  %if_condition597 = icmp ne i1 %eqtmp596, false
  br i1 %if_condition597, label %then598, label %else599

condition480:                                     ; preds = %end545, %loop468
  %tmp_var_value483 = load i8, i8* %sep
  %netmp484 = icmp ne i8 %tmp_var_value483, 59
  %tmp_var_value485 = load i32, i32* %cnt2
  %tmp_var_value486 = load i32, i32* %cnt1
  %tmp_var_value487 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr488 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value486
  %tmp_array_value489 = load i32, i32* %tmp_array_ptr488
  %slttmp490 = icmp slt i32 %tmp_var_value485, %tmp_array_value489
  %andtmp491 = and i1 %netmp484, %slttmp490
  %whileCond492 = icmp ne i1 %andtmp491, false
  br i1 %whileCond492, label %loop481, label %afterLoop482

loop481:                                          ; preds = %condition480
  br label %condition493

afterLoop482:                                     ; preds = %condition480
  br label %condition549

condition493:                                     ; preds = %loop494, %loop481
  %tmp_var_value496 = load i8, i8* %sep
  %netmp497 = icmp ne i8 %tmp_var_value496, 59
  %tmp_var_value498 = load i8, i8* %sep
  %netmp499 = icmp ne i8 %tmp_var_value498, 44
  %andtmp500 = and i1 %netmp497, %netmp499
  %tmp_var_value501 = load i32, i32* %cnt2
  %tmp_var_value502 = load i32, i32* %cnt1
  %tmp_var_value503 = load [100 x i32], [100 x i32]* @c_length
  %tmp_array_ptr504 = getelementptr [100 x i32], [100 x i32]* @c_length, i32 0, i32 %tmp_var_value502
  %tmp_array_value505 = load i32, i32* %tmp_array_ptr504
  %slttmp506 = icmp slt i32 %tmp_var_value501, %tmp_array_value505
  %andtmp507 = and i1 %andtmp500, %slttmp506
  %whileCond508 = icmp ne i1 %andtmp507, false
  br i1 %whileCond508, label %loop494, label %afterLoop495

loop494:                                          ; preds = %condition493
  %tmp_var_value509 = load i32, i32* %cnt2
  %tmp_var_value510 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr511 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value509
  %tmp_array_value512 = load i8, i8* %tmp_array_ptr511
  %tmp_var_value513 = load i8, i8* %sep
  store i8 %tmp_array_value512, i8* %sep
  %tmp_var_value514 = load i8, i8* %sep
  %tmp_var_value515 = load i32, i32* %cnt3
  %tmp_var_value516 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_array_ptr517 = getelementptr [256 x i8], [256 x i8]* %tmp_class, i32 0, i32 %tmp_var_value515
  %tmp_var_value518 = load i8, i8* %sep
  store i8 %tmp_var_value518, i8* %tmp_array_ptr517
  %tmp_var_value519 = load i32, i32* %cnt3
  %addtmp520 = add i32 %tmp_var_value519, 1
  %tmp_var_value521 = load i32, i32* %cnt3
  store i32 %addtmp520, i32* %cnt3
  %tmp_var_value522 = load i32, i32* %cnt2
  %addtmp523 = add i32 %tmp_var_value522, 1
  %tmp_var_value524 = load i32, i32* %cnt2
  store i32 %addtmp523, i32* %cnt2
  %tmp_var_value525 = load i32, i32* %cnt2
  %tmp_var_value526 = load [256 x i8], [256 x i8]* %tmp
  %tmp_array_ptr527 = getelementptr [256 x i8], [256 x i8]* %tmp, i32 0, i32 %tmp_var_value525
  %tmp_array_value528 = load i8, i8* %tmp_array_ptr527
  %tmp_var_value529 = load i8, i8* %sep
  store i8 %tmp_array_value528, i8* %sep
  br label %condition493

afterLoop495:                                     ; preds = %condition493
  %tmp_var_value530 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_var_value531 = load i32, i32* %cnt4
  %tmp_var_value532 = load [100 x [256 x i8]], [100 x [256 x i8]]* @l_list
  %tmp_array_ptr533 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @l_list, i32 0, i32 %tmp_var_value531
  %tmp_var_value534 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_var_value534, [256 x i8]* %tmp_array_ptr533
  %tmp_var_value535 = load i32, i32* %cnt4
  %addtmp536 = add i32 %tmp_var_value535, 1
  %tmp_var_value537 = load i32, i32* %cnt4
  store i32 %addtmp536, i32* %cnt4
  %tmp_var_value538 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value539 = load i32, i32* %cnt3
  store i32 0, i32* %cnt3
  %tmp_var_value540 = load i8, i8* %sep
  %eqtmp541 = icmp eq i8 %tmp_var_value540, 44
  %if_condition542 = icmp ne i1 %eqtmp541, false
  br i1 %if_condition542, label %then543, label %else544

then543:                                          ; preds = %afterLoop495
  %tmp_var_value546 = load i32, i32* %cnt2
  %addtmp547 = add i32 %tmp_var_value546, 1
  %tmp_var_value548 = load i32, i32* %cnt2
  store i32 %addtmp547, i32* %cnt2
  br label %end545

else544:                                          ; preds = %afterLoop495
  br label %end545

end545:                                           ; preds = %else544, %then543
  br label %condition480

condition549:                                     ; preds = %end571, %afterLoop482
  %tmp_var_value552 = load i32, i32* %cnt6
  %tmp_var_value553 = load i32, i32* %cnt4
  %slttmp554 = icmp slt i32 %tmp_var_value552, %tmp_var_value553
  %tmp_var_value555 = load i32, i32* %flag1
  %eqtmp556 = icmp eq i32 %tmp_var_value555, 1
  %andtmp557 = and i1 %slttmp554, %eqtmp556
  %whileCond558 = icmp ne i1 %andtmp557, false
  br i1 %whileCond558, label %loop550, label %afterLoop551

loop550:                                          ; preds = %condition549
  %tmp_var_value559 = load i32, i32* %cnt6
  %tmp_var_value560 = load [100 x [256 x i8]], [100 x [256 x i8]]* @l_list
  %tmp_array_ptr561 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @l_list, i32 0, i32 %tmp_var_value559
  %tmp_array_value562 = load [256 x i8], [256 x i8]* %tmp_array_ptr561
  %tmp_var_value563 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] %tmp_array_value562, [256 x i8]* %tmp_class
  %tmp_var_value564 = load [256 x i8], [256 x i8]* %tmp_class
  %tmp_call = call i32 @str_find([256 x i8] %tmp_var_value564)
  %tmp_var_value565 = load i32, i32* %index
  store i32 %tmp_call, i32* %index
  %tmp_var_value566 = load i32, i32* %index
  %eqtmp567 = icmp eq i32 %tmp_var_value566, 200
  %if_condition568 = icmp ne i1 %eqtmp567, false
  br i1 %if_condition568, label %then569, label %else570

afterLoop551:                                     ; preds = %condition549
  %tmp_var_value576 = load [256 x i8], [256 x i8]* %tmp_class
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_class
  %tmp_var_value577 = load i32, i32* %flag1
  %eqtmp578 = icmp eq i32 %tmp_var_value577, 1
  %if_condition579 = icmp ne i1 %eqtmp578, false
  br i1 %if_condition579, label %then580, label %else581

then569:                                          ; preds = %loop550
  %tmp_var_value572 = load i32, i32* %flag1
  store i32 0, i32* %flag1
  br label %end571

else570:                                          ; preds = %loop550
  br label %end571

end571:                                           ; preds = %else570, %then569
  %tmp_var_value573 = load i32, i32* %cnt6
  %addtmp574 = add i32 %tmp_var_value573, 1
  %tmp_var_value575 = load i32, i32* %cnt6
  store i32 %addtmp574, i32* %cnt6
  br label %condition549

then580:                                          ; preds = %afterLoop551
  %tmp_var_value583 = load i32, i32* %flag2
  store i32 0, i32* %flag2
  br label %end582

else581:                                          ; preds = %afterLoop551
  br label %end582

end582:                                           ; preds = %else581, %then580
  %tmp_var_value584 = load i32, i32* %cnt6
  store i32 0, i32* %cnt6
  %tmp_var_value585 = load i32, i32* %cnt4
  store i32 0, i32* %cnt4
  %tmp_var_value586 = load i8, i8* %sep
  %eqtmp587 = icmp eq i8 %tmp_var_value586, 59
  %if_condition588 = icmp ne i1 %eqtmp587, false
  br i1 %if_condition588, label %then589, label %else590

then589:                                          ; preds = %end582
  %tmp_var_value592 = load i32, i32* %cnt2
  %addtmp593 = add i32 %tmp_var_value592, 1
  %tmp_var_value594 = load i32, i32* %cnt2
  store i32 %addtmp593, i32* %cnt2
  br label %end591

else590:                                          ; preds = %end582
  br label %end591

end591:                                           ; preds = %else590, %then589
  br label %condition467

then598:                                          ; preds = %afterLoop469
  %tmp_var_value601 = load i32, i32* %cnt1
  %tmp_var_value602 = load [100 x [256 x i8]], [100 x [256 x i8]]* @class
  %tmp_array_ptr603 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @class, i32 0, i32 %tmp_var_value601
  %tmp_array_value604 = load [256 x i8], [256 x i8]* %tmp_array_ptr603
  %tmp_var_value605 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_array_value604, [256 x i8]* %tmp_lc
  %tmp_var_value606 = load [256 x i8], [256 x i8]* %tmp_lc
  %tmp_var_value607 = load i32, i32* %cnt5
  %tmp_var_value608 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr609 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value607
  %tmp_var_value610 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] %tmp_var_value610, [256 x i8]* %tmp_array_ptr609
  %tmp_var_value611 = load [256 x i8], [256 x i8]* %tmp_lc
  store [256 x i8] zeroinitializer, [256 x i8]* %tmp_lc
  %tmp_var_value612 = load i32, i32* %cnt5
  %addtmp613 = add i32 %tmp_var_value612, 1
  %tmp_var_value614 = load i32, i32* %cnt5
  store i32 %addtmp613, i32* %cnt5
  br label %end600

else599:                                          ; preds = %afterLoop469
  br label %end600

end600:                                           ; preds = %else599, %then598
  %tmp_var_value615 = load i32, i32* %flag1
  store i32 1, i32* %flag1
  %tmp_var_value616 = load i32, i32* %flag2
  store i32 1, i32* %flag2
  %tmp_var_value617 = load i32, i32* %cnt2
  store i32 0, i32* %cnt2
  br label %end442

condition639:                                     ; preds = %loop640, %afterLoop420
  %tmp_var_value642 = load i32, i32* %cnt1
  %tmp_var_value643 = load i32, i32* %cnt5
  %slttmp644 = icmp slt i32 %tmp_var_value642, %tmp_var_value643
  %whileCond645 = icmp ne i1 %slttmp644, false
  br i1 %whileCond645, label %loop640, label %afterLoop641

loop640:                                          ; preds = %condition639
  %tmp_var_value646 = load i32, i32* %cnt1
  %tmp_var_value647 = load [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course
  %tmp_array_ptr648 = getelementptr [100 x [256 x i8]], [100 x [256 x i8]]* @acc_course, i32 0, i32 %tmp_var_value646
  %tmp_array_value649 = load [256 x i8], [256 x i8]* %tmp_array_ptr648
  %tmp_var_value650 = load [256 x i8], [256 x i8]* %tmp
  store [256 x i8] %tmp_array_value649, [256 x i8]* %tmp
  %tmp_var_value651 = load [256 x i8], [256 x i8]* %outl7
  %printstringsameline652 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), [256 x i8]* %outl7, [256 x i8] %tmp_var_value651)
  %tmp_var_value653 = load [256 x i8], [256 x i8]* %tmp
  %printstring654 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0), [256 x i8]* %tmp, [256 x i8] %tmp_var_value653)
  %tmp_var_value655 = load i32, i32* %cnt1
  %addtmp656 = add i32 %tmp_var_value655, 1
  %tmp_var_value657 = load i32, i32* %cnt1
  store i32 %addtmp656, i32* %cnt1
  br label %condition639

afterLoop641:                                     ; preds = %condition639
  ret i32 0
  ret i32 -1
}
