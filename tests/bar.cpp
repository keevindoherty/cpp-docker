// Include for test suite
#include <gtest/gtest.h>

#include "foo.h"

TEST(TestSuite, empty_graph) {
  foo::Foo foo;
  gtsam::NonlinearFactorGraph graph = foo.makeEmptyGraph();
  EXPECT_EQ(graph.size(), 0);
}

int main(int argc, char** argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
