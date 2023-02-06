#pragma once

#include <gtsam/nonlinear/NonlinearFactorGraph.h>

namespace foo {
class Foo {
 public:
  Foo(size_t num = 10);

  gtsam::NonlinearFactorGraph makeEmptyGraph();

  void set_num(size_t num);

  size_t get_num();

 private:
  size_t num_;
};

}  // namespace foo
