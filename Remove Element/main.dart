void main() {
  var s1 = Solution();
  List<int> num1 = [0, 1, 2, 2, 3, 0, 4, 2]; //
  int val = 2;
  int k = 0;
  k = s1.removeElement(num1, val);

  for (int i = 0; i < k; i++) {
    print(num1[i]);
  }
}

class Solution {
  int removeElement(List<int> nums, int val) {
    int k = nums.length;
    nums.removeWhere((num) {
      if (num == val) {
        k--;
        return true;
      } else {
        return false;
      }
    });
    return k;
  }
}
