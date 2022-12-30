sudo yum install -y screen git make gcc gcc-c++ ncurses-devel patch zstd perl-Data-Dumper perl-ExtUtils-MakeMaker perl-Thread-Queue

git clone https://github.com/abihf/fridge.git
cd fridge/
git submodule init
git submodule update
