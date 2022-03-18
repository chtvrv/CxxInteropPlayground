import cxx
import std.vector

func test_vector_push_back() {
  let input: [CInt] = [1, 2, 3, 4, 5]
  var vector = std.vector<CInt, std.allocator<CInt>>()

  input.forEach { 
    var num = $0
    vector.push_back(&num)
  }

  assert(cxx_sum(&vector) == 15)
  assert(vector.swift_array() == input)

  print("test_vector_push_back succeeded.")
}