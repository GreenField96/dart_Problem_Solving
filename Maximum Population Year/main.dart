void main() {
  var s1 = Solution();

  // List<List<int>> num1 = [
  //   [1950, 1961],
  //   [1960, 1971],
  //   [1970, 1981]
  // ]; //1960
  // List<List<int>> num1 = [
  //   [1993, 1999],
  //   [2000, 2010]
  // ]; //1993
  // List<List<int>> num1 = [
  //   [2033, 2034],
  //   [2039, 2047],
  //   [1998, 2042],
  //   [2047, 2048],
  //   [2025, 2029],
  //   [2005, 2044],
  //   [1990, 1992],
  //   [1952, 1956],
  //   [1984, 2014]
  // ]; //2006
  // List<List<int>> num1 = [
  //   [2025, 2041],
  //   [1988, 2007],
  //   [2003, 2046],
  //   [2045, 2049],
  //   [2025, 2027],
  //   [2014, 2040],
  //   [2014, 2027],
  //   [2011, 2027],
  //   [1972, 2019]
  // ];//2025
  List<List<int>> num1 = [
    [2008, 2026],
    [2004, 2008],
    [2034, 2035],
    [1999, 2050],
    [2049, 2050],
    [2011, 2035],
    [1966, 2033],
    [2044, 2049]
  ]; // 2011
  // List<List<int>> num1 = [
  //   [1950, 1961],
  //   [1960, 1971],
  //   [1970, 1981]
  // ]; // 1960

  int res = s1.maximumPopulation(num1);
  print('Result is : $res');
}

class Solution {
  int maximumPopulation(List<List<int>> logs) {
    List<int> year = List<int>.filled(2051, 0);

    // O(n) -> n is log.length

    for (List<int> log in logs) {
      year[log[0]] += 1;
      year[log[1]] -= 1;
    }

    int maxNum = year[1950], maxYear = 1950;

    // O(100) -> 2050 - 1950 = 100

    for (int i = 1951; i < year.length; i++) {
      year[i] += year[i - 1]; // Generating Prefix Sum

      if (year[i] > maxNum) {
        maxNum = year[i];
        maxYear = i;
      }
    }

    return maxYear;
  }
}

// class Solution {
//   int maximumPopulation(List<List<int>> logs) {
//     int countPop = 0, maxPop = 0, max_count_index = 0;
//     int lenghtOfLogs = logs.isEmpty ? 0 : logs.length * 2;

//     List<List<int>> timeLine =
//         List.generate(lenghtOfLogs, (i) => List.generate(2, (j) => 0));
//     int fillTimeCount = 0;
//     for (int i = 0; i < logs.length; i++) {
//       timeLine[fillTimeCount][0] = logs[i][0];
//       timeLine[fillTimeCount][1] = 0;
//       fillTimeCount++;
//       timeLine[fillTimeCount][0] = logs[i][1];
//       timeLine[fillTimeCount][1] = 1;
//       fillTimeCount++;
//     }

//     timeLine = sort2DList(timeLine);

//     for (int i = 0; i < timeLine.length; i++) {
//       if (timeLine[i][1] == 0) {
//         countPop++;
//         print('${timeLine[i]} decrease to : $countPop');
//       } else {
//         countPop = countPop >= 1 ? --countPop : 0;
//         print('${timeLine[i]} increase to : $countPop');
//       }
//       if (maxPop <= countPop) {
//         maxPop = countPop;
//         if (1 != countPop) max_count_index = i;
//       }
//     }

//     return timeLine[max_count_index][0];
//   }

//   List<List<int>> sort2DList(List<List<int>> timeLine) {
//     for (int i = 0; i < timeLine.length - 1; i++) {
//       for (int j = i + 1; j < timeLine.length; j++) {
//         if (timeLine[i][0] > timeLine[j][0]) {
//           List<int> temp = List.from(timeLine[i]);
//           timeLine[i] = List.from(timeLine[j]);
//           timeLine[j] = temp;
//         }
//       }
//     }
//     return timeLine;
//   }

//   void printList(List<List<int>> list, String message) {
//     int c = 1;
//     print('****************************************');
//     print('$message');
//     list.forEach((element) {
//       print('${c++}) ${element} ,');
//     });
//   }
// }
