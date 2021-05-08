/*
This program generates 250 random numbers in an array
and allows the user to search the array for a number.
author  Jay Lee
version 1.0
since   2020-05-07
*/

import Foundation

enum InvalidInputError : Error {
  case invalidInput
}

// This function uses recursion to reverse the string.
func BinarySearch(userArray: [Int], userNumber: Int, lowIndex: Int,
                  highIndex: Int) -> Int {
  if (lowIndex > highIndex) {
    return -1
  } else {
    let middleIndex = Int(Double(lowIndex + highIndex) / 2.0)
    if (userArray[middleIndex] < userNumber) {
      return BinarySearch(userArray: userArray, userNumber: userNumber,
                          lowIndex: middleIndex + 1, highIndex: highIndex)
    } else if (userArray[middleIndex] > userNumber) {
      return BinarySearch(userArray: userArray, userNumber: userNumber,
                          lowIndex: lowIndex, highIndex: middleIndex - 1);
    } else {
      return middleIndex; // FOUND IT!!
    }
  }
}

print("Binary Search Program")
do {
  var numberArray = [Int]()

  for _ in 0..<250 {
    numberArray.append(Int.random(in: 0...999))
  }
  numberArray.sort()
  print("\nSorted list of numbers:\n")

  for element in numberArray {
    print(String(format: "%03d", element), terminator:", ")
  }
  print("\n\n")

  print("What number are you searching for in the array"
        + " (integer between 0 and 999): ", terminator:"")
  guard let searchNumber = Int(readLine()!) else {
    throw InvalidInputError.invalidInput
  }
  if (searchNumber > 999 || searchNumber < 0) {
    throw InvalidInputError.invalidInput
  } else {
    let searchResult = BinarySearch(userArray: numberArray, userNumber: 
                  searchNumber, lowIndex: 0, highIndex: numberArray.count - 1)
    if (searchResult == -1) {
      print("Not Found")
    } else {
      print("Your number is in index: \(searchResult)")
    }
  }
} catch {
  print("ERROR: Invalid Input")
}
print("\nDone.")
