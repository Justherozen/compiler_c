; ModuleID = 'main'
source_filename = "main"

@totalnum = global i32 0
@data = global [10000 x i32] zeroinitializer
@.str = constant [9 x i8] c"%d%*[^\0A]\00"
@.str.1 = constant [9 x i8] c"%d%*[^\0A]\00"
@.str.2 = constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @scanf(...)

define i32 @QS(i32 %0, i32 %1) {
entry:
  %low = alloca i32
  store i32 %0, i32* %low
  %high = alloca i32
  store i32 %1, i32* %high
  %first = alloca i32
  %last = alloca i32
  %key = alloca i32
  %funtmp = alloca i32
  %input1 = alloca i32
  %input2 = alloca i32
  %tmpfirst = alloca i32
  %tmplast = alloca i32
  %tmp_var_value = load i32, i32* %low
  store i32 %tmp_var_value, i32* %first
  %tmp_var_value1 = load i32, i32* %high
  store i32 %tmp_var_value1, i32* %last
  %tmp_var_value2 = load i32, i32* %first
  %tmp_var_value3 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value2
  %tmp_array_value = load i32, i32* %tmp_array_ptr
  store i32 %tmp_array_value, i32* %key
  %tmp_var_value4 = load i32, i32* %low
  %tmp_var_value5 = load i32, i32* %high
  %sgetmp = icmp sge i32 %tmp_var_value4, %tmp_var_value5
  %if_condition = icmp ne i1 %sgetmp, false
  br i1 %if_condition, label %then, label %else

then:                                             ; preds = %entry
  ret i32 0
  br label %end

else:                                             ; preds = %entry
  br label %end

end:                                              ; preds = %else, %then
  br label %condition

condition:                                        ; preds = %afterLoop32, %end
  %tmp_var_value6 = load i32, i32* %first
  %tmp_var_value7 = load i32, i32* %last
  %slttmp = icmp slt i32 %tmp_var_value6, %tmp_var_value7
  %whileCond = icmp ne i1 %slttmp, false
  br i1 %whileCond, label %loop, label %afterLoop

loop:                                             ; preds = %condition
  br label %condition8

afterLoop:                                        ; preds = %condition
  %tmp_var_value52 = load i32, i32* %first
  %tmp_var_value53 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr54 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value52
  %tmp_var_value55 = load i32, i32* %key
  store i32 %tmp_var_value55, i32* %tmp_array_ptr54
  %tmp_var_value56 = load i32, i32* %first
  %subtmp57 = sub i32 %tmp_var_value56, 1
  store i32 %subtmp57, i32* %input1
  %tmp_var_value58 = load i32, i32* %first
  %addtmp59 = add i32 %tmp_var_value58, 1
  store i32 %addtmp59, i32* %input2
  %tmp_var_value60 = load i32, i32* %low
  %tmp_var_value61 = load i32, i32* %input1
  %tmp_call = call i32 @QS(i32 %tmp_var_value60, i32 %tmp_var_value61)
  %tmp_var_value62 = load i32, i32* %input2
  %tmp_var_value63 = load i32, i32* %high
  %tmp_call64 = call i32 @QS(i32 %tmp_var_value62, i32 %tmp_var_value63)
  ret i32 0
  ret i32 -1

condition8:                                       ; preds = %loop9, %loop
  %tmp_var_value11 = load i32, i32* %first
  %tmp_var_value12 = load i32, i32* %last
  %slttmp13 = icmp slt i32 %tmp_var_value11, %tmp_var_value12
  %tmp_var_value14 = load i32, i32* %last
  %tmp_var_value15 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr16 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value14
  %tmp_array_value17 = load i32, i32* %tmp_array_ptr16
  %tmp_var_value18 = load i32, i32* %key
  %sgetmp19 = icmp sge i32 %tmp_array_value17, %tmp_var_value18
  %andtmp = and i1 %slttmp13, %sgetmp19
  %whileCond20 = icmp ne i1 %andtmp, false
  br i1 %whileCond20, label %loop9, label %afterLoop10

loop9:                                            ; preds = %condition8
  %tmp_var_value21 = load i32, i32* %last
  %subtmp = sub i32 %tmp_var_value21, 1
  store i32 %subtmp, i32* %last
  br label %condition8

afterLoop10:                                      ; preds = %condition8
  %tmp_var_value22 = load i32, i32* %last
  %tmp_var_value23 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr24 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value22
  %tmp_array_value25 = load i32, i32* %tmp_array_ptr24
  store i32 %tmp_array_value25, i32* %funtmp
  %tmp_var_value26 = load i32, i32* %first
  %tmp_var_value27 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr28 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value26
  %tmp_var_value29 = load i32, i32* %funtmp
  store i32 %tmp_var_value29, i32* %tmp_array_ptr28
  br label %condition30

condition30:                                      ; preds = %loop31, %afterLoop10
  %tmp_var_value33 = load i32, i32* %first
  %tmp_var_value34 = load i32, i32* %last
  %slttmp35 = icmp slt i32 %tmp_var_value33, %tmp_var_value34
  %tmp_var_value36 = load i32, i32* %first
  %tmp_var_value37 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr38 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value36
  %tmp_array_value39 = load i32, i32* %tmp_array_ptr38
  %tmp_var_value40 = load i32, i32* %key
  %sletmp = icmp sle i32 %tmp_array_value39, %tmp_var_value40
  %andtmp41 = and i1 %slttmp35, %sletmp
  %whileCond42 = icmp ne i1 %andtmp41, false
  br i1 %whileCond42, label %loop31, label %afterLoop32

loop31:                                           ; preds = %condition30
  %tmp_var_value43 = load i32, i32* %first
  %addtmp = add i32 %tmp_var_value43, 1
  store i32 %addtmp, i32* %first
  br label %condition30

afterLoop32:                                      ; preds = %condition30
  %tmp_var_value44 = load i32, i32* %first
  %tmp_var_value45 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr46 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value44
  %tmp_array_value47 = load i32, i32* %tmp_array_ptr46
  store i32 %tmp_array_value47, i32* %funtmp
  %tmp_var_value48 = load i32, i32* %last
  %tmp_var_value49 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr50 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value48
  %tmp_var_value51 = load i32, i32* %funtmp
  store i32 %tmp_var_value51, i32* %tmp_array_ptr50
  br label %condition
}

define i32 @main() {
entry:
  %tmp = alloca i32
  %i = alloca i32
  %test = alloca [256 x i8]
  %indextotalnum = alloca i32
  %tmp_var_value = load i32, i32* @totalnum
  %scanf = call i32 (...) @scanf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32* @totalnum)
  store i32 0, i32* %i
  %tmp_var_value1 = load i32, i32* @totalnum
  %subtmp = sub i32 %tmp_var_value1, 1
  store i32 %subtmp, i32* %indextotalnum
  br label %condition

condition:                                        ; preds = %loop, %entry
  %tmp_var_value2 = load i32, i32* %i
  %tmp_var_value3 = load i32, i32* @totalnum
  %slttmp = icmp slt i32 %tmp_var_value2, %tmp_var_value3
  %whileCond = icmp ne i1 %slttmp, false
  br i1 %whileCond, label %loop, label %afterLoop

loop:                                             ; preds = %condition
  %tmp_var_value4 = load i32, i32* %tmp
  %scanf5 = call i32 (...) @scanf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32* %tmp)
  %tmp_var_value6 = load i32, i32* %i
  %tmp_var_value7 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value6
  %tmp_var_value8 = load i32, i32* %tmp
  store i32 %tmp_var_value8, i32* %tmp_array_ptr
  %tmp_var_value9 = load i32, i32* %i
  %addtmp = add i32 %tmp_var_value9, 1
  store i32 %addtmp, i32* %i
  br label %condition

afterLoop:                                        ; preds = %condition
  %tmp_var_value10 = load i32, i32* %indextotalnum
  %tmp_call = call i32 @QS(i32 0, i32 %tmp_var_value10)
  store i32 0, i32* %i
  br label %condition11

condition11:                                      ; preds = %loop12, %afterLoop
  %tmp_var_value14 = load i32, i32* %i
  %tmp_var_value15 = load i32, i32* @totalnum
  %slttmp16 = icmp slt i32 %tmp_var_value14, %tmp_var_value15
  %whileCond17 = icmp ne i1 %slttmp16, false
  br i1 %whileCond17, label %loop12, label %afterLoop13

loop12:                                           ; preds = %condition11
  %tmp_var_value18 = load i32, i32* %i
  %tmp_var_value19 = load [10000 x i32], [10000 x i32]* @data
  %tmp_array_ptr20 = getelementptr [10000 x i32], [10000 x i32]* @data, i32 0, i32 %tmp_var_value18
  %tmp_array_value = load i32, i32* %tmp_array_ptr20
  store i32 %tmp_array_value, i32* %tmp
  %tmp_var_value21 = load i32, i32* %tmp
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %tmp_var_value21)
  %tmp_var_value22 = load i32, i32* %i
  %addtmp23 = add i32 %tmp_var_value22, 1
  store i32 %addtmp23, i32* %i
  br label %condition11

afterLoop13:                                      ; preds = %condition11
  ret i32 0
  ret i32 -1
}
