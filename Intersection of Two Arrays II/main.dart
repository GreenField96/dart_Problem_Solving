/*
*solution by Reshape the Matrix
class Solution {
  List<int> intersect(List<int> nums1, List<int> nums2) {
      List<int> returnList = [];
      for (int num2 in nums2) {
          if (nums1.contains(num2)) {
              returnList.add(num2);
              nums1.remove(num2);
          }
      }
      return returnList;
  }
*/

void main() {
  var s1 = Solution();
  List<int> num1 = [2, 2];
  List<int> num2 = [1, 2, 2, 1];

  List<int> res;
  res = s1.intersect(num1, num2);

  res.forEach((num) {
    print('${num} , ');
  });
}

class Solution {
  List<int> intersect(List<int> nums1, List<int> nums2) {
    List<int> res = [];
    for (int x = 0; x < nums1.length; x++) {
      for (int y = 0; y < nums2.length; y++) {
        if (nums1[x] == -1) {
          continue;
        } else if (nums1[x] == nums2[y]) {
          res.add(nums1[x]);
          nums1[x] = -1;
          nums2[y] = -1;
        }
      }
    }
    return res;
  }
}
