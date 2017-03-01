#include <gtest/gtest.h>

#include "../jvmclassfile/classfile.h"

TEST(BasicTests, LoadClass1) {
    ClassFile clazz("Uno");
		ASSERT_TRUE(clazz.getClassName() == "Uno");
}


int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
