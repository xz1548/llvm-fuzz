./bootstrap
./configure CFLAGS=-fPIC CXXFLAGS=-fPIC CC=/home/kali/Desktop/llvm-fuzz/lab/task4/clangWrapper/build/clangWrapper  CXX=/home/kali/Desktop/llvm-fuzz/lab/task4/clangWrapper/build/clangWrapper++ --prefix=`pwd`/__install --enable-static=yes
make
make install
