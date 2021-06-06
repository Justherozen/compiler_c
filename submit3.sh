./Cmm auto_adviser.cmm 
clang -fsanitize=safe-stack -o auto_adviser.out test_out.ll -g
./linux-amd64_auto_adviser ./auto_adviser.out