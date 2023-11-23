void main() {
  var s1 = Solution();
  // List<int> num1 = [1, 7, 3, 6, 5, 6]; // 3
  // List<int> num1 = [2, 1, -1];
  // List<int> num1 = [1, 2, 3]; // -1
  List<int> num1 = [-1, -1, -1, -1, -1, 0]; // 2
  // List<int> num1 = [-1, -1, -1, -1, -1, 1]; //
  // List<int> num1 = [-1, -1, -1, -1, 0, 1]; //
  // List<int> num1 = [-1, -1, -1, -1, 0, -1]; //
  int res;
  res = s1.pivotIndex(num1);
  print('index : $res');
}

class Solution {
  int pivotIndex(List<int> nums) {
    int maxSum = 0, leftSum = 0, rightSum = 0;
    List<int> prefixOfNums = List.filled(nums.length, 0);
    // print(nums);
    for (int i = 0; i < nums.length; i++) {
      maxSum += nums[i];
      prefixOfNums[i] = maxSum;
    }

    for (int i = 0; i < nums.length; i++) {
      leftSum = prefixOfNums[i] - nums[i];
      rightSum = maxSum - prefixOfNums[i];
      // print('left  ->  ${leftSum} | right ->  ${rightSum}');

      if (leftSum == rightSum) {
        return i;
      }
    }
    // print(prefixOfNums);

    return -1;
  }
}
