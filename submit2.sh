./Cmm matrix_m.cmm 
clang -fsanitize=safe-stack -o matrix_m.out test_out.ll -g
./linux-amd64_matrix ./matrix_m.out