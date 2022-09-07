import Array "mo:base/Array";
import Int "mo:base/Int";

actor {

  func quicksort(arr: [var Int]) {
    sort(arr, 0, arr.size() -1);
  };
  
  func sort(arr: [var Int], left: Int, right: Int) {
    if (left >= right) return;
    let pivot = arr[Int.abs(left)];
    var i = Int.abs(left);
    var j = Int.abs(right);
    while (i < j) {
      while (arr[j] >= pivot and i < j) j -= 1;
      while (arr[i] <= pivot and i < j) i += 1;
      if (i < j) {
        let temp = arr[i];
        arr[i] := arr[j];
        arr[j] := temp;
      };
    };
    arr[Int.abs(left)] := arr[i];
    arr[i] := pivot;
    sort(arr, left, i - 1);
    sort(arr, i + 1, right);
  };

  public func qsort(arr: [Int]): async [Int] {
    let var_arr = Array.thaw<Int>(arr);
    quicksort(var_arr);
    Array.freeze(var_arr)
  };

};
