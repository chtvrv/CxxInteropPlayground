#include "cxx.h"

int cxx_sum(std::vector<int> &nums) {
  int sum = 0;
  for (auto& n : nums) {
     sum += n;
  }
  return sum;
}