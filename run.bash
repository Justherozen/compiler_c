./Cmm ./qsort.cmm 
clang -fsanitize=safe-stack -o a.out test_out.ll -g
./a.out
