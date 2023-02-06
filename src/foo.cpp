#include "foo.h"

namespace foo {

Foo::Foo(size_t num) {
  num_ = num;
}

gtsam::NonlinearFactorGraph Foo::makeEmptyGraph() {
  gtsam::NonlinearFactorGraph graph;
  return graph;
}

size_t Foo::get_num() {
  return num_;
}

void Foo::set_num(size_t num) {
  num_ = num;
}

}  // namespace foo
