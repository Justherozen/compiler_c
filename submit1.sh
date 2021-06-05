./Cmm qsort.cmm 
clang -fsanitize=safe-stack -o qsort.out test_out.ll -g
./linux-amd64_qsort ./qsort.out

