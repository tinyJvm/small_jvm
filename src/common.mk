GCC=g++
CXXFLAGS=-O1 -Werror -Wall -std=c++14 -g
LDFLAGS=
INCLUDES=-I. -Iinclude/ -Iinclude/userland
LIBS=
DEBUG_FLAGS = #-M
LDFLAGS='-ldl'
#-Werror
NASM=nasm

BIN_DIR=bin

# the kernel image as generated by the build process
APP=$(BIN_DIR)/jvm.x
TINYJVMLIB=$(BIN_DIR)/jvmlib.a