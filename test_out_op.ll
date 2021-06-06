; ModuleID = 'test_out.ll'
source_filename = "main"

@x = local_unnamed_addr global i32 0
@y = local_unnamed_addr global i32 0
@z = local_unnamed_addr global i32 0

; Function Attrs: nofree norecurse nounwind writeonly
define i32 @main() local_unnamed_addr #0 {
entry:
  store i32 14, i32* @x, align 4
  store i32 21, i32* @y, align 4
  store i32 24, i32* @z, align 4
  ret i32 0
}

attributes #0 = { nofree norecurse nounwind writeonly }
