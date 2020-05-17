CC_32=i686-linux-gnu-gcc
CC_64=x86_64-linux-gnu-gcc

all: make_build_dir build/release32/hello build/release64/hello

make_build_dir:
	-mkdir -p build/obj32
	-mkdir -p build/obj64
	-mkdir -p build/release32
	-mkdir -p build/release64
	
build/release32/hello: build/obj32/hello.obj32
	$(CC_32) $< -o build/release32/hello

build/release64/hello: build/obj64/hello.obj64
	$(CC_64) $< -o build/release64/hello

.PHONY: all make_build_dir build/release_32/hello build/release_64/hello

HELLO_SRC: hello.c

clean:
	-rm -rf build

build/obj32/%.obj32 : %.c
	$(CC_32) -c $(CFLAGS_32) $(CPPFLAGS) $< -o $@

build/obj64/%.obj64 : %.c
	$(CC_64) -c $(CFLAGS_64) $(CPPFLAGS) $< -o $@

