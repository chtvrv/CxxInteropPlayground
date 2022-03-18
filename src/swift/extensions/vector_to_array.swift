import cxx

extension cxx_std_vector_of_int {
   mutating func swift_array() -> Array<Self.value_type> {
    var arr : [Self.value_type] = []
    for i in 0..<self.size() {
      arr.append(self[i])
    }
    return arr
  }
}