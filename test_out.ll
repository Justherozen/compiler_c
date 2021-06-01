; ModuleID = 'main'
source_filename = "main"

declare i32 @printf(i8*, ...)

declare i32 @scanf(...)

define i32 @main() {
entry:
  %i = alloca i32
  %j = alloca float
  store i32 0, i32* %i
  store float 5.000000e-01, float* %j
  ret i32 -1
}
